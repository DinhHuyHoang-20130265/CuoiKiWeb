package vn.edu.hcmuaf.fit.AdminController;

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
        NewsCommentService.getInstance().ChangeStatusComment(id, status);
    }
}
