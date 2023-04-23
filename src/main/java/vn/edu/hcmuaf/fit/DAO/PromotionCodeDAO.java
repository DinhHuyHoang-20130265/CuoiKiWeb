package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

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

    public static void main(String[] args) {
        System.out.println(new PromotionCodeDAO().loadAll());
    }
}
