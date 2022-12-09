package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "QuickViewController", value = "/QuickViewController")
public class QuickViewController extends HttpServlet {
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
        String id = request.getParameter("idQuickview").substring(4);
        Product product = ProductService.getInstance().getProductAndDetails(id);
        request.setAttribute("productDetails", product);
        request.getRequestDispatcher("ajax/ajax_QuickView.jsp").forward(request, response);
    }
}
