package vn.edu.hcmuaf.fit.AdminController;

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

@WebServlet(name = "ForgotPasswordAdminController", value = "/ForgotPasswordAdminController")
public class ForgotPasswordAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
       Quên mật khẩu admin - Đinh Huy Hoàng 203130265
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        Quên mật khẩu admin Đinh Huy Hoàng - 20130265
         */
        //  Tạo sẵn 1 thằng forgot password
        //  Trước tiên cứ lấy từ session ra, nếu không có thì tạo mới
        ForgotPasswordStatus forgotPasswordAdmin = (ForgotPasswordStatus) request.getSession().getAttribute("forgotPasswordAdmin");
        String role = request.getParameter("role");
        System.out.println(role);
        if (forgotPasswordAdmin == null)
            forgotPasswordAdmin = new ForgotPasswordStatus();
        switch (role) {
            case "email" -> {
                boolean flag = false;
                String email = request.getParameter("email");
                String id_account = ForgotPassWordService.getInstance().checkAdminEmailExits(email);
                if (id_account.equals("")) {
                    //  Nếu không tồn tại thì cho nó thông báo ở chỗ email
                    forgotPasswordAdmin.setEmail(email);
                    forgotPasswordAdmin.setFillEmail(true);
                    forgotPasswordAdmin.setContent("Email của bạn chưa liên kết với tài khoản");
                } else {
                    //  Tiếp theo kiểm tra thử tài khoản liên kết với email đó còn tồn tại hay không
                    boolean isExistsAccount = ForgotPassWordService.getInstance().checkAdinAccountExists(id_account);
                    if (!isExistsAccount) {
                        //  Nếu tài khoản không tồn tại thì dừng ở chỗ fill email
                        forgotPasswordAdmin.setEmail(email);
                        forgotPasswordAdmin.setFillEmail(true);
                        forgotPasswordAdmin.setContent("Tài khoản quản lý của bạn đã bị vô hiệu hóa");
                    } else {
                        //  Nếu đúng email rồi, tồn tại oke hết thì cho nó dừng ở điền code, có nghĩa là xong giai đoạn này
                        //  1. Điền thông tin đầy đủ cho service
                        forgotPasswordAdmin.setFillEmail(false);
                        forgotPasswordAdmin.setFillCode(true);
                        forgotPasswordAdmin.setContent("");
                        forgotPasswordAdmin.setEmail(email);
                        //  2. Tạo và gửi cái mã tới email này, và điều không thể thiếu là lưu các thông tin cần thiết vô forgotPasswordAdmin
                        String verifyCode = ForgotPassWordService.getInstance().getVerifyCode();
                        //  Datetime để lưu vô csdl
                        DateTime timeExistsTypeDateTime = new DateTime(DateTimeConfiguration.NOW_DATE_ADD_SOME_MINUTE);
                        //  Date để lưu vô forgotpasswordstatus cho dễ hành động
                        Date nowDate = new Date();
                        Date timeExistsTypeDate = new Date(nowDate.getTime() + (3 * DateTimeConfiguration.ONE_MINUTE_IN_MILLIS));
                        //  Lưu thông tin vô forgotpassswordadmin
                        forgotPasswordAdmin.setCode(verifyCode);
                        forgotPasswordAdmin.setTimeExists(timeExistsTypeDate);
                        //  Đưa mã và thời gian hết hạn mã vô csdl
                        ForgotPassWordService.getInstance().updateAdminVerifyCodeAndTimeOut(id_account, verifyCode, timeExistsTypeDateTime.toString());
                        //  Gửi email có cái mã này đến địa chỉ email này
                        ForgotPassWordService.getInstance().sendMailForgotPasswordVerifyCode(email, verifyCode);
                        printWriter(response.getWriter(), "verifyCode", forgotPasswordAdmin);
                        flag = true;
                    }
                }
                if (!flag)
                    printWriter(response.getWriter(), role, forgotPasswordAdmin);
            }
            case "verifyCode" -> {
                boolean flag = false;
                //  Lấy code admin nhập
                String code = request.getParameter("code").trim();
                System.out.println(code);
                if (code.length() != 6) {
                    forgotPasswordAdmin.setContent2("Mã xác nhận phải điền đủ 6 số");
                    forgotPasswordAdmin.setFillEmail(false);
                    forgotPasswordAdmin.setFillCode(true);
                    forgotPasswordAdmin.setCodeFill(code);
                } else {
                    try {
                        if (code.equals(forgotPasswordAdmin.getCode())) {
                            if (forgotPasswordAdmin.getTimeOut() > 0) {
                                forgotPasswordAdmin.setContent2("");
                                forgotPasswordAdmin.setFillEmail(false);
                                forgotPasswordAdmin.setFillCode(false);
                                forgotPasswordAdmin.setValidPassword(true);
                                forgotPasswordAdmin.setCodeFill(code);
                                printWriter(response.getWriter(), "validPassword", forgotPasswordAdmin);
                                flag = true;
                            } else {
                                forgotPasswordAdmin.setContent2("Mã đã hết hạn");
                                forgotPasswordAdmin.setFillEmail(false);
                                forgotPasswordAdmin.setFillCode(true);
                                forgotPasswordAdmin.setCodeFill(code);
                            }
                        } else {
                            forgotPasswordAdmin.setContent2("Mã xác nhận không đúng");
                            forgotPasswordAdmin.setFillEmail(false);
                            forgotPasswordAdmin.setFillCode(true);
                            forgotPasswordAdmin.setCodeFill(code);
                        }
                    } catch (Exception e) {
                        forgotPasswordAdmin.setContent2("Mã xác nhận phải là số");
                        forgotPasswordAdmin.setFillEmail(false);
                        forgotPasswordAdmin.setFillCode(true);
                        forgotPasswordAdmin.setCodeFill(code);
                    }
                }
                if (!flag)
                    printWriter(response.getWriter(), role, forgotPasswordAdmin);
            }
            case "validPassword" -> {
                //  Lấy mk và mk xác nhận
                String pass1 = request.getParameter("pass1");
                String pass2 = request.getParameter("pass2");
                if (pass1.equals(pass2)) {
                    //  Cập nhập lại mật khẩu mới cho tài khoản
                    ForgotPassWordService.getInstance().updatePasswordAdminFromEmail(pass1, forgotPasswordAdmin.getEmail());
                    forgotPasswordAdmin.setContent3("");
                    forgotPasswordAdmin.setFillEmail(false);
                    forgotPasswordAdmin.setFillCode(false);
                    forgotPasswordAdmin.setValidPassword(false);
                    forgotPasswordAdmin.setComplete(true);
                    request.getSession().setAttribute("forgotPasswordAdmin", forgotPasswordAdmin);
                    printWriter(response.getWriter(), role, forgotPasswordAdmin);
                } else {
                    forgotPasswordAdmin.setContent3("Mật khẩu xác nhận không trùng khớp");
                    forgotPasswordAdmin.setFillEmail(false);
                    forgotPasswordAdmin.setFillCode(false);
                    forgotPasswordAdmin.setValidPassword(true);
                }
                forgotPasswordAdmin.setPass1(pass1);
                forgotPasswordAdmin.setPass2(pass2);
                if (!forgotPasswordAdmin.isComplete())
                    printWriter(response.getWriter(), role, forgotPasswordAdmin);
            }
        }
        request.getSession().setAttribute("forgotPasswordAdmin", forgotPasswordAdmin);
    }

    public void printWriter(PrintWriter print, String role, ForgotPasswordStatus forgotPasswordAdmin) {
        switch (role) {
            case "email" -> {
                if (forgotPasswordAdmin.isFillEmail())
                    print.print("<div class=\"form-group\">\n" +
                            "                        <label for=\"email\">Nhập Email của bạn</label>\n" +
                            "                        <input type=\"email\" class=\"form-control underlined\" name=\"email\" id=\"email\"\n" +
                            "                               placeholder=\"Email của bạn\" required>\n" +
                            "                    </div>\n" +
                            "                    <p class=\"error\"\n" +
                            "                       style=\"color: #ec3650;margin-top: 5px; font-size: 16px;\">\n" + (forgotPasswordAdmin.getContent() == null ? "" : forgotPasswordAdmin.getContent()) +
                            "                    </p>\n" +
                            "                    <div class=\"form-group\">\n" +
                            "                        <button class=\"btn btn-block btn-primary\">Đặt lại</button>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"form-group clearfix\">\n" +
                            "                        <a class=\"pull-left\" href=\"login.jsp\">Quay lại đăng nhập</a>\n" +
                            "                    </div>\n" +
                            "                    <input type=\"text\" id=\"role\" name=\"role\" value=\"email\" style=\"display: none\">");
            }
            case "verifyCode" -> {
                if (forgotPasswordAdmin.isFillCode())
                    print.print("<div class=\"form-group\">\n" +
                            "                        <label for=\"email\">Nhập Mã xác nhận</label>\n" +
                            "                        <input type=\"text\" class=\"form-control underlined\" name=\"code\" id=\"code\"\n" +
                            "                               placeholder=\"Nhập code\" required>\n" +
                            "                    </div>\n" +
                            "                    <p class=\"error\"\n" +
                            "                       style=\"color: #ec3650;margin-top: 5px; font-size: 16px;\">\n" + (forgotPasswordAdmin.getContent2() == null ? "" : forgotPasswordAdmin.getContent2()) +
                            "                    </p>\n" +
                            "                    <div class=\"form-group\">\n" +
                            "                        <button class=\"btn btn-block btn-primary\">Xác nhận</button>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"form-group clearfix\">\n" +
                            "                        <a class=\"pull-left\" href=\"login.jsp\">Quay lại đăng nhập</a>\n" +
                            "                    </div>\n" +
                            "                    <input type=\"text\" id=\"role\" name=\"role\" value=\"verifyCode\" style=\"display: none\">");
            }
            case "validPassword" -> {
                if (forgotPasswordAdmin.isValidPassword()) {
                    print.print("<div class=\"form-group\">\n" +
                            "                        <label for=\"pass1\">Mật khẩu mới</label>\n" +
                            "                        <input type=\"password\" class=\"form-control underlined\" name=\"pass1\" id=\"pass1\"\n" +
                            "                               placeholder=\"Nhập mật khẩu\" required>\n" +
                            "                        <label for=\"pass2\">Nhập lại mật khẩu mới</label>\n" +
                            "                        <input type=\"password\" class=\"form-control underlined\" name=\"pass2\" id=\"pass2\"\n" +
                            "                               placeholder=\"Nhập lại mật khẩu\" required>\n" +
                            "                    </div>\n" +
                            "                    <p class=\"error\"\n" +
                            "                       style=\"color: #ec3650;margin-top: 5px; font-size: 16px;\">\n" + (forgotPasswordAdmin.getContent3() == null ? "" : forgotPasswordAdmin.getContent3()) +
                            "                    </p>\n" +
                            "                    <div class=\"form-group\">\n" +
                            "                        <button class=\"btn btn-block btn-primary\">Đặt lại mật khẩu</button>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"form-group clearfix\">\n" +
                            "                        <a class=\"pull-left\" href=\"login.jsp\">Quay lại đăng nhập</a>\n" +
                            "                    </div>\n" +
                            "                    <input type=\"text\" id=\"role\" name=\"role\" value=\"validPassword\" style=\"display: none\">");
                }
                if (forgotPasswordAdmin.isComplete()) {
                    print.print("complete");
                }
            }
        }
    }
}
