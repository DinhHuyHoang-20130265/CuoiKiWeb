package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.contact.Contact;
import vn.edu.hcmuaf.fit.services.ContactService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadReplyContactAdminController", value = "/LoadReplyContactAdminController")
public class LoadReplyContactAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        List<Contact> loadContact = ContactService.getInstance().loadReplyContactWithPage(Integer.parseInt(page));
        request.setAttribute("replyContact", loadContact);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadReplyContactListAdmin.jsp").forward(request, response);
    }
}
