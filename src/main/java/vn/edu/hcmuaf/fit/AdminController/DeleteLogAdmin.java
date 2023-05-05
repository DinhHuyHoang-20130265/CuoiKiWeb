package vn.edu.hcmuaf.fit.AdminController;


import vn.edu.hcmuaf.fit.beans.LogAdmin;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteLogAdmin", value = "/DeleteLogAdmin")
public class DeleteLogAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int page = Integer.parseInt(request.getParameter("page"));
        LogService.getInstance().removeLog(id);
        List<LogAdmin> list = LogService.getInstance().loadLogWithPage(page,9);
        request.setAttribute("loadLogs", list);
        request.getRequestDispatcher("/admin-page/ajax/ajax_loadLogListAdmin.jsp").forward(request, response);
    }
}
