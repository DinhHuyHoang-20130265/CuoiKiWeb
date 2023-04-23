package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.DAO.SiteUserDAO;
import vn.edu.hcmuaf.fit.beans.ForgotPasswordStatus;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.beans.cart.Cart;
import vn.edu.hcmuaf.fit.beans.wishlist.WishList;
import vn.edu.hcmuaf.fit.services.AccountService;
import vn.edu.hcmuaf.fit.services.LoginService;
import vn.edu.hcmuaf.fit.services.NotifyService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginUserController", value = "/LoginUserController")
public class LoginUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        Đăng nhập làm bởi Đinh Huy Hoàng - 20130265
        */
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String message = AccountService.getInstance().getUserIdNotify(username);
        // remove session của lấy lại mật khẩu, và của bên trang đăng ký nếu có
        ForgotPasswordStatus forgotPassword = (ForgotPasswordStatus) request.getSession().getAttribute("forgotPassword");
        String success = (String) request.getSession().getAttribute("success");
        if (forgotPassword != null)
            request.getSession().removeAttribute("forgotPassword");
        if (success != null)
            request.getSession().removeAttribute("success");
        // lấy ra user với username và pass ở trên kiểm tra có hay k ?
        SiteUser account = LoginService.getInstance().getAccountCustomer(username, pass);
        // nếu khác null chứng tỏ đăng nhập đúng. add user vào session User , trả về trang index;
        // System.out.println(LoginUserModel.getInstance().getStatus());
        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", account);
            session.setAttribute("cart", new Cart());
            session.setAttribute("wishList", new WishList());
            response.sendRedirect("index.jsp");
            NotifyService.getInstance().addNewNotify(message + " đã đăng nhập thành công ",null ,"login");
        } else { // nếu = null chứng tỏ sai
            NotifyService.getInstance().addNewNotify(message + " đã cố đăng nhập vào hệ thống ",null ,"login");
            request.setAttribute("loginStatus", LoginService.getInstance().getStatus());
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
