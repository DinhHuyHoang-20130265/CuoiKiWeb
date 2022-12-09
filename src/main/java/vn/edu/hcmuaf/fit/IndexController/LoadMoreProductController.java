package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadMoreProductController", value = "/LoadMoreProductController")
public class LoadMoreProductController extends HttpServlet {
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
        System.out.println(price);
        System.out.println(orderby);
        System.out.println(color);
        System.out.println(page);
        System.out.println(category);
        List<Product> next6Product = ProductService.getInstance().loadProductWithCondition(Integer.parseInt(page), 6, orderby, category, color, price, size, null);
        request.setAttribute("next6Product", next6Product);
        request.getRequestDispatcher("ajax/ajax_LoadProduct.jsp").forward(request, response);
        System.out.println(next6Product.size());
    }
}
