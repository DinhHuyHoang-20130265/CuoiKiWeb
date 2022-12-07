package vn.edu.hcmuaf.fit.beans.news;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
public class News implements Serializable{
    private String news_id;
    private String news_title;
    private String description;
    private String news_img_link;
    private Date posted_date;
    private String posted_by;
    private Date updated_date;
    private String updated_by;
    private List<NewsComment> comments;

    public News(String news_id, String news_title, String description, String news_img_link, Date posted_date,
                String posted_by, Date updated_date, String updated_by, List<NewsComment> comments) {
        this.news_id = news_id;
        this.news_title = news_title;
        this.description = description;
        this.news_img_link = news_img_link;
        this.posted_date = posted_date;
        this.posted_by = posted_by;
        this.updated_date = updated_date;
        this.updated_by = updated_by;
        this.comments = comments;
    }

    public String getNews_id() {
        return news_id;
    }

    public void setNews_id(String news_id) {
        this.news_id = news_id;
    }

    public String getNews_title() {
        return news_title;
    }

    public void setNews_title(String news_title) {
        this.news_title = news_title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNews_img_link() {
        return news_img_link;
    }

    public void setNews_img_link(String news_img_link) {
        this.news_img_link = news_img_link;
    }

    public Date getPosted_date() {
        return posted_date;
    }

    public void setPosted_date(Date posted_date) {
        this.posted_date = posted_date;
    }

    public String getPosted_by() {
        return posted_by;
    }

    public void setPosted_by(String posted_by) {
        this.posted_by = posted_by;
    }

    public Date getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(Date updated_date) {
        this.updated_date = updated_date;
    }

    public String getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(String updated_by) {
        this.updated_by = updated_by;
    }

    public List<NewsComment> getComments() {
        return comments;
    }

    public void setComments(List<NewsComment> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "News{" +
                "news_id='" + news_id + '\'' +
                ", news_title='" + news_title + '\'' +
                ", description='" + description + '\'' +
                ", news_img_link='" + news_img_link + '\'' +
                ", posted_date=" + posted_date +
                ", posted_by='" + posted_by + '\'' +
                ", updated_date=" + updated_date +
                ", updated_by='" + updated_by + '\'' +
                ", comments=" + comments +
                '}';
    }
}
