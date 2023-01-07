package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.news.News;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.NewsService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadNewsListAdminController", value = "/LoadNewsListAdminController")
public class LoadNewsListAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = Integer.parseInt(request.getParameter("pageNumb"));
        List<News> loadNews = NewsService.getInstance().getListNewsByPage(page);
        request.setAttribute("loadNews", loadNews);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadNewsListAdmin.jsp").forward(request, response);
    }
}
