package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.Date;

public class Notify_Admin implements Serializable {
    private String id;
    private String content;
    private String order_id;
    private Date created_date;

    public Notify_Admin() {

    }

    public Notify_Admin(String id, String content, String order_id, Date created_date) {
        this.id = id;
        this.content = content;
        this.order_id = order_id;
        this.created_date = created_date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public Date getCreated_date() {
        return created_date;
    }
    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    @Override
    public String toString() {
        return "Notify_Admin{" +
                "id='" + id + '\'' +
                ", content='" + content + '\'' +
                ", order_id='" + order_id + '\'' +
                ", created_date=" + created_date +
                '}';
    }
}
