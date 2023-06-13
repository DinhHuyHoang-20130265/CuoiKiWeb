package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.OrderDetailService;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteOrderController", value = "/DeleteOrderController")
public class DeleteOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
       Xóa đơn hàng trong admin - Đinh Huy Hoàng 20130265
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        String order = request.getParameter("order");
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        String id = request.getParameter("id");
        OrderDetailService.getInstance().removeOrder(id);
        List<Order> orderList = OrderService.getInstance().getOrderListCondition(page, order, search);
        LogService.getInstance().addNewLog(admin, "order", "admin", "Admin " + admin + " đã xóa đơn hàng : " + id );
        request.setAttribute("orders", orderList);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadOrderListAdmin.jsp").forward(request, response);
    }
}
