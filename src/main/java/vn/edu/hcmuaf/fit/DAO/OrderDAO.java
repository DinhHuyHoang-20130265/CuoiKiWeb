package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.beans.order.OrderDetail;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class OrderDAO {

    public List<Order> getOrderListByUserId(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT o.ord_id, o.ord_date, o.status, " +
                        "o.payment_method, o.delivered, o.total, o.delivery_date, o.customer_id, o.address, o.receive_name, o.email, o.phone_number, o.note" +
                        " FROM orders o WHERE o.customer_id =?")
                .bind(0, id)
                .mapToBean(Order.class)
                .stream().collect(Collectors.toList())
        );
    }

    public String generateIdOrder() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT ord_id FROM orders").mapTo(String.class).stream().collect(Collectors.toList()));
        String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String alphaNumeric = upperAlphabet + lowerAlphabet + numbers;

        StringBuilder sb = new StringBuilder();

        // create an object of Random class
        Random random = new Random();
        // specify length of random string
        int length = 10;
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(alphaNumeric.length());
            char randomChar = alphaNumeric.charAt(index);
            sb.append(randomChar);
        }
        if (id.contains(sb.toString())) return generateIdOrder();
        else return sb.toString();
    }

    public List<OrderDetail> getListDetailsFromOrdId(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT o.ord_id, o.prod_id, o.prod_name, o.prod_color, o.prod_size, o.quantity, o.price" +
                        " FROM order_details o WHERE o.ord_id =?")
                .bind(0, id)
                .mapToBean(OrderDetail.class)
                .stream().collect(Collectors.toList())
        );
    }

    public void insertOrder(String ord_id, int payment_method, double total, String address,
                            String receive_name, String email, String phone_number, String note, String customer_id) {
        String date = java.time.LocalDate.now().toString();
        String date_3days = (java.time.LocalDate.now().plusDays(3)).toString();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("INSERT INTO orders (ord_id, ord_date, status, payment_method, delivered, total, delivery_date, address," +
                            "receive_name, email, phone_number, note, customer_id) VALUES(?,?,1,?,0,?,?,?,?,?,?,?,? )")
                    .bind(0, ord_id)
                    .bind(1, date)
                    .bind(2, payment_method)
                    .bind(3, total)
                    .bind(4, date_3days)
                    .bind(5, address)
                    .bind(6, receive_name)
                    .bind(7, email)
                    .bind(8, phone_number)
                    .bind(9, note)
                    .bind(10, customer_id)
                    .execute();

            return null;
        });
    }

    public Order getOrderById(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT o.ord_id, o.ord_date, o.status, o.payment_method, o.delivered, " +
                        "o.total, o.delivery_date, o.customer_id, o.address, o.receive_name, o.email, o.phone_number, o.note" +
                        " FROM orders o WHERE o.ord_id =?")
                .bind(0, id)
                .mapToBean(Order.class)
                .first()
        );
    }

    public void removeOrder(String ord_id) {
        JDBIConnector.get().withHandle(handle -> handle.createUpdate("DELETE FROM orders WHERE ord_id = ?")
                .bind(0, ord_id)
                .execute()
        );
    }

    public static void main(String[] args) {
        System.out.println(new OrderDAO().getOrderById("8XTwU0QgJ9"));

    }
}
