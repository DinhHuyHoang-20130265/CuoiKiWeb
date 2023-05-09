package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.DAO.ContactDAO;
import vn.edu.hcmuaf.fit.beans.contact.Contact;
import vn.edu.hcmuaf.fit.services.ContactService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UploadContentController", value = "/UploadContentController")
public class UploadContentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String noidung = request.getParameter("noidung");
        String add_contact = ContactService.getInstance().addNewContact(fullname,email,phone,noidung);
        request.setAttribute("contact", new Contact());
    }
}
