package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class StaticAnalyzeDAO {
    public StaticAnalyzeDAO() {

    }

    public List<Map<String, Object>> MostBuy() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT od.prod_id, od.prod_name, SUM(od.quantity) sumQuan " +
                                "FROM order_details od " +
                                "GROUP BY od.prod_id " +
                                "ORDER BY sumQuan DESC ")
                        .mapToMap()
                        .list()
        );
    }

    public List<Map<String, Object>> MostStorage() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT p.id, p.prod_name, p.quantity " +
                                "FROM product p " +
                                "ORDER BY p.quantity DESC ")
                        .mapToMap()
                        .list()
        );
    }

    public List<Map<String, Object>> MostSeen() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT p.id, p.prod_name, p.view_count " +
                                "FROM product p " +
                                "ORDER BY p.view_count DESC ")
                        .mapToMap()
                        .list()
        );
    }

    public List<Map<String, Object>> MostBuyFromUser() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT o.customer_id, ai.full_name, COUNT(o.customer_id) as buy " +
                                "FROM orders o INNER JOIN user_account ua ON o.customer_id = ua.id " +
                                "INNER JOIN account_information ai ON ua.id = ai.id " +
                                "GROUP BY o.customer_id " +
                                "ORDER BY buy DESC ")
                        .mapToMap()
                        .list()
        );
    }

    public static void main(String[] args) {
    }
}
