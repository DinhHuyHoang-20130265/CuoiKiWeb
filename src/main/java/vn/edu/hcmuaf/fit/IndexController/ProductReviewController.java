package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.product.ProductReview;
import vn.edu.hcmuaf.fit.services.ProductReviewService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductReviewController", value = "/ProductReviewController")
public class ProductReviewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String comment = request.getParameter("comment");
        String productid = request.getParameter("productid");
        int stars = Integer.parseInt(request.getParameter("stars"));
        String productReviewId = ProductReviewService.getInstance().AddNewReview(id, productid, comment, stars);
        System.out.println(comment);
        ProductReview productReview = ProductReviewService.getInstance().getReviewByIdReview(productReviewId);
        request.setAttribute("product_review", productReview);
        request.getRequestDispatcher("ajax/ajax_showLatestReview.jsp").forward(request, response);
    }
}
