package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.DateTime;
import vn.edu.hcmuaf.fit.beans.DateTimeConfiguration;
import vn.edu.hcmuaf.fit.beans.ForgotPasswordStatus;
import vn.edu.hcmuaf.fit.services.ForgotPassWordService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "ForgotPasswordController", value = "/ForgotPasswordController")
public class ForgotPasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        Quên mật khẩu index Đinh Huy Hoàng - 20130265
         */
        //  Tạo sẵn 1 thằng forgot password
        //  Trước tiên cứ lấy từ session ra, nếu không có thì tạo mới
        ForgotPasswordStatus forgotPassword = (ForgotPasswordStatus) request.getSession().getAttribute("forgotPassword");
        String role = request.getParameter("role");
        if (forgotPassword == null)
            forgotPassword = new ForgotPasswordStatus();
        switch (role) {
            case "email" -> {
                boolean flag = false;
                String email = request.getParameter("email");
                String id_account = ForgotPassWordService.getInstance().checkEmailExits(email);
                if (id_account.equals("")) {
                    //  Nếu không tồn tại thì cho nó thông báo ở chỗ email
                    forgotPassword.setEmail(email);
                    forgotPassword.setFillEmail(true);
                    forgotPassword.setContent("Email của bạn chưa liên kết với tài khoản");
                } else {
                    //  Tiếp theo kiểm tra thử tài khoản liên kết với email đó còn tồn tại hay không
                    boolean isExistsAccount = ForgotPassWordService.getInstance().checkAccountExists(id_account);
                    if (!isExistsAccount) {
                        //  Nếu tài khoản không tồn tại thì dừng ở chỗ fill email
                        forgotPassword.setEmail(email);
                        forgotPassword.setFillEmail(true);
                        forgotPassword.setContent("Tài khoản của bạn đã bị vô hiệu hóa");
                    } else {
                        //  Nếu đúng email rồi, tồn tại oke hết thì cho nó dừng ở điền code, có nghĩa là xong giai đoạn này
                        //  1. Điền thông tin đầy đủ cho service
                        forgotPassword.setFillEmail(false);
                        forgotPassword.setFillCode(true);
                        forgotPassword.setContent("");
                        forgotPassword.setEmail(email);
                        //  2. Tạo và gửi cái mã tới email này, và điều không thể thiếu là lưu các thông tin cần thiết vô forgotPassword
                        String verifyCode = ForgotPassWordService.getInstance().getVerifyCode();
                        //  Datetime để lưu vô csdl
                        DateTime timeExistsTypeDateTime = new DateTime(DateTimeConfiguration.NOW_DATE_ADD_SOME_MINUTE);
                        //  Date để lưu vô forgotpasswordstatus cho dễ hành động
                        Date nowDate = new Date();
                        Date timeExistsTypeDate = new Date(nowDate.getTime() + (3 * DateTimeConfiguration.ONE_MINUTE_IN_MILLIS));
                        //  Lưu thông tin vô forgotpasssword
                        forgotPassword.setCode(verifyCode);
                        forgotPassword.setTimeExists(timeExistsTypeDate);
                        //  Đưa mã và thời gian hết hạn mã vô csdl
                        ForgotPassWordService.getInstance().updateVerifyCodeAndTimeOut(id_account, verifyCode, timeExistsTypeDateTime.toString());
                        //  Gửi email có cái mã này đến địa chỉ email này
                        ForgotPassWordService.getInstance().sendMailForgotPasswordVerifyCode(email, verifyCode);
                        printWriter(response.getWriter(), "verifyCode", forgotPassword);
                        flag = true;
                    }
                }
                if (!flag)
                    printWriter(response.getWriter(), role, forgotPassword);
            }
            case "verifyCode" -> {
                boolean flag = false;
                //  Lấy code người dùng nhập
                String code = request.getParameter("code").trim();
                if (code.length() != 6) {
                    forgotPassword.setContent2("Mã xác nhận phải điền đủ 6 số");
                    forgotPassword.setFillEmail(false);
                    forgotPassword.setFillCode(true);
                    forgotPassword.setCodeFill(code);
                } else {
                    try {
                        if (code.equals(forgotPassword.getCode())) {
                            if (forgotPassword.getTimeOut() > 0) {
                                forgotPassword.setContent2("");
                                forgotPassword.setFillEmail(false);
                                forgotPassword.setFillCode(false);
                                forgotPassword.setValidPassword(true);
                                forgotPassword.setCodeFill(code);
                                printWriter(response.getWriter(), "validPassword", forgotPassword);
                                flag = true;
                            } else {
                                forgotPassword.setContent2("Mã đã hết hạn");
                                forgotPassword.setFillEmail(false);
                                forgotPassword.setFillCode(true);
                                forgotPassword.setCodeFill(code);
                            }
                        } else {
                            forgotPassword.setContent2("Mã xác nhận không đúng");
                            forgotPassword.setFillEmail(false);
                            forgotPassword.setFillCode(true);
                            forgotPassword.setCodeFill(code);
                        }

                    } catch (Exception e) {
                        forgotPassword.setContent2("Mã xác nhận phải là số");
                        forgotPassword.setFillEmail(false);
                        forgotPassword.setFillCode(true);
                        forgotPassword.setCodeFill(code);
                    }
                }
                if (!flag)
                    printWriter(response.getWriter(), role, forgotPassword);
            }
            case "validPassword" -> {
                //  Lấy mk và mk xác nhận
                String pass1 = request.getParameter("pass1");
                String pass2 = request.getParameter("pass2");
                if (pass1.equals(pass2)) {
                    //  Cập nhập lại mật khẩu mới cho tài khoản
                    ForgotPassWordService.getInstance().updatePasswordFromEmail(pass1, forgotPassword.getEmail());
                    forgotPassword.setContent3("");
                    forgotPassword.setFillEmail(false);
                    forgotPassword.setFillCode(false);
                    forgotPassword.setValidPassword(false);
                    forgotPassword.setComplete(true);
                    request.getSession().setAttribute("forgotPassword", forgotPassword);
                    printWriter(response.getWriter(), role, forgotPassword);
                } else {
                    forgotPassword.setContent3("Mật khẩu xác nhận không trùng khớp");
                    forgotPassword.setFillEmail(false);
                    forgotPassword.setFillCode(false);
                    forgotPassword.setValidPassword(true);
                }
                forgotPassword.setPass1(pass1);
                forgotPassword.setPass2(pass2);
                if (!forgotPassword.isComplete())
                    printWriter(response.getWriter(), role, forgotPassword);
            }
        }
        request.getSession().setAttribute("forgotPassword", forgotPassword);
    }

    public void printWriter(PrintWriter print, String role, ForgotPasswordStatus forgotPassword) {
        switch (role) {
            case "email" -> {
                if (forgotPassword.isFillEmail())
                    print.print("<h3 class=\"heading\">Quên mật khẩu</h3>\n" +
                            "                        <div class=\"form-group\">\n" +
                            "                            <label for=\"email\" class=\"form-label\">Email</label>\n" +
                            "                            <input id=\"email\" name=\"email\" type=\"text\" placeholder=\"VD: email@domain.com\"\n" +
                            "                                   class=\"form-control\">\n" +
                            "                            <span class=\"form-message\"></span>\n" +
                            "                        </div>\n" +
                            "                       <p class=\"error\"\n" +
                            "                           style=\"color: #ec3650;margin-top: 5px; font-size: 16px;\">" + (forgotPassword.getContent2() == null ? "" : forgotPassword.getContent2()) +
                            "                       </p>\n" +
                            "                        <button type=\"submit\" class=\"form-submit btn-blocker\" style=\"border-radius: unset;\">Gửi<i\n" +
                            "                                class=\"fas fa-arrow-right\" style=\"font-size: 16px;margin-left: 10px;\"></i></button>\n" +
                            "                        <p style=\"font-size: 16px;margin: 10px 0;\">Quay trở lại <a href=\"Login.jsp\"\n" +
                            "                                                                                   style=\"color: black; font-weight: bold\">\n" +
                            "                            Đăng nhập</a></p>\n" +
                            "                        <input type=\"text\" id=\"role\" name=\"role\" value=\"email\" style=\"display: none\">");
            }
            case "verifyCode" -> {
                if (forgotPassword.isFillCode())
                    print.print("<h3 class=\"heading\">Nhập mã xác nhận</h3>\n" +
                            "                    <div class=\"form-group\">\n" +
                            "                        <label for=\"code\" class=\"form-label\">Mã xác nhận</label>\n" +
                            "                        <input id=\"code\" name=\"code\" type=\"text\" class=\"form-control\">\n" +
                            "                        <span class=\"form-message\"></span>\n" +
                            "                    </div>\n" +
                            "                    <p class=\"error\"\n" +
                            "                       style=\"color: #ec3650;margin-top: 5px; font-size: 16px;\">" + (forgotPassword.getContent2() == null ? "" : forgotPassword.getContent2()) +
                            "                    </p>\n" +
                            "                    <button class=\"form-submit btn-blocker\" style=\"border-radius: unset;\">Xác nhận mã <i\n" +
                            "                            class=\"fas fa-arrow-right\"\n" +
                            "                            style=\"font-size: 16px;margin-left: 10px;\"></i></button>\n" +
                            "                    <p style=\"font-size: 16px;margin: 10px 0;\">Quay trở lại <a href=\"Login.jsp\" style=\"color: black; font-weight: bold\">\n" +
                            "                        Đăng nhập</a></p>\n" +
                            "                    <input type=\"text\" id=\"role\" name=\"role\" value=\"verifyCode\" style=\"display: none\">");
            }
            case "validPassword" -> {
                if (forgotPassword.isValidPassword()) {
                    print.print("<h3 class=\"heading\">Nhập mật khẩu mới</h3>\n" +
                            "                    <div class=\"form-group matkhau\">\n" +
                            "                        <label for=\"pass1\" class=\"form-label\">Mật khẩu mới</label>\n" +
                            "                        <input id=\"pass1\" name=\"pass1\" type=\"password\" placeholder=\"Nhập mật khẩu mới\"\n" +
                            "                               class=\"form-control\">\n" +
                            "                        <span class=\"form-message\"></span>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"form-group matkhau\">\n" +
                            "                        <label for=\"pass2\" class=\"form-label\">Nhập lại Mật khẩu</label>\n" +
                            "                        <input id=\"pass2\" name=\"pass2\" placeholder=\"Nhập lại mật khẩu mới\"\n" +
                            "                               type=\"password\" class=\"form-control\">\n" +
                            "                        <span class=\"form-message\"></span>\n" +
                            "                    </div>\n" +
                            "                    <p class=\"error\"\n" +
                            "                       style=\"color: #ec3650;margin-top: 5px; font-size: 16px;\">" + (forgotPassword.getContent3() == null ? "" : forgotPassword.getContent3()) +
                            "                    </p>\n" +
                            "                    <button class=\"form-submit btn-blocker\" style=\"border-radius: unset;\">Xác nhận <i\n" +
                            "                            class=\"fas fa-arrow-right\"\n" +
                            "                            style=\"font-size: 16px;margin-left: 10px;\"></i></button>\n" +
                            "                    <p style=\"font-size: 16px;margin: 10px 0;\">Quay trở lại <a href=\"Login.jsp\"\n" +
                            "                                                                               style=\"color: black; font-weight: bold\">\n" +
                            "                        Đăng nhập</a></p>\n" +
                            "                    <input type=\"text\" id=\"role\" name=\"role\" value=\"validPassword\" style=\"display: none\">");
                }
                if (forgotPassword.isComplete()) {
                    print.print("complete");
                }
            }
        }
    }
}

