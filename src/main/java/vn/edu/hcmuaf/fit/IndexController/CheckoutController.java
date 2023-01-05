package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.DAO.OrderDAO;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.beans.cart.Cart;
import vn.edu.hcmuaf.fit.beans.cart.CartKey;
import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.services.OrderDetailService;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CheckoutController", value = "/CheckoutController")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ord_id = new OrderDAO().generateIdOrder();
        String address = request.getParameter("address");
        String receive_name = request.getParameter("receive_name");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("phone_number");
        String note = request.getParameter("note");
        int payment_method = Integer.parseInt(request.getParameter("payment_method"));
        double total = Double.parseDouble(request.getParameter("total"));
        String customer_id = request.getParameter("customer_id");

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        OrderService.getInstance().insertOrder(ord_id, payment_method, total, address, receive_name, email, phone_number, note, customer_id);
        for (CartKey p: cart.getData().keySet()) {
            String prod_id = cart.getData().get(p).getId();
            String prod_name = cart.getData().get(p).getProd_name();
            String prod_color = p.getColor();
            String prod_size = p.getSize();
            int quantity = cart.getData().get(p).getQuantity_cart();
            double price = 0;
            if (cart.getData().get(p).getSales() != null) {
                price = (cart.getData().get(p).getPrice() * 0.01 * (100 - cart.getData().get(p).getSales().getDiscount_rate())) * quantity;
            }
            else {
                price = cart.getData().get(p).getPrice() * quantity;
            }
            OrderDetailService.getInstance().insertOrderDetail(ord_id, prod_id, prod_name, prod_color, prod_size, quantity, price);
        }
        request.getSession().setAttribute("cart", new Cart());
        response.sendRedirect("index.jsp");
    }
}
