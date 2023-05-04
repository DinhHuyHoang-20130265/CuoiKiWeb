package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.NewsCommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CommentController", value = "/CommentController")
public class CommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Bình luận trang tin tức - Nguyễn Minh Hiếu 20130261
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String comment = request.getParameter("comment");
        String NewsId = request.getParameter("newsid");
        String Comment_id = NewsCommentService.getInstance().AddNewComment(id, comment, NewsId);
        String username = NewsCommentService.getInstance().getUserByIdComment(id);
        NewsComment news = NewsCommentService.getInstance().getNewsCommentByIdComment(Comment_id);
        LogService.getInstance().addNewLog(username,"comment","Người dùng "+ username + " đã bình luận vào tin tức " + id);
        request.setAttribute("new_comment", news);
        request.getRequestDispatcher("ajax/ajax_showNewComment.jsp").forward(request, response);
    }
}
