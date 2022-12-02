package vn.edu.hcmuaf.fit.beans.category;

import java.io.Serializable;

public class Category implements Serializable {
    private String id;
    private String cate_name;
    private String cate_desc;
    private String parent_id;
    private Byte cate_status;
    public Category() {
    }

    public Category(String id, String cate_name, String cate_desc, String parent_id, Byte cate_status) {
        this.id = id;
        this.cate_name = cate_name;
        this.cate_desc = cate_desc;
        this.parent_id = parent_id;
        this.cate_status = cate_status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCate_name() {
        return cate_name;
    }

    public void setCate_name(String cate_name) {
        this.cate_name = cate_name;
    }

    public String getCate_desc() {
        return cate_desc;
    }

    public void setCate_desc(String cate_desc) {
        this.cate_desc = cate_desc;
    }

    public String getParent_id() {
        return parent_id;
    }

    public void setParent_id(String parent_id) {
        this.parent_id = parent_id;
    }

    public Byte getCate_status() {
        return cate_status;
    }

    public void setCate_status(Byte cate_status) {
        this.cate_status = cate_status;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id='" + id + '\'' +
                ", cate_name='" + cate_name + '\'' +
                ", cate_desc='" + cate_desc + '\'' +
                ", parent_id='" + parent_id + '\'' +
                ", cate_status=" + cate_status +
                '}';
    }
}
