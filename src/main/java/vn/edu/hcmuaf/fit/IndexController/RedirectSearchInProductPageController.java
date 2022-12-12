package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RedirectSearchInProductPageController", value = "/RedirectSearchInProductPageController")
public class RedirectSearchInProductPageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
           Nguyễn Minh Hiếu - 20130261
           Chuyển trang, hiển thị tất cả các sản phẩm tìm được
         */
        String search = request.getParameter("search");
        List<Product> products = ProductService.getInstance().loadProductWithCondition(1, 6, "0", "all", null, null, null, search);
        request.setAttribute("searchProduct", products);
        request.getRequestDispatcher("SearchProduct.jsp").forward(request, response);
    }
}
