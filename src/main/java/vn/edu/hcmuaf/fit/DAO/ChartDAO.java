package vn.edu.hcmuaf.fit.DAO;

import org.jdbi.v3.core.generic.GenericType;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

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
            if (!resultMap.containsKey(currentKey.toString()))
                resultMap.put(String.valueOf(currentKey), 0);
        }

        // Bổ sung ít nhất 5 tháng trước tháng gần nhất
        YearMonth latestKey = YearMonth.parse(resultMap.lastKey());
        for (int i = 1; i <= 5; i++) {
            YearMonth previousKey = latestKey.minusMonths(i);
            if (!resultMap.containsKey(previousKey.toString()))
                resultMap.put(String.valueOf(previousKey), 0);
        }
        return resultMap;
    }

    public Map<String, Integer> NumbOrderByNearest6Months() {
        Map<String, Integer> result = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT o.ord_date as year, COUNT(o.ord_id) AS total" +
                                " FROM orders o " +
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
            if (!resultMap.containsKey(currentKey.toString()))
                resultMap.put(String.valueOf(currentKey), 0);
        }

        // Bổ sung ít nhất 5 tháng trước tháng gần nhất
        YearMonth latestKey = YearMonth.parse(resultMap.lastKey());
        for (int i = 1; i <= 5; i++) {
            YearMonth previousKey = latestKey.minusMonths(i);
            if (!resultMap.containsKey(previousKey.toString()))
                resultMap.put(String.valueOf(previousKey), 0);
        }
        return resultMap;
    }

    public Map<String, Double> RevenueNearest6Months() {
        Map<String, Double> result = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT o.ord_date as year, SUM(o.total) AS totalMoney" +
                                " FROM orders o " +
                                " WHERE o.ord_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH) " +
                                " GROUP BY o.ord_date" +
                                " ORDER BY o.ord_date DESC" +
                                " LIMIT 6")
                        .setMapKeyColumn("year")
                        .setMapValueColumn("totalMoney")
                        .collectInto(new GenericType<>() {
                        })
        );
        TreeMap<String, Double> resultMap = new TreeMap<>();
        for (Map.Entry<String, Double> entry : result.entrySet()) {
            String[] date = entry.getKey().split("-");
            String yearMonth = date[0] + "-" + date[1];
            double value = entry.getValue();
            resultMap.put(yearMonth, resultMap.getOrDefault(yearMonth, 0.0) + value);
        }
        // Thêm các tháng bị thiếu giữa khoảng các key trong Map mới
        YearMonth firstKey = YearMonth.parse(resultMap.firstKey());
        YearMonth lastKey = YearMonth.parse(resultMap.lastKey());
        YearMonth currentKey = firstKey;
        while (!currentKey.equals(lastKey)) {
            currentKey = currentKey.plusMonths(1);
            if (!resultMap.containsKey(currentKey.toString()))
                resultMap.put(String.valueOf(currentKey), 0.0);
        }

        // Bổ sung ít nhất 5 tháng trước tháng gần nhất
        YearMonth latestKey = YearMonth.parse(resultMap.lastKey());
        for (int i = 1; i <= 5; i++) {
            YearMonth previousKey = latestKey.minusMonths(i);
            if (!resultMap.containsKey(previousKey.toString()))
                resultMap.put(String.valueOf(previousKey), 0.0);
        }
        return resultMap;
    }

    public Map<String, Map<String, Object>> MostSaledProductByNearest6Months() {
        List<Map<String, Object>> result = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT o.ord_date as day, p.prod_name as name, SUM(od.quantity) as totalQuantity " +
                                "FROM orders o INNER JOIN order_details od ON o.ord_id = od.ord_id " +
                                "INNER JOIN product p ON p.id = od.prod_id " +
                                "WHERE o.ord_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH) " +
                                "GROUP BY o.ord_date, p.prod_name " +
                                "ORDER BY o.ord_date DESC")
                        .mapToMap()
                        .list()
        );
        TreeMap<String, Integer> resultMap = new TreeMap<>();
        Map<String, Map<String, Object>> groupedMap = new LinkedHashMap<>();
        AtomicReference<SimpleDateFormat> sdf = new AtomicReference<>(new SimpleDateFormat("yyyy-MM"));
        Calendar cal = Calendar.getInstance();

        Map<String, Object> latestEntry = null;
        for (Map<String, Object> item : result) {
            Date date = (Date) item.get("day");
            cal.setTime(date);
            String key = sdf.get().format(cal.getTime());

            if (!groupedMap.containsKey(key) || ((BigDecimal) item.get("totalquantity")).intValue() > ((BigDecimal) groupedMap.get(key).get("totalquantity")).intValue()) {
                Map<String, Object> newEntry = new HashMap<>();
                newEntry.put("day", cal.getTime());
                newEntry.put("name", item.get("name"));
                newEntry.put("totalquantity", item.get("totalquantity"));
                groupedMap.put(key, newEntry);
                latestEntry = (latestEntry == null) ? newEntry : (((Date) latestEntry.get("day")).compareTo(((Date) newEntry.get("day"))) < 0) ? newEntry : latestEntry;
            }
        }
        List<Map<String, Object>> resultList = new ArrayList<>(groupedMap.values());
        if (latestEntry != null) {
            cal.setTime((Date) latestEntry.get("day"));
            cal.add(Calendar.MONTH, -1);
            for (int i = 0; i < 5; i++) {
                String key = sdf.get().format(cal.getTime());
                if (!groupedMap.containsKey(key)) {
                    Map<String, Object> nullEntry = new HashMap<>();
                    nullEntry.put("day", cal.getTime());
                    nullEntry.put("name", null);
                    nullEntry.put("totalquantity", null);
                    resultList.add(nullEntry);
                }
                cal.add(Calendar.MONTH, -1);
            }
        }
        Map<String, Map<String, Object>> finalMap = new LinkedHashMap<>();
        for (Map<String, Object> item : resultList) {
            String key = sdf.get().format(item.get("day"));
            finalMap.put(key, item);
        }
        List<Map.Entry<String, Map<String, Object>>> tempEntryList = new ArrayList<>(finalMap.entrySet());
        tempEntryList.sort((o1, o2) -> {
            sdf.set(new SimpleDateFormat("yyyy-MM"));
            Date date1 = null;
            Date date2 = null;
            try {
                date1 = sdf.get().parse(o1.getKey());
                date2 = sdf.get().parse(o2.getKey());
            } catch (Exception e) {
                e.printStackTrace();
            }
            return date2.compareTo(date1);
        });
        Map<String, Map<String, Object>> sortedResultMap = new LinkedHashMap<>();
        for (Map.Entry<String, Map<String, Object>> entry : tempEntryList)
            sortedResultMap.put(entry.getKey(), entry.getValue());
        return sortedResultMap;
    }

    public Map<String, Integer> TopSaleProductThisMonth() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT od.prod_name as nameprod, SUM(od.quantity) AS total " +
                                "FROM orders o INNER JOIN order_details od ON o.ord_id = od.ord_id " +
                                "WHERE YEAR(o.ord_date) = YEAR(NOW()) AND MONTH(o.ord_date) = MONTH(NOW()) " +
                                "GROUP BY YEAR(o.ord_date), MONTH(o.ord_date), od.prod_name " +
                                "ORDER BY o.ord_date DESC")
                        .setMapKeyColumn("nameprod")
                        .setMapValueColumn("total")
                        .collectInto(new GenericType<>() {
                        })
        );
    }

    public int totalAllTime() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT SUM(o.total) " +
                        "FROM orders o").mapTo(Integer.class).first()
        );
    }

    public static void main(String[] args) {
        System.out.println(new ChartDAO().TopSaleProductThisMonth());
    }
}


