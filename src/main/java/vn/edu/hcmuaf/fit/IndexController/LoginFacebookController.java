package vn.edu.hcmuaf.fit.IndexController;

import com.restfb.types.User;
import vn.edu.hcmuaf.fit.beans.*;
import vn.edu.hcmuaf.fit.beans.cart.Cart;
import vn.edu.hcmuaf.fit.beans.wishlist.WishList;
import vn.edu.hcmuaf.fit.services.AccountService;
import vn.edu.hcmuaf.fit.services.LoginService;
import vn.edu.hcmuaf.fit.services.SignUpService;
import vn.edu.hcmuaf.fit.services.UserInformationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginFacebookController", value = "/login-facebook")
public class LoginFacebookController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect("index.jsp");
        } else {
            String accessToken = FacebookUtils.getToken(code);
            User userfb = FacebookUtils.getUserInfo(accessToken);
            SiteUser user = LoginService.getInstance().getAccountCustomer(userfb.getId(), userfb.getId());
            if (user != null) {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("cart", new Cart());
                request.getSession().setAttribute("wishList", new WishList());
            } else {
                SignUpService.getInstance().InsertUser(userfb.getName(), userfb.getEmail(), userfb.getId(), MD5.md5(userfb.getId()));
                String id = AccountService.getInstance().getIdUserByName(userfb.getId());
                System.out.println(id);
                System.out.println(userfb.getEmail());
                UserInformationService.getInstance().UpdateUserInfo(id, userfb.getName(), userfb.getEmail(), null, null, null);
                user = AccountService.getInstance().getUserByEmail(userfb.getEmail());
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("cart", new Cart());
                request.getSession().setAttribute("wishList", new WishList());
            }
            response.sendRedirect("index.jsp");
        }
    }
}
