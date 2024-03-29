package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.DAO.OrderDAO;
import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdatePaymentStatus", value = "/UpdatePaymentStatus")
public class UpdatePaymentStatus extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Cập nhật trạng thái thanh toán trong admin - Đinh Huy Hoàng 20130258
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        OrderService.getInstance().UpdatePaymentStatus(id);
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        LogService.getInstance().addNewLog(admin, "order", "admin", "Admin " + admin + " đã cập nhật trạng thái thanh toán : " + id);
    }
}
