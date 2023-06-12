package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.promotion.Promotion;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.PromotionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DeletePromotionAdminController", value = "/DeletePromotionAdminController")
public class DeletePromotionAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
      Xóa giảm giá trong admin - Nguyễn Huy Hiệp 20130258
   */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String page = request.getParameter("page");
        String admin = request.getParameter("admin");
        PromotionService.getInstance().RemovePromotion(id);
        List<Promotion> promotions = PromotionService.getInstance().loadPromotionWithConditionContainsStatus(Integer.parseInt(page), 6);
        LogService.getInstance().addNewLog(admin, "promotion", "admin", "Admin " + admin + " đã xóa promotion: " + id );
        request.setAttribute("promotions", promotions);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadPromotionListAdmin.jsp").forward(request, response);
    }
}
