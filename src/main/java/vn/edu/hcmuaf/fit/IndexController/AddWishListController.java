package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.beans.wishlist.WishList;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddWishListController", value = "/AddWishListController")
public class AddWishListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id").substring(11);
        WishList wishList = (WishList) request.getSession().getAttribute("wishList");
        Product product = ProductService.getInstance().getProductAndDetails(id);
        wishList.put(product);
        request.getSession().setAttribute("wishList", wishList);
        request.getRequestDispatcher("ajax/ajax_addWishListSuccessful.jsp").forward(request, response);
    }
}
