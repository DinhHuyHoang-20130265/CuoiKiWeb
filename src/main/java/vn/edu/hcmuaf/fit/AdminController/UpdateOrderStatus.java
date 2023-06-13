package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateOrderStatus", value = "/UpdateOrderStatus")
public class UpdateOrderStatus extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Cập nhật trạng thái đặt hàng trong admin - Đinh Huy Hoàng 20130258
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        OrderService.getInstance().UpdateOrderStatus(id);
        LogService.getInstance().addNewLog(admin, "order", "admin", "Admin " + admin + " đã xác thực đơn hàng : " + id);
    }
}
