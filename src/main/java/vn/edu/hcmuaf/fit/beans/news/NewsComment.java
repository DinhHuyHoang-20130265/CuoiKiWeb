package vn.edu.hcmuaf.fit.beans.news;

import java.io.Serializable;
import java.util.Date;

public class NewsComment implements Serializable {
    private String comment_id;
    private String news_id;
    private String comment_by;
    private String description;
    private Date commented_date;
    private Byte comment_status;

    public NewsComment() {

    }

    public NewsComment(String comment_id, String news_id, String comment_by, String description, Date commented_date, Byte comment_status) {
        this.comment_id = comment_id;
        this.news_id = news_id;
        this.comment_by = comment_by;
        this.description = description;
        this.commented_date = commented_date;
        this.comment_status = comment_status;
    }

    public String getComment_id() {
        return comment_id;
    }

    public void setComment_id(String comment_id) {
        this.comment_id = comment_id;
    }

    public String getNews_id() {
        return news_id;
    }

    public void setNews_id(String news_id) {
        this.news_id = news_id;
    }

    public String getComment_by() {
        return comment_by;
    }

    public void setComment_by(String comment_by) {
        this.comment_by = comment_by;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCommented_date() {
        return commented_date;
    }

    public void setCommented_date(Date commented_date) {
        this.commented_date = commented_date;
    }

    public Byte getComment_status() {
        return comment_status;
    }

    public void setComment_status(Byte comment_status) {
        this.comment_status = comment_status;
    }

    @Override
    public String toString() {
        return "NewsComment{" +
                "comment_id='" + comment_id + '\'' +
                ", news_id='" + news_id + '\'' +
                ", comment_by='" + comment_by + '\'' +
                ", description='" + description + '\'' +
                ", commented_date=" + commented_date +
                ", comment_status=" + comment_status +
                '}';
    }
}
