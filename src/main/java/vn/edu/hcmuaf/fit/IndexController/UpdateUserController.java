package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.services.AccountService;
import vn.edu.hcmuaf.fit.services.UserInformationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateUserController", value = "/UpdateUserController")
public class UpdateUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SiteUser user = (SiteUser) request.getSession().getAttribute("user");
        String id = String.valueOf((AccountService.getInstance().getIdUserByName(user.getUsername())));
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone_number = request.getParameter("phone_number");
        System.out.println(id);
        System.out.println(full_name);
        System.out.println(email);
        System.out.println(address);
        System.out.println(phone_number);
        UserInformationService.getInstance().UpdateUserInfo(id,full_name, email , address, phone_number);
    }
}
