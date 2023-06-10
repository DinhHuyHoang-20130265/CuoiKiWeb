package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.DAO.ProductReviewDAO;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.ProductReviewService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteReviewController", value = "/DeleteReviewController")
public class DeleteReviewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Xóa review trong chi tiết sản phẩm - Nguyễn Huy Hiệp 20130258
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String productid = ProductReviewService.getInstance().getProductIdByReview(id);
        String username = ProductReviewService.getInstance().getUserIdByReview(id);
        LogService.getInstance().addNewLog(username,"review","customer","Người dùng "+ username + " đã xóa đánh giá " + id + " ở sản phẩm: " + productid);
        ProductReviewService.getInstance().RemoveReview(id);
    }
}
