package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.services.AccountService;
import vn.edu.hcmuaf.fit.services.LogService;

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
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        AccountService.getInstance().RemoveAccount(id);
        List<SiteUser> users = AccountService.getInstance().loadAccountWithConditions(page, 6, search);
        LogService.getInstance().addNewLog(admin, "account", "admin", "Admin " + admin + " đã xóa tài khoản: " + id );
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadAccount.jsp").forward(request, response);
    }
}
