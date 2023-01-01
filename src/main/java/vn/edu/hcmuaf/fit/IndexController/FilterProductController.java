package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FilterProductController", value = "/FilterProductController")
public class FilterProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         /*
            lọc sản phẩm Đinh Huy Hoàng - 20130265
            sử dụng ajax
         */
        String price = request.getParameter("price");
        String orderby = request.getParameter("orderby");
        String color = null;
        if (request.getParameter("color") != null)
            color = request.getParameter("color");
        String size = null;
        if (request.getParameter("size") != null)
            size = request.getParameter("size");
        String page = request.getParameter("page");
        String category = request.getParameter("category");
        List<Product> next6Product = ProductService.getInstance().loadProductWithCondition(Integer.parseInt(page), 6, orderby, category, color, price, size, null);
        request.setAttribute("next6Product", next6Product);
        request.getRequestDispatcher("ajax/ajax_LoadProduct.jsp").forward(request, response);
    }
}
