package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.news.News;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.services.NewsCommentService;
import vn.edu.hcmuaf.fit.services.NewsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteNewsControllerAdmin", value = "/DeleteNewsControllerAdmin")
public class DeleteNewsControllerAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int page = Integer.parseInt(request.getParameter("page"));
        NewsService.getInstance().RemoveNews(id);
        List<News> loadNews = NewsService.getInstance().getListNewsByPage(page);
        request.setAttribute("loadNews", loadNews);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadNewsListAdmin.jsp").forward(request, response);
    }
}
