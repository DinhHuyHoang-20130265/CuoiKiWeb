package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.product.ProductReview;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class ProductReviewDAO {
    public List<ProductReview> getCommentsByProductID(String id){
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT pr.review_id, pr.review_prod" +
                        ", pr.review_by, pr.vote_star ,pr.review_desc, pr.review_status, pr.review_date FROM product_review pr" +
                        " INNER JOIN product prod ON pr.review_prod = prod.id WHERE pr.review_status = 1 AND prod.id =? ")
                .bind(0,id)
                .mapToBean(ProductReview.class)
                .stream()
                .collect(Collectors.toList()));
    }
}
