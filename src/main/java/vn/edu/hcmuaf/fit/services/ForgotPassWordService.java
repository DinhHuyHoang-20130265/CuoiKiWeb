package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.SiteUserDAO;
import vn.edu.hcmuaf.fit.beans.MailConfiguration;
import vn.edu.hcmuaf.fit.beans.SiteUser;

import java.util.Date;
import java.util.Random;

public class ForgotPassWordService {
    private Random rd;
    private static ForgotPassWordService forgotPassWordService;

    private ForgotPassWordService() {
        rd = new Random();
    }

    public static ForgotPassWordService getInstance() {
        if (forgotPassWordService == null) {
            forgotPassWordService = new ForgotPassWordService();
        }
        return forgotPassWordService;
    }

    public int getTimeOut(Date timeExists) {
        Date now = new Date();
        long timeOut = timeExists.getTime() - now.getTime();
        if (timeOut <= 0) return 0;
        else return (int) (timeOut / 3);

    }

    //  Phương thức tạo một mã 6 số
    public String getVerifyCode() {
        String result = "";
        for (int i = 0; i < 6; i++) {
            result += rd.nextInt(10) + "";
        }
        return result;

    }

    public String checkEmailExits(String email) {
        SiteUserDAO DAO = new SiteUserDAO();
        return DAO.checkEmailExits(email);

    }

    public void updateVerifyCodeAndTimeOut(String id, String code, String expiry) {
        SiteUserDAO DAO = new SiteUserDAO();
        DAO.updateVerifyCodeAndTimeOut(id, code, expiry);
    }

    public boolean checkAccountExists(String id_account) {
        SiteUserDAO DAO = new SiteUserDAO();
        return DAO.checkIdStatus(id_account);
    }

    public void sendMailForgotPasswordVerifyCode(String email, String verifyCode) {

        String text = "<p style=\"padding: 0;font-size: 17px;color: #707070;font-family:sans-serif\">Tài khoản P&TSHOP</p><h1 style=\"padding: 0;font-size: 41px;color: #2672ec;font-family:sans-serif\">Xác nhận tài khoản</h1><p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Để hoàn tất việc quên mật khẩu tài khoản P&TSHOP, chúng tôi chỉ cần đảm bảo địa chỉ email này là của bạn.</p><p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Để xác minh tài khoản của bạn, hãy sử dụng mã bảo mật này: <strong>" + verifyCode + "</strong>, thời hạn sử dụng mã này là <strong>180</strong> giây</p><p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Nếu bạn không yêu cầu mã này thì bạn có thể an toàn bỏ qua email này. Có thể ai đó đã nhập nhầm địa chỉ email của bạn.</p><p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Cảm ơn bạn,</p><p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">P&TSHOP</p>";
        String subject = "Lấy lại mật khẩu P&TSHOP";

        MailService.getInstance().initializedSesstion(MailConfiguration.USERNAME_PNTSHOP, MailConfiguration.PASSWORD_PNTSHOP);
        MailService.getInstance().sendMail("PNTSHOP", email, subject, text, MailConfiguration.MAIL_HTML);

    }

    public void updatePasswordFromEmail(String pass1, String email) {
        SiteUserDAO DAO = new SiteUserDAO();
        DAO.updatePasswordFromEmail(pass1, email);
    }

    public static void main(String[] args) {
        ForgotPassWordService.getInstance().sendMailForgotPasswordVerifyCode("dinh37823@gmail.com", "123456");
    }
}
