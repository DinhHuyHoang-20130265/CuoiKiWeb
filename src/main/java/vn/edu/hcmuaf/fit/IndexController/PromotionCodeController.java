package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.DAO.PromotionCodeDAO;
import vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PromotionCodeController", value = "/PromotionCodeController")
public class PromotionCodeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sale_code = request.getParameter("sale_code");
        List<PromotionCode> list_codes = new PromotionCodeDAO().loadAllLegitCode();
        for(PromotionCode code: list_codes) {
            if(code.getCode_id().equals(sale_code)) {
                request.getSession().setAttribute("code", code);
                request.getRequestDispatcher("ajax/ajax_addCodeSuccessful.jsp").forward(request, response);
            }
        }
    }
}
