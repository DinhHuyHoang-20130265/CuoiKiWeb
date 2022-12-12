package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadMoreProductSearchController", value = "/LoadMoreProductSearchController")
public class LoadMoreProductSearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
           Nguyễn Minh Hiếu - 20130261
           Load thêm các sản phẩm tìm được ở trang danh sách sản phẩm tìm thấy
         */
        int page = Integer.parseInt(request.getParameter("page"));
        String search = request.getParameter("search");
        List<Product> products = ProductService.getInstance().loadProductWithCondition(page, 6, "0", "all", null, null, null, search);
        request.setAttribute("next6ProductSearch", products);
        request.getRequestDispatcher("ajax/ajax_LoadMoreSearchProduct.jsp").forward(request, response);
    }
}
