package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.SignUpDAO;
import vn.edu.hcmuaf.fit.beans.MD5;
import vn.edu.hcmuaf.fit.beans.MailConfiguration;

public class SignUpService {
    private static SignUpService signUpService;

    public static SignUpService getInstance() {
        if (signUpService == null) {
            signUpService = new SignUpService();
        }
        return signUpService;
    }

    public String checkUserInput(String email, String username) {
        SignUpDAO DAO = new SignUpDAO();
        return DAO.checkUserInput(email, username);
    }

    public boolean checkEmail(String email) {
        return new SignUpDAO().checkMail(email);
    }

    public void sendMailSignupVerifyCode(String email, String verifyCode) {

        String text = "<p style=\"padding: 0;font-size: 17px;color: #707070;font-family:sans-serif\">Tài khoản P&TSHOP</p><h1 style=\"padding: 0;font-size: 41px;color: #2672ec;font-family:sans-serif\">Xác nhận tài khoản</h1><p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Để hoàn tất việc đăng ký tài khoản P&TSHOP, chúng tôi chỉ cần đảm bảo địa chỉ email này là địa chỉ email mà bạn đã sử dụng để đăng ký.</p><p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Để xác minh email của bạn, hãy sử dụng mã bảo mật này: <strong>" + verifyCode + "</strong>, thời hạn sử dụng mã này là <strong>180</strong> giây</p><p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Sau khi hết thời gian thì mã bảo mật sẽ hết bạn, hãy nhanh tay nhập nhé!</p><p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Cảm ơn bạn,</p><p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">P&TSHOP</p>";
        String subject = "Xác nhận email cho tài khoản P&TSHOP";

        MailService.getInstance().initializedSesstion(MailConfiguration.USERNAME_PNTSHOP, MailConfiguration.PASSWORD_PNTSHOP);
        MailService.getInstance().sendMail("PNTSHOP", email, subject, text, MailConfiguration.MAIL_HTML);

    }


    public void InsertUser(String fullname, String email, String username, String passwordEncrypted) {
        new SignUpDAO().InsertUser(fullname, email, username, passwordEncrypted);
    }

    public static void main(String[] args) {
        SignUpService.getInstance().InsertUser("user123", "dinh123456@gmail.com", "user123", MD5.md5("123123"));
    }
}
