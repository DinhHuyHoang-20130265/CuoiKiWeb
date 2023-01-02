package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.cart.Cart;
import vn.edu.hcmuaf.fit.beans.cart.CartKey;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProductCartController", value = "/DeleteProductCartController")
public class DeleteProductCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        Xóa sản phầm trong giỏ hàng Nguyễn Huy Hiệp - 20130258
        Sử dụng ajax
         */
        String id = request.getParameter("id");
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        CartKey key = new CartKey(id, color, size);
        cart.getData().remove(key);
//        cart.getQuantity_cart();
        request.getSession().setAttribute("cart", cart);
        request.getRequestDispatcher("ajax/ajax_Cart.jsp").forward(request, response);
    }
}
