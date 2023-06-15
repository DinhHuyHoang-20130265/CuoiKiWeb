package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.beans.MailConfiguration;
import vn.edu.hcmuaf.fit.beans.cart.Cart;
import vn.edu.hcmuaf.fit.beans.vnpay.Config;
import vn.edu.hcmuaf.fit.services.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "return_result", value = "/return_result")
public class VNPAYReturnController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Begin process return from VNPAY
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements(); ) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII);
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        String vnp_Amount = request.getParameter("vnp_Amount");
        String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
        String vnp_BankCode = request.getParameter("vnp_BankCode");
        String vnp_PayDate = request.getParameter("vnp_PayDate");

        String id_user = (String) request.getSession().getAttribute("id_user");
        String emailUser = (String) request.getSession().getAttribute("email_user");
        String subject = (String) request.getSession().getAttribute("subject");
        String text = (String) request.getSession().getAttribute("text");
        String notify_ord_id_and_log = (String) request.getSession().getAttribute("notify_ord_id_and_log");
        String ord_id_return = (String) request.getSession().getAttribute("ord_id_return");

        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                request.getSession().setAttribute("payment_status", "Success");

                MailService.getInstance().initializedSesstion(MailConfiguration.USERNAME_PNTSHOP, MailConfiguration.PASSWORD_PNTSHOP);
                MailService.getInstance().sendMail("PNTSHOP", emailUser, subject, text, MailConfiguration.MAIL_HTML);
                NotifyService.getInstance().addNewNotify("Có Tài khoản đã đặt một đơn hàng mới, mã vận đơn: " + ord_id_return, ord_id_return);
                LogService.getInstance().addNewLog(id_user, "order", "customer", "Tài khoản " + id_user + " đã đặt một đơn hàng mới, mã vận đơn: " + ord_id_return);
                request.getSession().setAttribute("cart", new Cart());

                OrderService.getInstance().UpdatePaymentStatus(ord_id_return);
                OrderService.getInstance().UpdateOrderStatus(ord_id_return);
                OrderService.getInstance().setTransactionVNPAY(ord_id_return, vnp_TxnRef, vnp_PayDate);

                response.sendRedirect("VNPay_result.jsp");
            } else {
                request.getSession().setAttribute("payment_status", "Failed");
                OrderDetailService.getInstance().hardRemoveOrder(ord_id_return);
                response.sendRedirect("VNPay_result.jsp");
            }
        } else {
            request.getSession().setAttribute("payment_status", "invalid signature");
            OrderDetailService.getInstance().hardRemoveOrder(ord_id_return);
            response.sendRedirect("VNPay_result.jsp");
        }
    }
}
