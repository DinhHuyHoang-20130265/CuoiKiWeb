package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.Notify_Admin;
import vn.edu.hcmuaf.fit.services.NotifyService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadNotifyAdminController", value = "/LoadNotifyAdminController")
public class LoadNotifyAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Load more danh sách thông báo trong admin - Nguyễn Minh Hiếu 20130261
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = Integer.parseInt(request.getParameter("page"));
        List<Notify_Admin> loadNotify = NotifyService.getInstance().loadNotifyWithPage(page);
        request.setAttribute("loadNotify", loadNotify);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadNotifyListAdmin.jsp").forward(request, response);
    }
}
