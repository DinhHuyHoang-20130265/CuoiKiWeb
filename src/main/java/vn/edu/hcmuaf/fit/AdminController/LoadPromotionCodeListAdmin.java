package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.DAO.PromotionCodeDAO;
import vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode;
import vn.edu.hcmuaf.fit.services.PromotionCodeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadPromotionCodeListAdmin", value = "/LoadPromotionCodeListAdmin")
public class LoadPromotionCodeListAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        List<PromotionCode> codes = PromotionCodeService.getInstance().loadPromotionWithConditionContainsStatus(Integer.parseInt(page), 6);
        request.setAttribute("code", codes);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadPromotionCodeListAdmin.jsp").forward(request, response);
    }
}
