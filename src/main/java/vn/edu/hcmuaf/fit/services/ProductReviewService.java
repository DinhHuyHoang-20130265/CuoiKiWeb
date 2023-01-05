package vn.edu.hcmuaf.fit.services;


import vn.edu.hcmuaf.fit.DAO.ProductReviewDAO;
import vn.edu.hcmuaf.fit.beans.product.ProductReview;

import java.util.List;

public class ProductReviewService {
    private static ProductReviewService productReviewService;

    public static ProductReviewService getInstance() {
        if (productReviewService == null) {
            productReviewService = new ProductReviewService();
        }
        return productReviewService;
    }
    public List<ProductReview> getCommentByProductID(String id) {
        ProductReviewDAO DAO = new ProductReviewDAO();
        return DAO.getCommentsByProductID(id);
    }

    public static void main(String[] args) {
        System.out.println("product 1 comment: "+ new ProductReviewDAO().getCommentsByProductID("prod003"));
    }
}
