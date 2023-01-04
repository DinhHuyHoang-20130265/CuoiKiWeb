package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.UserInformation;
import vn.edu.hcmuaf.fit.beans.cart.Cart;
import vn.edu.hcmuaf.fit.services.AccountService;
import vn.edu.hcmuaf.fit.services.UserInformationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateUserController", value = "/UpdateUserController")
public class UpdateUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String diachi = request.getParameter("diachi");
        String sdt = request.getParameter("sdt");
        AccountService.getInstance().UpdateUserInfo(id,fullName, email , diachi, sdt);
        UserInformation userInfo = (UserInformation) request.getSession().getAttribute("userInfo");
        request.getSession().setAttribute("userInfo", userInfo);
        request.getRequestDispatcher("/admin-page/ajax/ajax_UpdateUserInfo.jsp").forward(request, response);
    }
}
