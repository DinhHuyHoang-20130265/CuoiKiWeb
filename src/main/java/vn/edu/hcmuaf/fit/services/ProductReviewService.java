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
    public ProductReview getReviewByIdReview(String id) {
        ProductReviewDAO DAO = new ProductReviewDAO();
        return DAO.getReviewByIdReview(id);
    }
    public String AddNewReview(String id, String productid, String comment) {
        ProductReviewDAO DAO = new ProductReviewDAO();
        return DAO.AddNewReview(id, productid, comment);
    }
    public void RemoveReview(String id) {
        ProductReviewDAO DAO = new ProductReviewDAO();
        DAO.RemoveComment(id);
    }
    public void EditReview(String id, String new_reviewdesc) {
        ProductReviewDAO DAO = new ProductReviewDAO();
        DAO.EditComment(id, new_reviewdesc);
    }

    public static void main(String[] args) {
        System.out.println("product 1 comment: "+ new ProductReviewDAO().getCommentsByProductID("prod003"));
        System.out.println(new ProductReviewDAO().getReviewByIdReview("review01"));
        ProductReviewService.getInstance().EditReview("0QhO4faMmp", "lamao lmao");
    }
}
