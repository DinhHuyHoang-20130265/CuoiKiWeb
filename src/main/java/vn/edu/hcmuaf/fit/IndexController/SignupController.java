package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.DateTimeConfiguration;
import vn.edu.hcmuaf.fit.beans.MD5;
import vn.edu.hcmuaf.fit.beans.SignUpObject;
import vn.edu.hcmuaf.fit.services.ForgotPassWordService;
import vn.edu.hcmuaf.fit.services.SignUpService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "SignupController", value = "/SignupController")
public class SignupController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          /*
            Đăng kí người dùng Đinh Huy Hoàng - 20130265
           */
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password_confirmation = request.getParameter("password_confirmation");
        String role = request.getParameter("role");
        if (request.getSession().getAttribute("signupObject") == null) {
            SignUpObject obj = new SignUpObject(fullname, email, username, password, MD5.md5(password));
            request.getSession().setAttribute("signupObject", obj);
        }
        switch (role) {
            case "register" -> {
                boolean flag = false;
                String exe = SignUpService.getInstance().checkUserInput(email, username);
                if (exe != null) request.getSession().setAttribute("registerError", exe);
                else if (!password.equals(password_confirmation))
                    request.getSession().setAttribute("registerError", "Mật khẩu nhập lại không đúng");
                else {
                    String verifyCode = ForgotPassWordService.getInstance().getVerifyCode();
                    Date nowDate = new Date();
                    Date timeExistsTypeDate = new Date(nowDate.getTime() + (3 * DateTimeConfiguration.ONE_MINUTE_IN_MILLIS));
                    request.getSession().setAttribute("code", verifyCode);
                    int timeOut = ForgotPassWordService.getInstance().getTimeOut(timeExistsTypeDate);
                    request.getSession().setAttribute("timeLeft", timeOut);
                    SignUpService.getInstance().sendMailSignupVerifyCode(email, verifyCode);
                    PrintWriter(response.getWriter(), "verifyCode", request);
                    flag = true;
                }
                if (!flag) PrintWriter(response.getWriter(), role, request);
            }
            case "verifyCode" -> {
                boolean flag = false;
                String code = request.getParameter("code").trim();
                if (code.length() != 6) {
                    String error = "Mã xác nhận phải điền đủ 6 số";
                    request.getSession().setAttribute("errorCode", error);
                } else {
                    try {
                        if (code.equals(request.getSession().getAttribute("code"))) {
                            if ((int) request.getSession().getAttribute("timeLeft") > 0) {
                                SignUpObject temp = (SignUpObject) request.getSession().getAttribute("signupObject");
                                SignUpService.getInstance().InsertUser(temp.getFullname(), temp.getEmail(), temp.getUsername(), temp.getPasswordEncrypted());
                                request.getSession().setAttribute("success", "success");
                                PrintWriter(response.getWriter(), role, request);
                                flag = true;
                            } else request.getSession().setAttribute("errorCode", "Mã đã hết hạn");
                        } else request.getSession().setAttribute("errorCode", "Mã xác nhận không đúng");
                    } catch (Exception e) {
                        e.printStackTrace();
                        request.getSession().setAttribute("errorCode", "Mã xác nhận phải là số");
                    }
                }
                if (!flag) PrintWriter(response.getWriter(), role, request);
            }
        }
    }

    public void PrintWriter(PrintWriter writer, String role, HttpServletRequest request) {
        switch (role) {
            case "register" -> {
                String error = (String) request.getSession().getAttribute("registerError");
                writer.print("<h3 class=\"heading\">ĐĂNG KÍ</h3>\n" + "                    <div class=\"form-group\">\n" + "                        <label for=\"fullname\" class=\"form-label\">Tên đầy đủ</label>\n" + "                        <input id=\"fullname\" name=\"fullname\" type=\"text\" placeholder=\"VD: Nguyễn Văn A\"\n" + "                               class=\"form-control\">\n" + "                        <span class=\"form-message\"></span>\n" + "                    </div>\n" + "                    <div class=\"form-group\">\n" + "                        <label for=\"username\" class=\"form-label\">Tên đăng nhập</label>\n" + "                        <input id=\"username\" name=\"username\" type=\"text\" placeholder=\"VD: abc123\"\n" + "                               class=\"form-control\">\n" + "                        <span class=\"form-message\"></span>\n" + "                    </div>\n" + "                    <div class=\"form-group\">\n" + "                        <label for=\"email\" class=\"form-label\">Email</label>\n" + "                        <input id=\"email\" name=\"email\" type=\"text\" placeholder=\"VD: email@domain.com\"\n" + "                               class=\"form-control\">\n" + "                        <span class=\"form-message\"></span>\n" + "                    </div>\n" + "                    <div class=\"form-group matkhau\">\n" + "                        <label for=\"password\" class=\"form-label\">Mật khẩu</label>\n" + "                        <input id=\"password\" name=\"password\" type=\"password\" placeholder=\"Nhập mật khẩu\"\n" + "                               class=\"form-control\">\n" + "                        <span class=\"form-message\"></span>\n" + "                    </div>\n" + "                    <div class=\"form-group matkhau\">\n" + "                        <label for=\"password_confirmation\" class=\"form-label\">Nhập lại mật khẩu</label>\n" + "                        <input id=\"password_confirmation\" name=\"password_confirmation\" placeholder=\"Nhập lại mật khẩu\"\n" + "                               type=\"password\" class=\"form-control\">\n" + "                        <span class=\"form-message\"></span>\n" + "                    </div>\n" + "                    <h5 class=\"error\" style=\"color: red; font-size: 16px\">" + (error == null ? "" : error) + "</h5>\n" + "                    <button class=\"form-submit btn-blocker\" style=\"border-radius: unset;\">Đăng ký <i\n" + "                            class=\"fas fa-arrow-right\"\n" + "                            style=\"font-size: 16px;margin-left: 10px;\"></i></button>\n" + "                    <p style=\"font-size: 16px;margin: 10px 0;\">Bạn đã có tài khoản? <a href=\"Login.jsp\"\n" + "                                                                                       style=\"color: black; font-weight: bold\">Đăng\n" + "                        nhập</a></p>\n" + "                    <input type=\"text\" id=\"role\" name=\"role\" value=\"register\" style=\"display: none\">");

            }
            case "verifyCode" -> {
                String error = (String) request.getSession().getAttribute("errorCode");
                String success = (String) request.getSession().getAttribute("success");
                if (success == null)
                    writer.print("<h3 class=\"heading\">NHẬP MÃ XÁC NHẬN MAIL</h3>\n" + "                    <div class=\"form-group\">\n" + "                        <label for=\"code\" class=\"form-label\">Mã xác nhận</label>\n" + "                        <input id=\"code\" name=\"code\" type=\"text\" placeholder=\"Nhập code\"\n" + "                               class=\"form-control\">\n" + "                        <span class=\"form-message\"></span>\n" + "                    </div>\n" + "                    <h5 class=\"error\" style=\"color: red; font-size: 16px\">" + (error == null ? "" : error) + "</h5>\n" + "                    <button class=\"form-submit btn-blocker\" style=\"border-radius: unset;\">Xác nhận <i\n" + "                            class=\"fas fa-arrow-right\"\n" + "                            style=\"font-size: 16px;margin-left: 10px;\"></i></button>\n" + "                    <p style=\"font-size: 16px;margin: 10px 0;\">Bạn đã có tài khoản? <a href=\"Login.jsp\"\n" + "                                                                                       style=\"color: black; font-weight: bold\">Đăng\n" + "                        nhập</a></p>\n" + "                    <input type=\"text\" id=\"role\" name=\"role\" value=\"verifyCode\" style=\"display: none\">");
                else writer.print(success);
            }
        }
    }
}
