package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.NewsCommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteCommentController", value = "/DeleteCommentController")
public class DeleteCommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Xóa bình luận trang tin tức - Nguyễn Minh Hiếu 20130261
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String username = NewsCommentService.getInstance().getUserByIdComment(id);
        LogService.getInstance().addNewLog(username,"comment","customer","Người dùng "+ username + " đã xóa bình luận " + id);
        NewsCommentService.getInstance().RemoveComment(id);
    }
}
