package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.cart.Cart;
import vn.edu.hcmuaf.fit.beans.cart.CartKey;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCartController", value = "/AddCartController")
public class AddCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         /*
            Thêm sản phẩm vào giỏ hàng Nguyễn Huy Hiệp - 20130258
         */
        String idAdd = request.getParameter("idAdd").substring(7);
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        String quantity = request.getParameter("amount");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        Product product = ProductService.getInstance().getProductAndDetails(idAdd);
        product.setQuantity_cart(Integer.parseInt(quantity));
        cart.put(new CartKey(idAdd, color.substring(0, color.indexOf("-")), size), product);
        request.getSession().setAttribute("cart", cart);
        request.getRequestDispatcher("ajax/ajax_addCartSuccessful.jsp").forward(request, response);
    }
}
