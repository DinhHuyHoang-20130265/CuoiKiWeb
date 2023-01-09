package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.slide.Slide;
import vn.edu.hcmuaf.fit.services.NewsCommentService;
import vn.edu.hcmuaf.fit.services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadListSlideController", value = "/LoadListSlideController")
public class LoadSlideListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Load more danh sách slide trong admin - Nguyễn Huy Hiệp 20130258
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        List<Slide> loadSlide = SlideService.getInstance().getAllSlideByPage(Integer.parseInt(page));
        request.setAttribute("loadSlide", loadSlide);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadSlideListAdmin.jsp").forward(request, response);
    }
}
