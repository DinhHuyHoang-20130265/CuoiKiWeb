package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.GooglePojo;
import vn.edu.hcmuaf.fit.beans.GoogleUtils;
import vn.edu.hcmuaf.fit.beans.MD5;
import vn.edu.hcmuaf.fit.beans.SiteUser;
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

@WebServlet(name = "LoginGoogleController", value = "/login-google")
public class LoginGoogleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect("login.jsp");
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            SiteUser user = LoginService.getInstance().getAccountCustomer(googlePojo.getId(), googlePojo.getId());
            if (user != null) {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("cart", new Cart());
                request.getSession().setAttribute("wishList", new WishList());
            } else {
                SignUpService.getInstance().InsertUser(googlePojo.getName(), googlePojo.getEmail(), googlePojo.getId(), MD5.md5(googlePojo.getId()));
                String id = AccountService.getInstance().getIdUserByName(googlePojo.getId());
                UserInformationService.getInstance().UpdateUserInfo(id, googlePojo.getName(), googlePojo.getEmail(), null, null, null);
                user = AccountService.getInstance().getUserByEmail(googlePojo.getEmail());
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("cart", new Cart());
                request.getSession().setAttribute("wishList", new WishList());
            }
            response.sendRedirect("index.jsp");
        }
    }
}
