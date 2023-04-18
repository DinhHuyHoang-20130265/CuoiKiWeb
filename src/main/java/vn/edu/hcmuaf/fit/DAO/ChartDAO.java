package vn.edu.hcmuaf.fit.DAO;

import org.jdbi.v3.core.generic.GenericType;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class ChartDAO {
    public ChartDAO() {
    }

    public Map<String, Integer> SaledProductByNearest6Months() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT o.ord_date as year, SUM(od.quantity) AS total" +
                                " FROM orders o INNER JOIN order_details od ON o.ord_id = od.ord_id" +
                                " WHERE o.ord_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH) " +
                                " GROUP BY o.ord_date" +
                                " ORDER BY o.ord_date DESC" +
                                " LIMIT 6")
                        .setMapKeyColumn("year")
                        .setMapValueColumn("total")
                        .collectInto(new GenericType<>() {
                        })
        );
    }

    public static void main(String[] args) {
        System.out.println(new ChartDAO().SaledProductByNearest6Months()
        );
    }

}