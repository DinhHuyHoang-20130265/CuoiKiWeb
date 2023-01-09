package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.services.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteCateAdminController", value = "/DeleteCateAdminController")
public class DeleteCateAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
       Xóa category trong admin - Nguyễn Huy Hiệp 20130258
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String page = request.getParameter("page");
        CategoryService.getInstance().RemoveCate(id);
        List<Category> categories = CategoryService.getInstance().loadloadCategoryWithConditionContainsStatus(Integer.parseInt(page), 6);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadCateListAdmin.jsp").forward(request, response);
    }
}
