package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.cart.Cart;
import vn.edu.hcmuaf.fit.beans.cart.CartKey;
import vn.edu.hcmuaf.fit.beans.wishlist.WishList;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProductWishListController", value = "/DeleteProductWishListController")
public class DeleteProductWishListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  /*
        Xóa sản phầm trong yêu thích Nguyễn Huy Hiệp - 20130258
        Sử dụng ajax
         */
        String id = request.getParameter("id").substring(6);
        WishList wishList = (WishList) request.getSession().getAttribute("wishList");
        wishList.remove(id);
        request.getSession().setAttribute("wishList", wishList);
        request.getRequestDispatcher("ajax/ajax_WishList.jsp").forward(request, response);
    }
}
