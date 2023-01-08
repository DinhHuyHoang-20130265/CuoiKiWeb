package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.order.OrderDetail;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class OrderDetailDAO {
    public void insertOrderDetail(String ord_id, String prod_id, String prod_name, String prod_color,
                                  String prod_size, int quantity, double price) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("INSERT INTO order_details (ord_id, prod_id, prod_name, prod_color, prod_size, quantity, price)" +
                            " VALUES(?,?,?,?,?,?,?)")
                    .bind(0, ord_id)
                    .bind(1, prod_id)
                    .bind(2, prod_name)
                    .bind(3, prod_color)
                    .bind(4, prod_size)
                    .bind(5, quantity)
                    .bind(6, price)
                    .execute();
            handle.createUpdate("UPDATE product SET quantity= quantity - ? WHERE id=?")
                    .bind(0, quantity)
                    .bind(1, prod_id)
                    .execute();
            return null;
        });
    }
    public List<OrderDetail> getListDetailsFromOrdId(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT o.ord_id, o.prod_id, o.prod_name, o.prod_color, o.prod_size, o.quantity, o.price" +
                        " FROM order_details o WHERE o.ord_id =?")
                .bind(0, id)
                .mapToBean(OrderDetail.class)
                .stream().collect(Collectors.toList())
        );
    }

    public static void main(String[] args) {
        System.out.println(new OrderDetailDAO().getListDetailsFromOrdId("ord007"));
    }
}
