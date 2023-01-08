package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.DAO.OrderDAO;
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        OrderService.getInstance().UpdatePaymentStatus(id);
    }
}
