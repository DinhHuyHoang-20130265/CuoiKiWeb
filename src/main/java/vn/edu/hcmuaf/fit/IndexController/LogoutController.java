package vn.edu.hcmuaf.fit.IndexController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LogoutController", urlPatterns = "/LogoutController")
public class LogoutController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        Đăng nhập làm bởi Đinh Huy Hoàng - 20130265
        */
        // Lấy session từ web
        HttpSession session = request.getSession();
        // kiểm tra session có attribute user có tồn tại không,
        // nếu có thì thực hiện invalidate session, gửi trả người dùng về trang login
        if (session.getAttribute("user") != null) {
            session.invalidate();
            response.sendRedirect("Login.jsp");
        }
    }
}
