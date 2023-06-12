package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.PromotionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "EditInsertPromotionController", value = "/EditInsertPromotionController")
public class EditInsertPromotionController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
       Thêm/sửa giảm giá trong admin - Nguyễn Huy Hiệp 20130258
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        int status = Integer.parseInt(request.getParameter("status"));
        String idProduct = request.getParameter("idProduct");
        String content = request.getParameter("content");
        int discount_rate = Integer.parseInt(request.getParameter("discount_rate"));
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String admin = request.getParameter("admin");
        if (id.length() < 1) {
            PromotionService.getInstance().InsertNewPromotion(idProduct, name, content, discount_rate, status, start_date, end_date);
            LogService.getInstance().addNewLog(admin, "promotion", "admin", "Admin " + admin + " đã thêm promo mới : " + name );
        } else {
            PromotionService.getInstance().UpdatePromotion(id, idProduct, name, content, discount_rate, status, start_date, end_date);
            LogService.getInstance().addNewLog(admin, "promotion", "admin", "Admin " + admin + " đã chỉnh sửa promo : " + id );
        }
    }
}
