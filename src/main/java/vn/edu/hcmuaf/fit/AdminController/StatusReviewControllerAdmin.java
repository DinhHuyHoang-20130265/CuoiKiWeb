package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.NewsCommentService;
import vn.edu.hcmuaf.fit.services.ProductReviewService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "StatusReviewControllerAdmin", value = "/StatusReviewControllerAdmin")
public class StatusReviewControllerAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Trạng thái review trong admin - Nguyễn Minh Hiếu 20130261
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        String admin = request.getParameter("admin");
        ProductReviewService.getInstance().ChangeStatusReview(id, status);
        LogService.getInstance().addNewLog(admin, "review", "admin", "Admin " + admin + " đã chuyển đổi trạng thái review : " + id + "(" + status +")");
    }
}
