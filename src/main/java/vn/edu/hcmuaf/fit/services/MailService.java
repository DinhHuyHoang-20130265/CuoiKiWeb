package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.MailConfiguration;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class MailService {

    /*
     *  Khai báo các type để check email
     *  Cách check email ở đây là mình sẽ gửi 1 email với một nội dung tới email, nếu gửi không được chứng tỏ email
     *  không tồn tại, còn nội dung như thế nào thì tùy thuộc vào type
     */
    // Đăng kí khách hàng
    public static final int REGISTER_KH = 1;

    //--------------------------------- Khai báo thuộc tính cần thiết để gửi email ---------------------------------
    //  Properties để thiết lập server
    private Properties properties;
    //  sesstion để thiết lập phiên gửi mail, user password người gửi email
    private Session session;
    //  username để send email
    private String username;
    //-------------------------------------------------SINGLETON----------------------------------------------------
    private static MailService mailService;
    //  Constructor khởi tạo properties và sesstion
    private MailService() {

        //--------------------------------- Properties ---------------------------------
        //  Khởi tạo properties
        properties = new Properties();

        //  Put server
        properties.put(MailConfiguration.MAIL_HOST, MailConfiguration.MAIL_SERVER);

        //  Kết nối cổng
        properties.put(MailConfiguration.URL_MAIL_PORT, MailConfiguration.MAIL_PORT);

        //  Đăng nhập mới được gửi gmail
        properties.put(MailConfiguration.MAIL_AUTH, MailConfiguration.MAIL_AUTH_STATUS);

        //  TLS
        properties.put(MailConfiguration.URL_MAIL_TLS, MailConfiguration.MAIL_TLS_STATUS);
        //------------------------------------------------------------------------------

        /*
         *  Khởi tạo sesstion, truyền vô username và password, mục đích để tất cả user có thể dùng chung tiện lợi
         *  bằng cách gọi lại hàm này và truyền lại username và password mới
         */
        initializedSesstion(MailConfiguration.USERNAME_PNTSHOP, MailConfiguration.PASSWORD_PNTSHOP);

    }

    //  Trả về thể hiện của lớp
    public static synchronized MailService getInstance() {
        //  Nếu thể hiện null thì tạo nó
        if (mailService == null) {
            mailService = new MailService();
        }
        //  Trả về thể hiện
        return mailService;

    }

    //  Phương thức tạo session
    public void initializedSesstion(String username, String password) {
        //  Khởi tạo sesstion nhận vô properties và tạo mới 1 authen có 2 tham số là username và passowrd truyền vào
        session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        //  gán username cho username hiện tại để gửi email
        this.username = username;

    }

    //  Phương thức gửi email tới một email khách nhận vào tên người gửi, tiêu đề + nội dung
    public boolean sendMail(String personal, String address, String subject, String text, int typeMail) {
        //  Bỏ vào try catch, nếu ok thì trả về true, ngược lại xảy ra ngoại lệ thì trả về false;
        try {
            //  Khởi tạo message
            MimeMessage message = new MimeMessage(this.session);
            //  Thiết lập người gửi
            message.setFrom(new InternetAddress(this.username, personal));
            //  Thiết lập người nhận
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(address));
            message.setHeader("Content-Type", "text/html; charset=UTF-8");
            //  Thiết lập subject
            message.setSubject(subject, "UTF-8");
            //  Thiết lập nội dung thư
            if (typeMail == MailConfiguration.MAIL_HTML) {
                message.setContent(text, "text/html; charset=UTF-8");
            } else {
                message.setText(text, "UTF-8");
            }
            //  Gửi thư
            Transport.send(message);
            //  oke hết thì trả về true
            return true;

        } catch (MessagingException | UnsupportedEncodingException e) {
            //  Xảy ra ngoại lệ thì thông báo rồi trả về false
            e.printStackTrace();
            System.out.println("Email: " + address + " không tồn tại");
            return false;

        }
    }
}
