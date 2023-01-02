package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.news.News;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.services.NewsCommentService;
import vn.edu.hcmuaf.fit.services.NewsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadNewsCommentController", value = "/LoadNewsCommentController")
public class LoadNewsCommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("newsid");
        String order_by = request.getParameter("order_by");
        String page = request.getParameter("page");
        List<NewsComment> loadNewsComment = NewsCommentService.getInstance().getNewsCommentByNews(page, id, order_by);
        request.setAttribute("loadNewsComment", loadNewsComment);
        request.getRequestDispatcher("ajax/ajax_loadNewsComment.jsp").forward(request, response);
    }
}
