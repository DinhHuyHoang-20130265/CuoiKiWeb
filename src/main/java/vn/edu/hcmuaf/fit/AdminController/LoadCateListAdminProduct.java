package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.NewsCommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadCateListAdminProduct", value = "/LoadCateListAdminProduct")
public class LoadCateListAdminProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        List<Category> categories = CategoryService.getInstance().loadloadCategoryWithConditionContainsStatus(Integer.parseInt(page), 6);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadCateListAdmin.jsp").forward(request, response);
    }
}
