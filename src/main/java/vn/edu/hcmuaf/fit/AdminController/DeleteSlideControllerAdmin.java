package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.beans.product.ProductReview;
import vn.edu.hcmuaf.fit.beans.slide.Slide;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.ProductReviewService;
import vn.edu.hcmuaf.fit.services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteSlideControllerAdmin", value = "/DeleteSlideControllerAdmin")
public class DeleteSlideControllerAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Xóa slide trong admin - Nguyễn Huy Hiệp 20130258
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int page = Integer.parseInt(request.getParameter("page"));
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        SlideService.getInstance().RemoveSlide(id);
        List<Slide> loadSlide = SlideService.getInstance().getAllSlideByPage(page);
        LogService.getInstance().addNewLog(admin, "slide", "admin", "Admin " + admin + " đã xóa ảnh slide : " + id );
        request.setAttribute("loadSlide", loadSlide);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadSlideListAdmin.jsp").forward(request, response);
    }
}
