package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.UserInformation;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.services.NewsCommentService;
import vn.edu.hcmuaf.fit.services.UserInformationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InfoCommentController", value = "/InfoCommentController")
public class InfoCommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        NewsComment comment = NewsCommentService.getInstance().getNewsCommentByIdComment(id);
        UserInformation userInformation = UserInformationService.getInstance().getUserInfo(comment.getComment_by());
        request.setAttribute("comment", comment);
        request.setAttribute("info", userInformation);
        request.getRequestDispatcher("/admin-page/ajax/ajax_InfoCommentAdmin.jsp").forward(request, response);
    }
}
