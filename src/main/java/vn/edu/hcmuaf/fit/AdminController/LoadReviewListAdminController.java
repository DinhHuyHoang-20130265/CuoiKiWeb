package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.product.ProductReview;
import vn.edu.hcmuaf.fit.services.NewsCommentService;
import vn.edu.hcmuaf.fit.services.ProductReviewService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadReviewListAdminController", value = "/LoadReviewListAdminController")
public class LoadReviewListAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        List<ProductReview> loadReview = ProductReviewService.getInstance().loadAllReviewByPage(Integer.parseInt(page));
        request.setAttribute("loadReview", loadReview);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadReviewListAdmin.jsp").forward(request, response);
    }
}
