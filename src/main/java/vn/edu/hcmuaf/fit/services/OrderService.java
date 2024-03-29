package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.OrderDAO;
import vn.edu.hcmuaf.fit.DAO.OrderDetailDAO;
import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.beans.order.OrderDetail;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class OrderService {
    private static OrderService orderService;

    public static OrderService getInstance() {
        if (orderService == null) {
            orderService = new OrderService();
        }
        return orderService;
    }

    public void insertOrder(String ord_id, int pay_ment, double total, String address, String receive_name, String email, String phone_number, String note, String customer_id, String code_id, double transferfee) {
        new OrderDAO().insertOrder(ord_id, pay_ment, total, address, receive_name, email, phone_number, note, customer_id, code_id, transferfee);
    }

    public List<Order> getOrderListByUserId(String id) {
        return new OrderDAO().getOrderListByUserId(id);
    }

    public Order getOrderById(String id) {
        return new OrderDAO().getOrderById(id);
    }

    public Order getOrderByIdTransaction(String id) {
        return new OrderDAO().getOrderByIdTransaction(id);
    }

    public List<Order> getOrderListCondition(String page, String order_by, String search) {
        return new OrderDAO().getOrderListCondition(page, order_by, search);
    }

    public void UpdatePaymentStatus(String id) {
        new OrderDAO().UpdatePaymentStatus(id);
    }

    public void UpdatePaymentStatusNotPay(String id) {
        new OrderDAO().UpdatePaymentStatusNotPay(id);
    }

    public void UpdateOrderStatus(String id) {
        new OrderDAO().UpdateOrderStatus(id);
    }

    public void UpdateDeliveryStatus(String id, String status) {
        new OrderDAO().UpdateDeliveryStatus(id, status);
    }

    public void setTransactionVNPAY(String ord_id, String transaction_code, String transaction_date_string) {
        new OrderDAO().setTransactionVNPAY(ord_id, transaction_code, transaction_date_string);
    }

    public List<Order> getDeletedOrderListCondition(String page, String order, String search) {
        return new OrderDAO().getDeletedOrderListCondition(page, order, search);
    }

    public String containTransaction_id(String id) {
        return new OrderDAO().containTransaction_id(id);
    }

    public void setID_transport(String ord_id, String id) {
        new OrderDAO().setID_Transport(ord_id, id);
    }

    public static void main(String[] args) {
        String id = new OrderDAO().generateIdOrder();
    }
}
