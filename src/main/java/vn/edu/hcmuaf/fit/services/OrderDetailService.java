package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.OrderDAO;
import vn.edu.hcmuaf.fit.DAO.OrderDetailDAO;
import vn.edu.hcmuaf.fit.beans.order.OrderDetail;

import java.util.List;

public class OrderDetailService {
    private static OrderDetailService orderDetailService;
    public static OrderDetailService getInstance() {
        if (orderDetailService == null) {
            orderDetailService = new OrderDetailService();
        }
        return orderDetailService;
    }
    public void insertOrderDetail(String ord_id, String prod_id, String prod_name, String prod_color,
                                  String prod_size, int quantity, double price) {
        new OrderDetailDAO().insertOrderDetail(ord_id, prod_id, prod_name, prod_color, prod_size, quantity, price);
    }
    public List<OrderDetail> getListDetailsFromOrdId(String id) {
        return new OrderDetailDAO().getListDetailsFromOrdId(id);
    }

    public void removeOrder(String ord_id) {
        new OrderDAO().removeOrder(ord_id);
    }
}

