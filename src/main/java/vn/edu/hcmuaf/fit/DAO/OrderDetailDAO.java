package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

public class OrderDetailDAO {
    public void insertOrderDetail(String ord_id, String prod_id, String prod_name, String prod_color,
                            String prod_size, int quantity, double price){
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("INSERT INTO order_details (ord_id, prod_id, prod_name, prod_color, prod_size, quantity, price)" +
                            " VALUES(?,?,?,?,?,?,?)")
                    .bind(0,ord_id)
                    .bind(1,prod_id)
                    .bind(2,prod_name)
                    .bind(3,prod_color)
                    .bind(4,prod_size)
                    .bind(5,quantity)
                    .bind(6,price)
                    .execute();
            return null;
        });
    }
}
