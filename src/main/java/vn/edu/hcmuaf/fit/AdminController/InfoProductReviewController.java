package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.UserInformation;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.product.ProductReview;
import vn.edu.hcmuaf.fit.services.NewsCommentService;
import vn.edu.hcmuaf.fit.services.ProductReviewService;
import vn.edu.hcmuaf.fit.services.UserInformationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InfoProductReviewController", value = "/InfoProductReviewController")
public class InfoProductReviewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ProductReview review = ProductReviewService.getInstance().getReviewByIdReview(id);
        UserInformation userInformation = UserInformationService.getInstance().getUserInfo(review.getReview_by());
        request.setAttribute("review", review);
        request.setAttribute("info", userInformation);
        request.getRequestDispatcher("/admin-page/ajax/ajax_InfoReviewAdmin.jsp").forward(request, response);
    }
}
