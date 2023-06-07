package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.import_product.ImportProduct;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ImportProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadImportListAdminProduct", value = "/LoadImportListAdminProduct")
public class LoadImportListAdminProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        List<ImportProduct> imports = ImportProductService.getInstance().loadImportWithConditionContainsStatus(Integer.parseInt(page), 6);
    }
}
