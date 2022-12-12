package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.news.News;
import vn.edu.hcmuaf.fit.services.NewsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadMoreNewsController", value = "/LoadMoreNewsController")
public class LoadMoreNewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = Integer.parseInt(request.getParameter("page"));
        List<News> loadAllNews = NewsService.getInstance().getListNewsByPage(page);
        request.setAttribute("loadAllNews", loadAllNews);
        request.getRequestDispatcher("ajax/ajax_loadAllNews.jsp").forward(request, response);

    }
}
