package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.OrderDetailService;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RollbackOrderController", value = "/RollbackOrderController")
public class RollbackOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /*
       khôi phục đơn hàng trong admin - Đinh Huy Hoàng 20130265
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        String order = request.getParameter("order");
        String id = request.getParameter("id");
        String admin = request.getParameter("admin");
        OrderDetailService.getInstance().rollbackOrder(id);
        List<Order> orderList = OrderService.getInstance().getDeletedOrderListCondition(page, order, search);
        LogService.getInstance().addNewLog(admin, "deleted_order", "admin", "Admin " + admin + " đã rollback lại đơn hàng : " + id );
        request.setAttribute("Deletedorders", orderList);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadDeletedOrderListAdmin.jsp").forward(request, response);
    }
}
