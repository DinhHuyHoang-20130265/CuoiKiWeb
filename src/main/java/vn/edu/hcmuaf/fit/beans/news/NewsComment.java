package vn.edu.hcmuaf.fit.beans.news;

import java.util.Date;

public class NewsComment {
    private String comment_id;
    private String news_id;
    private String comment_by;
    private String description;
    private String parent_comment;
    private Date comment_date;
    private Byte comment_status;

    public NewsComment(String comment_id, String news_id, String comment_by, String description, String parent_comment, Date comment_date, Byte comment_status) {
        this.comment_id = comment_id;
        this.news_id = news_id;
        this.comment_by = comment_by;
        this.description = description;
        this.parent_comment = parent_comment;
        this.comment_date = comment_date;
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

    public String getParent_comment() {
        return parent_comment;
    }

    public void setParent_comment(String parent_comment) {
        this.parent_comment = parent_comment;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
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
                ", parent_comment='" + parent_comment + '\'' +
                ", comment_date=" + comment_date +
                ", comment_status=" + comment_status +
                '}';
    }
}
