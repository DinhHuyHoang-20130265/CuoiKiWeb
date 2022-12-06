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
        String page = request.getParameter("page");
        String category = request.getParameter("category");
        List<Product> next6Product = ProductService.getInstance().loadProductWithCondition(Integer.parseInt(page), 6, null, category, null, null, null, null);
        request.setAttribute("next6Product", next6Product);
        request.getRequestDispatcher("ajax/ajax_LoadProduct.jsp").forward(request, response);
    }
}
