package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.DAO.PromotionCodeDAO;
import vn.edu.hcmuaf.fit.DAO.PromotionDAO;
import vn.edu.hcmuaf.fit.beans.promotion.Promotion;
import vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.PromotionCodeService;
import vn.edu.hcmuaf.fit.services.PromotionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeletePromotionCodeAdminController", value = "/DeletePromotionCodeAdminController")
public class DeletePromotionCodeAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String page = request.getParameter("page");
        String admin = request.getParameter("admin");
        PromotionCodeService.getInstance().RemovePromotionCode(id);
        List<PromotionCode> codes = PromotionCodeService.getInstance().loadPromotionWithConditionContainsStatus(Integer.parseInt(page), 6);
        LogService.getInstance().addNewLog(admin, "promotion", "admin", "Admin " + admin + " đã xóa mã promotion : " + id );
        request.setAttribute("codes", codes);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadPromotionListAdmin.jsp").forward(request, response);
    }
}
