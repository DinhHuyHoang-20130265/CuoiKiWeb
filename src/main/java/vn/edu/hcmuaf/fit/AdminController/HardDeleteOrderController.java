package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.OrderDetailService;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HardDeleteOrderController", value = "/HardDeleteOrderController")
public class HardDeleteOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /*
       Xóa đơn hàng hard trong admin - Đinh Huy Hoàng 20130265
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        String order = request.getParameter("order");
        String id = request.getParameter("id");
        String admin = request.getParameter("admin");
        OrderDetailService.getInstance().hardRemoveOrder(id);
        List<Order> orderList = OrderService.getInstance().getDeletedOrderListCondition(page, order, search);
        LogService.getInstance().addNewLog(admin, "deleted_order", "admin", "Admin " + admin + " đã xóa vĩnh viễn đơn hàng : " + id );
        request.setAttribute("Deletedorders", orderList);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadDeletedOrderListAdmin.jsp").forward(request, response);
    }
}

