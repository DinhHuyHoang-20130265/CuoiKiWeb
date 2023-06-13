package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.beans.MailConfiguration;
import vn.edu.hcmuaf.fit.beans.contact.Contact;
import vn.edu.hcmuaf.fit.services.ContactService;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.MailService;

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
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        String content = request.getParameter("content");
        String status = request.getParameter("status");
        ContactService.getInstance().replyContactAdmin(id, admin, content, status);

        MailService.getInstance().initializedSesstion(MailConfiguration.USERNAME_PNTSHOP, MailConfiguration.PASSWORD_PNTSHOP);
        MailService.getInstance().sendMail("PNTSHOP", ContactService.getInstance().getContactById(id).getEmail(), "Trả lời liên hệ từ P&T Shop", content, MailConfiguration.MAIL_HTML);

        LogService.getInstance().addNewLog(admin, "contact", "admin", "Admin " + admin + " đã reply contact : " + id);
    }
}
