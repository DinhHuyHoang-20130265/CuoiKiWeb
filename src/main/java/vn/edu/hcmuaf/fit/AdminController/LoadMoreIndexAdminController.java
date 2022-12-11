package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadMoreIndexAdminController", value = "/LoadMoreIndexAdminController")
public class LoadMoreIndexAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
         * Đinh Huy Hoàng -20130265
         * sử dụng ajax
         * */
        int page = Integer.parseInt(request.getParameter("page"));
        List<Product> next6Product = ProductService.getInstance().loadProductWithCondition(page, 6, "7", "all", null, null, null, null);
        System.out.println(next6Product);
        request.setAttribute("next6Product", next6Product);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadAdminProduct.jsp").forward(request, response);
    }
}
