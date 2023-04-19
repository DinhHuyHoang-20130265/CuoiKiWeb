package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.AccountService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadUserListAdmin", value = "/LoadUserListAdmin")
public class LoadUserListAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Load more danh sách tài khoản trong admin - Đinh Huy Hoàng 20130265
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        List<SiteUser> users = AccountService.getInstance().loadAccountWithConditions(Integer.parseInt(page), 6, search);
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadAccount.jsp").forward(request, response);
    }
}
