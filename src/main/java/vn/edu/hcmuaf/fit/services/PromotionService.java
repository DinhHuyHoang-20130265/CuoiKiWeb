package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.PromotionDAO;
import vn.edu.hcmuaf.fit.beans.promotion.Promotion;

import java.util.ArrayList;
import java.util.List;

public class PromotionService {
    private static PromotionService promotionService;

    public static PromotionService getInstance() {

        if (promotionService == null) {
            promotionService = new PromotionService();
        }
        return promotionService;
    }
    public List<Promotion> loadAll() {
        return new PromotionDAO().loadAll();
    }
    public List<Promotion> loadPromotionWithConditionContainsStatus(int page, int num_per_page) {
        return  new PromotionDAO().loadPromotionWithConditionContainsStatus(page, num_per_page);
    }
    public void RemovePromotion(String id) {
        new PromotionDAO().RemovePromotion(id);
    }
}
