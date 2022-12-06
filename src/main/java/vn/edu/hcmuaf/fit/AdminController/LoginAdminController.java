package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.*;
import vn.edu.hcmuaf.fit.services.AdminLoginService;
import vn.edu.hcmuaf.fit.services.ReCAPTCHAService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "LoginAdminController", value = "/LoginAdminController")
public class LoginAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        Đăng nhập admin làm bởi Đinh Huy Hoàng - 20130265
        */
        //  Lấy dữ liệu
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        AdminLoginService service = new AdminLoginService();
        //  Lưu biến thông báo
        AdminLogin loginAdmin = new AdminLogin("", remember);
        boolean notify = false;
        // remove session của lấy lại mật khẩu nếu có
        ForgotPasswordStatus forgotPassword = (ForgotPasswordStatus) request.getSession().getAttribute("forgotPasswordAdmin");
        if (forgotPassword != null)
            request.getSession().removeAttribute("forgotPasswordAdmin");
        //  Kiểm tra xem thử đúng tài khoản có đúng hay không
        String user = service.getInstance().stringAccountAdminUser(username);

        //  Nếu mã tài khoản trả về là null thì nhập sai tài khoản rồi
        if (user == null) {
            notify = true;
            loginAdmin.setNotifyAccount(true);
            loginAdmin.setContent("Bạn nhập sai tài khoản");
        } else {
            //  Tiếp theo kiểm tra xem tài khoản đúng rồi mà hiện tại nó bị vô hiệu hóa hay chưa
            boolean isActive = service.getInstance().statusAccountAdminUser(username);
            //  Nếu tài khoản bị vô hiệu hóa thì thông báo
            if (!isActive) {
                notify = true;
                loginAdmin.setNotifyAccount(true);
                loginAdmin.setContent("Tài khoản của bạn đã bị vô hiệu hóa");
            } else {
                String captcha = request.getParameter("g-recaptcha-response");
                boolean check = ReCAPTCHAService.getInstance().verify(captcha);
                if (!check) {
                    notify = true;
                    loginAdmin.setNotifyPassword(true);
                    loginAdmin.setAccount(username);
                    loginAdmin.setContent("Bạn chưa check capcha");
                } else {
                    //  Tới đây thì tài khoản của bạn đã oke rồi
                    AdminUser admin = service.getInstance().getAccountAdminUser(username, password);

                    //  Nếu không đúng mật khẩu thì lưu lại tài khoản
                    if (admin == null) {
                        notify = true;
                        loginAdmin.setNotifyPassword(true);
                        loginAdmin.setAccount(username);
                        loginAdmin.setContent("Bạn nhập sai mật khẩu");
                    }
                }
            }
        }
        //  Nếu như có thông báo thì bạn đã nhập sai
        if (notify) {
            // Tới trang đăng nhập thì ta xóa remember account khỏi sesstion
            request.getSession().removeAttribute("rememberAccount");
            // Lưu vô session rồi sendRedirect
            request.getSession().setAttribute("loginAdmin", loginAdmin);
            response.sendRedirect("admin-page/login.jsp");

        } else {
            //  Nếu tới đây là oke hết rồi, chuyển admin tới index
            //  trước đó phải lưu vô session
            //  1. Lấy AccountAdmin
            AdminUser account = service.getInstance().getAccountAdminUser(username, password);

            //  2. Lấy role của account này và set cho nó
            List<AdminRole> role = service.getInstance().getListRole(username);
            account.setRole(role);

            //  Tạo đối tượng admin rồi lưu vào session
            request.getSession().setAttribute("userAdmin", account);

            //  Kiểm tra xem thứ có nhớ mật khẩu hay không. có thì tạo một đối tượng rememberAccount lưu vào session
            if (remember != null) {
                RememberAccount rememberAccount = new RememberAccount(username, password);
                request.getSession().setAttribute("rememberAccount", rememberAccount);
            }
            //  sendirect tới index
            response.sendRedirect("admin-page/index.jsp");

        }

    }
}
