package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteProductAdminController", value = "/DeleteProductAdminController")
public class DeleteProductAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
       Xóa sản phẩm trong admin - Đinh Huy Hoàng 20130265
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int page = Integer.parseInt(request.getParameter("page"));
        String orderby = request.getParameter("orderby");
        String search = request.getParameter("search");
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        ProductService.getInstance().RemoveProduct(id);
        List<Product> products = ProductService.getInstance().loadProductWithConditionContainsStatus(page, 6, orderby, "all", null, null, null, search);
        LogService.getInstance().addNewLog(admin, "product", "admin", "Admin " + admin + " đã xóa sản phẩm: " + id );
        request.setAttribute("product", products);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadProductListAdminProduct.jsp").forward(request, response);
    }
}
