package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.beans.promotion.Promotion;
import vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class PromotionCodeDAO {
    public List<PromotionCode> loadAll() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT code_id, name_code, desc_code, type_code, discount_money, status, start_date, end_date " +
                                "FROM promotion_code WHERE status = 1")
                        .mapToBean(PromotionCode.class)
                        .stream()
                        .collect(Collectors.toList()));
    }

    public PromotionCode getPromotionCodeById(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT code_id, name_code, desc_code, type_code, discount_money, status, start_date, end_date" +
                        " FROM promotion_code WHERE code_id = ?")
                .bind(0, id)
                .mapToBean(PromotionCode.class)
                .first()
        );
    }

    public List<PromotionCode> loadPromotionWithConditionContainsStatus(int page, int num_per_page) {
        String query = "SELECT code_id, name_code, desc_code, type_code, discount_money, status, start_date, end_date, created_date, created_by FROM promotion_code";
        List<PromotionCode> filter = (List<PromotionCode>) JDBIConnector.get().withHandle(handle -> handle.createQuery(query)
                .mapToBean(PromotionCode.class)
                .stream()
                .collect(Collectors.toList()));
        int numpage;
        int start = (page - 1) * num_per_page;
        if (filter.size() - start >= num_per_page) {
            numpage = start + num_per_page;
        } else {
            numpage = filter.size();
        }
        List<PromotionCode> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(filter.get(i));
        }
        return temp;
    }

    public void RemovePromotionCode(String id) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("DELETE FROM promotion_code WHERE code_id=?").bind(0, id).execute();
            return null;
        });
    }

    public PromotionCode getPromotionHiddenAndDetails(String id) {
        return JDBIConnector.get().withHandle(handle
                -> handle.createQuery("SELECT code_id, name_code, desc_code, type_code, discount_money, status, start_date, end_date, created_date, created_by " +
                        "FROM promotion_code WHERE code_id = ?")
                .bind(0, id)
                .mapToBean(PromotionCode.class)
                .one());
    }
    String date = java.time.LocalDate.now().toString();
    public void InsertNewPromotionCode(String code_id, String name_code, String desc_code, String type_code, int discount_money, int status, String start_date, String end_date, String created_by) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("INSERT INTO promotion_code(code_id, name_code, desc_code, type_code, discount_money, status, start_date, end_date, created_by, created_date) VALUES (?,?,?,?,?,?,?,?,?,?)")
                            .bind(0, code_id)
                            .bind(1, name_code)
                            .bind(2, desc_code)
                            .bind(3, type_code)
                            .bind(4, discount_money)
                            .bind(5, status)
                            .bind(6, start_date)
                            .bind(7, end_date)
                            .bind(8, created_by)
                            .bind(9, date)
                            .execute();
                    return true;
                }
        );
    }

    public void UpdatePromotionCode(String code_edit, String code_id, String name_code, String desc_code, String type_code, int discount_money, int status, String start_date, String end_date, String created_by) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("UPDATE promotion_code SET code_id = ?, name_code = ?, desc_code = ?, type_code = ? , discount_money = ? , status = ?, start_date = ? , end_date = ?, created_by = ?, created_date = ? WHERE code_id = ?")
                            .bind(0, code_id)
                            .bind(1, name_code)
                            .bind(2, desc_code)
                            .bind(3, type_code)
                            .bind(4, discount_money)
                            .bind(5, status)
                            .bind(6, start_date)
                            .bind(7, end_date)
                            .bind(8, created_by)
                            .bind(9, date)
                            .bind(10, code_edit)
                            .execute();
                    return null;
                }
        );
    }

    public static void main(String[] args) {
        System.out.println(new PromotionCodeDAO().loadAll());
        System.out.println(new PromotionCodeDAO().getPromotionCodeById("DUNGVAY"));
        System.out.println(new PromotionCodeDAO().loadPromotionWithConditionContainsStatus(2, 6));
    }
}
