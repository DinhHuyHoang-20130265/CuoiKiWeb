package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.Notify_Admin;
import vn.edu.hcmuaf.fit.services.NotifyService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteNotifyAdmin", value = "/DeleteNotifyAdmin")
public class DeleteNotifyAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int pageNumb = Integer.parseInt(request.getParameter("pageNumb"));
        NotifyService.getInstance().removeNotify(id);
        List<Notify_Admin> list = NotifyService.getInstance().loadNotifyWithPage(pageNumb);
        request.setAttribute("loadMoreNotify", list);
        request.getRequestDispatcher("/admin-page/ajax/ajax_loadNotifyListAdmin.jsp").forward(request, response);
    }
}
