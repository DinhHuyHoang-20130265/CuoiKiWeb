package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.order.OrderDetail;
import vn.edu.hcmuaf.fit.services.OrderDetailService;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuickViewOrderController", value = "/QuickViewOrderController")
public class QuickViewOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idToggle");
        List<OrderDetail> list = OrderDetailService.getInstance().getListDetailsFromOrdId(id);
        request.setAttribute("order", OrderService.getInstance().getOrderById(id));
        request.setAttribute("list", list);
        request.getRequestDispatcher("ajax/ajax_QuickViewOrder.jsp").forward(request, response);
    }
}
