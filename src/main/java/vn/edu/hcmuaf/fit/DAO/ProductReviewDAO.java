package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.product.ProductReview;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Random;
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
    public ProductReview getReviewByIdReview(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM product_review WHERE review_id = ?")
                .bind(0, id)
                .mapToBean(ProductReview.class)
                .first()
        );
    }
    public String generateIdReviewProduct() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT review_id FROM product_review").mapTo(String.class).stream().collect(Collectors.toList()));
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
        if (id.contains(sb.toString())) return generateIdReviewProduct();
        else return sb.toString();
    }

    public String AddNewReview(String id, String productid, String comment) {
        String idProductReview = generateIdReviewProduct();
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("INSERT INTO product_review values (?, ?, ?, 4, ?, 1, CURDATE())")
                            .bind(0, idProductReview)
                            .bind(1, productid)
                            .bind(2, id)
                            .bind(3, comment)
                            .execute();
                    return true;
                }
        );
        return idProductReview;
    }
    public void RemoveComment(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM product_review WHERE review_id = ?")
                            .bind(0, id)
                            .execute();
                    return true;
                }
        );
    }
    public void EditComment(String id, String new_reviewdesc) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("UPDATE product_review SET review_desc = ? WHERE review_id = ?")
                            .bind(0, new_reviewdesc)
                            .bind(1, id)
                            .execute();
                    return true;
                }
        );
    }

    public static void main(String[] args) {

    }
}
