package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.services.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteAccountController", value = "/DeleteAccountController")
public class DeleteAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
        Xóa account trong admin - Đinh Huy Hoàng 20130265
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int page = Integer.parseInt(request.getParameter("page"));
        String search = request.getParameter("search");
        AccountService.getInstance().RemoveAccount(id);
        List<SiteUser> users = AccountService.getInstance().loadAccountWithConditions(page, 6, search);
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadAccount.jsp").forward(request, response);
    }
}
