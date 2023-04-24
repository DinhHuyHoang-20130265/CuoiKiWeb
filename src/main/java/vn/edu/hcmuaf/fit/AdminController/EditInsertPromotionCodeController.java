package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.services.PromotionCodeService;
import vn.edu.hcmuaf.fit.services.PromotionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditInsertPromotionCodeController", value = "/EditInsertPromotionCodeController")
public class EditInsertPromotionCodeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_edit = request.getParameter("id_edit");
        String id_code = request.getParameter("id_code");
        String code_name = request.getParameter("code_name");
        String description = request.getParameter("description");
        int discount_money = Integer.parseInt(request.getParameter("discount_money"));
        String type_code = request.getParameter("type_code");
        int status = Integer.parseInt(request.getParameter("status"));
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String admin_id = request.getParameter("admin_id");
        if (id_edit.length() < 1) {
            PromotionCodeService.getInstance().InsertNewPromotionCode(id_code, code_name, description, type_code, discount_money, status, start_date, end_date, admin_id);
        } else {
            PromotionCodeService.getInstance().UpdateNewPromotionCode(id_edit, id_code, code_name, description, type_code, discount_money, status, start_date, end_date, admin_id);
        }
    }
}
