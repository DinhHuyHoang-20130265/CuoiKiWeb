package vn.edu.hcmuaf.fit.beans.category;

import java.io.Serializable;

public class Category implements Serializable {
    private String id;
    private String name;
    private String desc;
    private String parent_id;
    private int status;

    public Category() {
    }

    public Category(String id, String name, String desc, String parent_id, int status) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.parent_id = parent_id;
        this.status = status;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
