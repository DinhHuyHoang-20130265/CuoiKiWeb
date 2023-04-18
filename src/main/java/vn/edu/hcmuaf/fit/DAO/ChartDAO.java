package vn.edu.hcmuaf.fit.DAO;

import org.jdbi.v3.core.generic.GenericType;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.time.YearMonth;
import java.util.Map;
import java.util.TreeMap;

public class ChartDAO {
    public ChartDAO() {
    }

    public Map<String, Integer> SaledProductByNearest6Months() {
        Map<String, Integer> result = JDBIConnector.get().withHandle(handle ->
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
        TreeMap<String, Integer> resultMap = new TreeMap<>();
        for (Map.Entry<String, Integer> entry : result.entrySet()) {
            String[] date = entry.getKey().split("-");
            String yearMonth = date[0] + "-" + date[1];
            int value = entry.getValue();
            resultMap.put(yearMonth, resultMap.getOrDefault(yearMonth, 0) + value);
        }
        // Thêm các tháng bị thiếu giữa khoảng các key trong Map mới
        YearMonth firstKey = YearMonth.parse(resultMap.firstKey());
        YearMonth lastKey = YearMonth.parse(resultMap.lastKey());
        YearMonth currentKey = firstKey;
        while (!currentKey.equals(lastKey)) {
            currentKey = currentKey.plusMonths(1);
            if (!resultMap.containsKey(currentKey.toString())) {
                resultMap.put(String.valueOf(currentKey), 0);
            }
        }

        // Bổ sung ít nhất 5 tháng trước tháng gần nhất
        YearMonth latestKey = YearMonth.parse(resultMap.lastKey());
        for (int i = 1; i <= 5; i++) {
            YearMonth previousKey = latestKey.minusMonths(i);
            if (!resultMap.containsKey(previousKey.toString())) {
                resultMap.put(String.valueOf(previousKey), 0);
            }
        }
        return resultMap;
    }

    public static void main(String[] args) {
        System.out.println(new ChartDAO().SaledProductByNearest6Months()
        );
    }

}