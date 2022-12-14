package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.cart.Cart;
import vn.edu.hcmuaf.fit.beans.cart.CartKey;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "IncreaseDecreaseQuantityController", value = "/IncreaseDecreaseQuantityController")
public class IncreaseDecreaseQuantityController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         /*
        Tăng, giảm số lượng sản phầm trong giỏ hàng và cập nhật thành tiền
        Nguyễn Huy Hiệp - 20130258
        Sử dụng ajax
         */
        String idUpd = request.getParameter("idUpd");
        int amount = Integer.parseInt(request.getParameter("amount"));
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        CartKey key = new CartKey(idUpd, color, size);
        if (cart.getData().containsKey(key)) {
            Product product = cart.getData().get(key);
            product.setQuantity_cart(amount);
        }
        request.getSession().setAttribute("cart", cart);
        request.getRequestDispatcher("ajax/ajax_Cart.jsp").forward(request, response);
    }
}
