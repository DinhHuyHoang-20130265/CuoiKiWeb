package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.LogService;

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
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        CategoryService.getInstance().RemoveCate(id);
        List<Category> categories = CategoryService.getInstance().loadloadCategoryWithConditionContainsStatus(Integer.parseInt(page), 6);
        LogService.getInstance().addNewLog(admin, "category", "admin", "Admin " + admin + " đã xóa danh mục : " + id );
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadCateListAdmin.jsp").forward(request, response);
    }
}
