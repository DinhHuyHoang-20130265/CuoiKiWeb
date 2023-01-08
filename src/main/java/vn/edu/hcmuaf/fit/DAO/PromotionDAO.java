package vn.edu.hcmuaf.fit.DAO;
import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.promotion.Promotion;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class PromotionDAO {
    public List<Promotion> loadAll() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT promo_id, product_id, name_prom, desc_prom, discount_rate, status, start_date, end_date " +
                                "FROM promotion WHERE status = 1")
                        .mapToBean(Promotion.class)
                        .stream()
                        .collect(Collectors.toList()));
    }
    public List<Promotion> loadPromotionWithConditionContainsStatus(int page, int num_per_page) {
        String query = "SELECT promo_id, product_id, name_prom, desc_prom, discount_rate, status, start_date, end_date FROM promotion";
        List<Promotion> filter = (List<Promotion>) JDBIConnector.get().withHandle(handle -> handle.createQuery(query)
                .mapToBean(Promotion.class)
                .stream()
                .collect(Collectors.toList()));
        int numpage;
        int start = (page - 1) * num_per_page;
        if (filter.size() - start >= num_per_page) {
            numpage = start + num_per_page;
        } else {
            numpage = filter.size();
        }
        List<Promotion> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(filter.get(i));
        }
        return temp;
    }

    public void RemovePromotion(String id) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("DELETE FROM promotion WHERE promo_id=?").bind(0, id).execute();
            return null;
        });
    }
    public static void main(String[] args) {
        System.out.println(new PromotionDAO().loadAll());
        System.out.println(new PromotionDAO().loadPromotionWithConditionContainsStatus(1, 6));
    }
}
