package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadProductListAdminProduct", value = "/LoadProductListAdminProduct")
public class LoadProductListAdminProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        * Đinh Huy Hoàng - 20130265
        * Load more sản phẩm giao diện quản lý sản phẩm, kết hợp orderby và tìm kiếm
        * */
        String page = request.getParameter("page");
        String orderby = request.getParameter("orderby");
        String search = request.getParameter("search");
        List<Product> products = ProductService.getInstance().loadProductWithConditionContainsStatus(Integer.parseInt(page), 6, orderby, "all", null, null, null, search);
        request.setAttribute("product", products);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadProductListAdminProduct.jsp").forward(request, response);
    }
}
