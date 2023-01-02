package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.news.NewsComment;
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String comment = request.getParameter("comment");
        String NewsId = request.getParameter("newsid");
        String Comment_id = NewsCommentService.getInstance().AddNewComment(id, comment, NewsId);
        List<NewsComment> newsComment = NewsCommentService.getInstance().getNewsCommentByNews(NewsId, "0");
        NewsComment news = null;
        for (NewsComment n : newsComment) {
            if (n.getComment_id().equals(Comment_id)) {
                news = n;
            }
        }
        request.setAttribute("new_comment", news);
        request.getRequestDispatcher("ajax/ajax_showNewComment.jsp").forward(request, response);
    }
}
