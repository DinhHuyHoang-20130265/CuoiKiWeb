package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.cart.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateQuantityCartController", value = "/UpdateQuantityCartController")
public class UpdateQuantityCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
            Cập nhật lại số lượng trong giỏ hàng trên header - Nguyễn Huy Hiệp - 20130258
         */
        String id = request.getParameter("id");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        request.getSession().setAttribute("cart", cart);
        request.getRequestDispatcher("ajax/ajax_addCartSuccessful.jsp").forward(request, response);
    }
}
