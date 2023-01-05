package vn.edu.hcmuaf.fit.beans.product;

import java.io.Serializable;

public class ProductReview implements Serializable {
    private String review_id;
    private String review_prod;
    private String review_by;
    private int vote_star;
    private String review_desc;
    private int review_status;
    private String review_date;
    public ProductReview() {
    }

    public ProductReview(String review_id, String review_prod, String review_by, int vote_star, String review_desc, int review_status, String review_date) {
        this.review_id = review_id;
        this.review_prod = review_prod;
        this.review_by = review_by;
        this.vote_star = vote_star;
        this.review_desc = review_desc;
        this.review_status = review_status;
        this.review_date = review_date;
    }

    public String getReview_id() {
        return review_id;
    }

    public void setReview_id(String review_id) {
        this.review_id = review_id;
    }

    public String getReview_prod() {
        return review_prod;
    }

    public void setReview_prod(String review_prod) {
        this.review_prod = review_prod;
    }

    public String getReview_by() {
        return review_by;
    }

    public void setReview_by(String review_by) {
        this.review_by = review_by;
    }

    public int getVote_star() {
        return vote_star;
    }

    public void setVote_star(int vote_star) {
        this.vote_star = vote_star;
    }

    public String getReview_desc() {
        return review_desc;
    }

    public void setReview_desc(String review_desc) {
        this.review_desc = review_desc;
    }

    public int getReview_status() {
        return review_status;
    }

    public void setReview_status(int review_status) {
        this.review_status = review_status;
    }

    public String getReview_date() {
        return review_date;
    }

    public void setReview_date(String review_date) {
        this.review_date = review_date;
    }

    @Override
    public String toString() {
        return "ProductReview{" +
                "review_id='" + review_id + '\'' +
                ", review_prod='" + review_prod + '\'' +
                ", review_by='" + review_by + '\'' +
                ", vote_star=" + vote_star +
                ", review_desc='" + review_desc + '\'' +
                ", review_status=" + review_status +
                ", review_date='" + review_date + '\'' +
                '}';
    }
}
