package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.product.ProductReview;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.NewsCommentService;
import vn.edu.hcmuaf.fit.services.ProductReviewService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteReviewControllerAdmin", value = "/DeleteReviewControllerAdmin")
public class DeleteReviewControllerAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
      Xóa review trong admin - Nguyễn Minh Hiếu 20130261
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int page = Integer.parseInt(request.getParameter("page"));
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        ProductReviewService.getInstance().RemoveReview(id);
        List<ProductReview> list = ProductReviewService.getInstance().loadAllReviewByPage(page);
        LogService.getInstance().addNewLog(admin, "review", "admin", "Admin " + admin + " đã xóa review : " + id );
        request.setAttribute("loadReview", list);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadReviewListAdmin.jsp").forward(request, response);
    }
}
