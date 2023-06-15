package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.APIController.api;
import vn.edu.hcmuaf.fit.DAO.OrderDAO;
import vn.edu.hcmuaf.fit.DAO.PromotionCodeDAO;
import vn.edu.hcmuaf.fit.beans.MailConfiguration;
import vn.edu.hcmuaf.fit.beans.Transport;
import vn.edu.hcmuaf.fit.beans.cart.Cart;
import vn.edu.hcmuaf.fit.beans.cart.CartKey;
import vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode;
import vn.edu.hcmuaf.fit.services.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Locale;

@WebServlet(name = "CheckoutController", value = "/CheckoutController")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /*
    Thanh toán - Nguyễn Huy Hiệp 20130258
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ord_id = new OrderDAO().generateIdOrder();
        String address = request.getParameter("address");
        String receive_name = request.getParameter("receive_name");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("phone_number");
        String note = request.getParameter("note");
        int payment_method = Integer.parseInt(request.getParameter("payment_method"));
        double total = Double.parseDouble(request.getParameter("total"));
        String customer_id = request.getParameter("customer_id");
        String sale_code = request.getParameter("sale_code");
        double transferFee = Double.parseDouble(request.getParameter("transferFee"));
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String token = request.getParameter("token");
        request.getSession().setAttribute("district", district);
        request.getSession().setAttribute("ward", ward);
        request.getSession().setAttribute("token", token);

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        OrderService.getInstance().insertOrder(ord_id, payment_method, total, address, receive_name, email, phone_number, note, customer_id, sale_code, transferFee);
        boolean check = true;
        for (CartKey p : cart.getData().keySet()) {
            String prod_id = cart.getData().get(p).getId();
            String prod_name = cart.getData().get(p).getProd_name();
            String prod_color = p.getColor();
            String prod_size = p.getSize();
            int quantity = cart.getData().get(p).getQuantity_cart();
            double price = 0;
            if (cart.getData().get(p).getSales() != null) {
                price = cart.getData().get(p).getPrice() * 0.01 * (100 - cart.getData().get(p).getSales().getDiscount_rate());
            } else {
                price = cart.getData().get(p).getPrice();
            }
            int old_quan = ProductService.getInstance().getProductAndDetails(prod_id).getQuantity();
            if (old_quan < quantity) {
                OrderDetailService.getInstance().removeOrder(ord_id);
                response.getWriter().println("Sản phẩm " + prod_name + "-" + prod_color + "" +
                        "-" + prod_size + "" +
                        " đã hết hàng hoặc số lượng tồn kho không đáp ứng đủ");
                check = false;
                break;
            } else {
                OrderDetailService.getInstance().insertOrderDetail(ord_id, prod_id, prod_name, prod_color, prod_size, quantity, price);
            }
        }
        NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
        if (check) {
            StringBuilder content = new StringBuilder();
            for (CartKey p : cart.getData().keySet()) {
                String prod_name = cart.getData().get(p).getProd_name();
                String prod_color = p.getColor();
                String prod_size = p.getSize();
                int quantity = cart.getData().get(p).getQuantity_cart();
                double price = 0;
                if (cart.getData().get(p).getSales() != null) {
                    price = (cart.getData().get(p).getPrice() * 0.01 * (100 - cart.getData().get(p).getSales().getDiscount_rate())) * quantity;
                } else {
                    price = cart.getData().get(p).getPrice() * quantity;
                }
                content.append("<p style=\"padding: 0;font-size: 15px;color: mediumvioletred;font-family:sans-serif;margin-left:80px\">").append(prod_name).append(" - ").append(prod_color).append(" - ").append(prod_size).append(" - ").append(quantity).append(" - ").append(format.format(price)).append(" đ</p>");
            }
            String text;
            if (sale_code != null && !sale_code.equals("NoCode")) {
                PromotionCode code = new PromotionCodeDAO().getPromotionCodeById(sale_code);
                text = "<p style=\"padding: 0;font-size: 17px;color: #707070;font-family:sans-serif\"> P&TSHOP</p>" +
                        "<h1 style=\"padding: 0;font-size: 41px;color: #2672ec;font-family:sans-serif\">Chi tiết đơn hàng</h1>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Đơn hàng mã " + ord_id + " của bạn đã được tạo</p>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Chi tiết đơn hàng:</p>" +
                        content.toString() +
                        "<p style=\"padding: 0;font-size: 15px;color: #707070;font-family:sans-serif; margin-left:80px\">Phí ship:   " + format.format(transferFee) + "đ</p>" +
                        "<p style=\"padding: 0;font-size: 15px;color: #707070;font-family:sans-serif; margin-left:80px\">Mã khuyến mãi:   -" + format.format(code.getDiscount_money()) + " đ</p>" +
                        "<p style=\"padding: 0;font-weight: 700;font-size: 15px;color: #2a2a2a;font-family:sans-serif\">Tổng: " + format.format(total) + " đ</p>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Bạn có thể xem lại/theo dõi đơn hàng tại trang thông tin tài khoản.</p>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Shop sẽ liên hệ lại với bạn sớm nhất để xác nhận thanh toán, cảm ơn bạn đã mua hàng tại Shop</p>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Chúc bạn một ngày mới vui vẻ</p>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">P&TSHOP</p>";
            } else {
                text = "<p style=\"padding: 0;font-size: 17px;color: #707070;font-family:sans-serif\"> P&TSHOP</p>" +
                        "<h1 style=\"padding: 0;font-size: 41px;color: #2672ec;font-family:sans-serif\">Chi tiết đơn hàng</h1>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Đơn hàng mã " + ord_id + " của bạn đã được tạo</p>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Chi tiết đơn hàng:</p>" +
                        content.toString() +
                        "<p style=\"padding: 0;font-size: 15px;color: #707070;font-family:sans-serif; margin-left:80px\">Phí ship:   " + format.format(transferFee) + " đ</p>" +
                        "<p style=\"padding: 0;font-weight: 700;font-size: 15px;color: #2a2a2a;font-family:sans-serif\">Tổng: " + format.format(total) + " đ</p>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Bạn có thể xem lại/theo dõi đơn hàng tại trang thông tin tài khoản.</p>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">" + (payment_method == 0 ? "Shop sẽ liên hệ lại với bạn sớm nhất để xác nhận thanh toán, cảm ơn bạn đã mua hàng tại Shop</p>" : "Đơn hàng đã được thanh toán qua phương thức banking online, cảm ơn bạn đã mua hàng tại Shop</p>") +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">Chúc bạn một ngày mới vui vẻ</p>" +
                        "<p style=\"padding: 0;font-size: 14px;color: #2a2a2a;font-family:sans-serif\">P&TSHOP</p>";
            }
            String subject = "Đơn hàng đã được đặt tại P&TSHOP thành công";
            if (payment_method == 0) {
                MailService.getInstance().initializedSesstion(MailConfiguration.USERNAME_PNTSHOP, MailConfiguration.PASSWORD_PNTSHOP);
                MailService.getInstance().sendMail("PNTSHOP", email, subject, text, MailConfiguration.MAIL_HTML);
                response.getWriter().println("Đơn hàng của bạn đã được tạo thành công và đang chờ cửa hàng xử lý");
                NotifyService.getInstance().addNewNotify("Tài khoản " + customer_id + " đã đặt một đơn hàng mới, mã vận đơn: " + ord_id, ord_id);
                LogService.getInstance().addNewLog(customer_id, "order", "customer", "Tài khoản " + customer_id + " đã đặt một đơn hàng mới, mã vận đơn: " + ord_id);
                Transport transport = api.getInstance().registerTransport(token, district, ward);
                OrderService.getInstance().setID_transport(ord_id, transport.getId());
                request.getSession().setAttribute("cart", new Cart());
                request.getSession().removeAttribute("district");
                request.getSession().removeAttribute("ward");
            } else {
//            MailService.getInstance().initializedSesstion(MailConfiguration.USERNAME_PNTSHOP, MailConfiguration.PASSWORD_PNTSHOP);
//            MailService.getInstance().sendMail("PNTSHOP", email, subject, text, MailConfiguration.MAIL_HTML);
//            response.getWriter().println("Đơn hàng của bạn đã được tạo thành công và đang chờ cửa hàng xử lý");
//            NotifyService.getInstance().addNewNotify("Tài khoản " + customer_id + " đã đặt một đơn hàng mới, mã vận đơn: " + ord_id, ord_id);
//            LogService.getInstance().addNewLog(customer_id, "order", "customer", "Tài khoản " + customer_id + " đã đặt một đơn hàng mới, mã vận đơn: " + ord_id);
//            request.getSession().setAttribute("cart", new Cart());

                request.getSession().setAttribute("ord_id_return", ord_id);
                request.getSession().setAttribute("id_user", customer_id);
                request.getSession().setAttribute("email_user", email);
                request.getSession().setAttribute("subject", subject);
                request.getSession().setAttribute("text", text);
                request.getSession().setAttribute("notify_ord_id_and_log", ord_id);
                request.getSession().setAttribute("amount", total);
            }
        }
    }
}
