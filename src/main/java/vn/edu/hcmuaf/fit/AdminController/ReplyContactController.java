package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.contact.Contact;
import vn.edu.hcmuaf.fit.services.ContactService;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReplyContactController", value = "/ReplyContactController")
public class ReplyContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String admin = request.getParameter("admin");
        String content = request.getParameter("content");
        String status = request.getParameter("status");
        ContactService.getInstance().replyContactAdmin(id,admin, content,status);
        LogService.getInstance().addNewLog(admin, "contact", "admin", "Admin " + admin + " đã reply contact : " + id );
    }
}
