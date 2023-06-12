package vn.edu.hcmuaf.fit.AdminController;



import vn.edu.hcmuaf.fit.beans.contact.Contact;
import vn.edu.hcmuaf.fit.services.ContactService;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteContactAdminController", value = "/DeleteContactAdminController")
public class DeleteContactAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int page = Integer.parseInt(request.getParameter("page"));
        String admin = request.getParameter("admin");
        ContactService.getInstance().removeContact(id);
        List<Contact> list = ContactService.getInstance().loadContactWithPage(page);
        LogService.getInstance().addNewLog(admin, "contact", "admin", "Admin " + admin + " đã xóa contact, mã contact: " + id );
        request.setAttribute("loadContact", list);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadContactAdmin.jsp").forward(request, response);
    }
}
