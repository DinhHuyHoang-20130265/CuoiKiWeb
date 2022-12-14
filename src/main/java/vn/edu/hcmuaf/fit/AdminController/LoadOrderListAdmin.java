package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadOrderListAdmin", value = "/LoadOrderListAdmin")
public class LoadOrderListAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Load more danh sách đơn hàng trong admin - Đinh Huy Hoàng 20130265
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        String order = request.getParameter("order");
        List<Order> orderList = OrderService.getInstance().getOrderListCondition(page, order, search);
        request.setAttribute("orders", orderList);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadOrderListAdmin.jsp").forward(request, response);
    }
}
