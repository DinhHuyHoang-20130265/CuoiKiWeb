package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.NewsCommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "StatusCommentControllerAdmin", value = "/StatusCommentControllerAdmin")
public class StatusCommentControllerAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Trạng thái comment trong admin - Nguyễn Minh Hiếu 20130261
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        NewsCommentService.getInstance().ChangeStatusComment(id, status);
        LogService.getInstance().addNewLog(admin, "comment", "admin", "Admin " + admin + " đã chuyển đổi trạng thái bình luận : " + id + "(" + status +")");
    }
}
