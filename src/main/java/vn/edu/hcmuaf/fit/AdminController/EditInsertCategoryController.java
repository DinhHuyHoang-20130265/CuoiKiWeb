package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditInsertCategoryController", value = "/EditInsertCategoryController")
public class EditInsertCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
       Thêm/sửa category trong admin - Nguyễn Huy Hiệp 20130258
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        int status = Integer.parseInt(request.getParameter("status"));
        String idCateParent = request.getParameter("idCateParent");
        String content = request.getParameter("content");
        if (id.length() < 1) {
            CategoryService.getInstance().InsertNewCategory(name, content, idCateParent, status);
            LogService.getInstance().addNewLog(admin, "category", "admin", "Admin " + admin + " đã thêm cate mới : " + name );
        } else {
            CategoryService.getInstance().UpdateCategory(id, name, content, idCateParent, status);
            LogService.getInstance().addNewLog(admin, "category", "admin", "Admin " + admin + " đã chỉnh sửa cate : " + id );
        }
    }
}
