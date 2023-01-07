package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.OrderDAO;
import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.beans.order.OrderDetail;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class OrderService {
    private static OrderService orderService;

    public static OrderService getInstance() {
        if (orderService == null) {
            orderService = new OrderService();
        }
        return orderService;
    }

    public void insertOrder(String ord_id, int pay_ment, double total, String address, String receive_name, String email, String phone_number, String note, String customer_id) {
        new OrderDAO().insertOrder(ord_id, pay_ment, total, address, receive_name, email, phone_number, note, customer_id);
    }

    public List<Order> getOrderListByUserId(String id) {
        return new OrderDAO().getOrderListByUserId(id);
    }

    public Order getOrderById(String id) {
        return new OrderDAO().getOrderById(id);
    }

    public List<OrderDetail> getListDetailsFromOrdId(String id) {
        return new OrderDAO().getListDetailsFromOrdId(id);
    }

    public static void main(String[] args) {
        String id = new OrderDAO().generateIdOrder();
        OrderService.getInstance().insertOrder(id, 1, 31288.0, "HCM city", "Hiep sss Chai", "dskakd@gmail.com", "21388821812", "Dong hang can than", "user1");
    }

    public List<Order> getOrderListCondition(String page, String order_by, String search) {
        return new OrderDAO().getOrderListCondition(page, order_by, search);
    }
}
