package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.DAO.SiteUserDAO;
import vn.edu.hcmuaf.fit.DAO.UserInformationDAO;
import vn.edu.hcmuaf.fit.beans.MD5;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.services.AccountService;
import vn.edu.hcmuaf.fit.services.UserInformationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangePasswordController", value = "/ChangePasswordController")
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SiteUser user = (SiteUser) request.getSession().getAttribute("user");
        String id = AccountService.getInstance().getIdUserByName(user.getUsername());
        String password_new = request.getParameter("password_new");
        String password_old = request.getParameter("password_old");
        String password_confirm = request.getParameter("password_confirm");
        if (!user.getPass().equals(MD5.md5(password_old))) {
            response.getWriter().println("Mật khẩu cũ không chính xác");
        } else {
            AccountService.getInstance().ChangeUserPassword(id, password_new, password_old, password_confirm);
            response.getWriter().println("complete");
        }
    }
}
