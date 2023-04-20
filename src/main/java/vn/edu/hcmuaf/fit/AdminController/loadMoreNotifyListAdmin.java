package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.Notify_Admin;
import vn.edu.hcmuaf.fit.services.NotifyService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "loadMoreNotifyListAdmin", value = "/loadMoreNotifyListAdmin")
public class loadMoreNotifyListAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = Integer.parseInt(request.getParameter("page"));
        List<Notify_Admin> loadMoreNotify = NotifyService.getInstance().loadNotifyWithPage(page);
        request.setAttribute("loadMoreNotify", loadMoreNotify);
        request.getRequestDispatcher("/admin-page/ajax/ajax_loadMoreNotifyListAdmin.jsp").forward(request, response);
    }
}
