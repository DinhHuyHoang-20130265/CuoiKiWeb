package vn.edu.hcmuaf.fit.IndexController;

import com.mysql.cj.log.Log;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.services.LoginService;

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
        // lấy ra user với username và pass ở trên kiểm tra có hay k ?
        SiteUser account = LoginService.getInstance().getAccountCustomer(username, pass);
        // nếu khác null chứng tỏ đăng nhập đúng. add user vào session User , trả về trang index;
        // System.out.println(LoginUserModel.getInstance().getStatus());
        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", account);
            response.sendRedirect("index.jsp");
        } else { // nếu = null chứng tỏ sai
            request.setAttribute("loginStatus", LoginService.getInstance().getStatus());
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
