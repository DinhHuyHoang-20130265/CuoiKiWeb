package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchProductController", value = "/SearchProductController")
public class SearchProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        int numb = ProductService.getInstance().getListProduct().size();
        List<Product> productSearch = ProductService.getInstance().loadProductWithCondition(1, numb, "0", "all", null, null, null, search);
        request.setAttribute("productSearch", productSearch);
        request.getRequestDispatcher("ajax/ajax_SearchProduct.jsp").forward(request, response);
    }
}
