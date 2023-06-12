package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.import_product.ImportProduct;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ImportProductService;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteImportAdminController", value = "/DeleteImportAdminController")
public class DeleteImportAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String admin = request.getParameter("admin");
        ImportProductService.getInstance().removeImport(id);
        List<ImportProduct> imports = ImportProductService.getInstance().getListImport();
        LogService.getInstance().addNewLog(admin, "import_product", "admin", "Admin " + admin + " đã sản phẩm: " + id );
        request.setAttribute("imports", imports);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadImportListAdmin.jsp").forward(request, response);
    }
}
