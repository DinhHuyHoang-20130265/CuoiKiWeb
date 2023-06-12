package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateDeliveryStatus", value = "/UpdateDeliveryStatus")
public class UpdateDeliveryStatus extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Cập nhật trạng thái giao hàng trong admin - Đinh Huy Hoàng 20130258
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        String admin = request.getParameter("admin");
        OrderService.getInstance().UpdateDeliveryStatus(id, status);
        LogService.getInstance().addNewLog(admin, "order", "admin", "Admin " + admin + " đã chuyển đổi trạng thái giao hàng : " + id + "(" + status +")");
    }
}
