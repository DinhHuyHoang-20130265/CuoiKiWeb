package vn.edu.hcmuaf.fit.DAO;
import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.promotion.Promotion;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
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
    public Promotion getPromotionHiddenAndDetails(String id) {
        return JDBIConnector.get().withHandle(handle
                -> handle.createQuery("SELECT promo_id, product_id, name_prom, desc_prom, discount_rate, status, start_date, end_date " +
                "FROM promotion WHERE promo_id = ?")
                .bind(0, id)
                .mapToBean(Promotion.class)
                .one());
    }

    private String generateIdPromotion() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT id FROM user_account").mapTo(String.class).stream().collect(Collectors.toList()));
        String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String alphaNumeric = upperAlphabet + lowerAlphabet + numbers;

        StringBuilder sb = new StringBuilder();

        // create an object of Random class
        Random random = new Random();
        // specify length of random string
        int length = 10;
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(alphaNumeric.length());
            char randomChar = alphaNumeric.charAt(index);
            sb.append(randomChar);
        }
        if (id.contains(sb.toString())) return generateIdPromotion();
        else return sb.toString();

    }
    public void InsertNewPromotion(String product_id, String name_promo, String desc_promo, int discount_rate, int status, String start_date, String end_date) {
        String promo_id = generateIdPromotion();
        JDBIConnector.get().withHandle(handle ->{
                    handle.createUpdate("INSERT INTO promotion VALUES (?,?,?,?,?,?,?,?)")
                            .bind(0, promo_id)
                            .bind(1, product_id)
                            .bind(2, name_promo)
                            .bind(3, desc_promo)
                            .bind(4, discount_rate)
                            .bind(5, status)
                            .bind(6, start_date)
                            .bind(7, end_date)
                            .execute();
                    return true;
                }
        );
    }
    public void UpdatePromotion(String promo_id, String product_id, String name_promo, String desc_promo, int discount_rate, int status, String start_date, String end_date) {
        JDBIConnector.get().withHandle(handle ->{
                    handle.createUpdate("UPDATE promotion SET product_id = ?, name_prom = ?, desc_prom = ?, discount_rate = ? , status = ? , start_date = ? , end_date = ? WHERE promo_id = ?")
                            .bind(0, product_id)
                            .bind(1, name_promo)
                            .bind(2, desc_promo)
                            .bind(3, discount_rate)
                            .bind(4, status)
                            .bind(5, start_date)
                            .bind(6, end_date)
                            .bind(7, promo_id)
                            .execute();
                    return null;
                }
        );
    }

    public static void main(String[] args) {
        System.out.println(new PromotionDAO().loadAll());
        System.out.println(new PromotionDAO().loadPromotionWithConditionContainsStatus(1, 6));
    }
}
