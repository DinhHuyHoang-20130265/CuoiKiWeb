package vn.edu.hcmuaf.fit.beans.product;

import java.io.Serializable;
import java.util.Date;

public class Category implements Serializable {
    private String id;
    private String name;
    private String desc;
    private String parent_id;
    private boolean status;
    private Date created_date;
    private String created_by;
    private Date updated_date;
    private String updated_by;

    public Category() {
    }

    public Category(String id, String name, String desc, String parent_id, boolean status, Date created_date, String created_by, Date updated_date, String updated_by) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.parent_id = parent_id;
        this.status = status;
        this.created_date = created_date;
        this.created_by = created_by;
        this.updated_date = updated_date;
        this.updated_by = updated_by;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getParent_id() {
        return parent_id;
    }

    public void setParent_id(String parent_id) {
        this.parent_id = parent_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public String getCreated_by() {
        return created_by;
    }

    public void setCreated_by(String created_by) {
        this.created_by = created_by;
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

    @Override
    public String toString() {
        return "Category{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", desc='" + desc + '\'' +
                ", parent_id='" + parent_id + '\'' +
                ", status=" + status +
                ", created_date=" + created_date +
                ", created_by='" + created_by + '\'' +
                ", updated_date=" + updated_date +
                ", updated_by='" + updated_by + '\'' +
                '}';
    }
}
