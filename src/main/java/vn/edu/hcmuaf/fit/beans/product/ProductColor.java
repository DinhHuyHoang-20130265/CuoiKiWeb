package vn.edu.hcmuaf.fit.beans.product;

import java.io.Serializable;
import java.util.List;

public class ProductColor implements Serializable {
    private int id;
    private String size_name;

    public ProductColor() {
    }

    public ProductColor(int id, String size_name) {
        this.id = id;
        this.size_name = size_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSize_name() {
        return size_name;
    }

    public void setSize_name(String size_name) {
        this.size_name = size_name;
    }

    @Override
    public String toString() {
        return "ProductColor{" +
                "id=" + id +
                ", size_name='" + size_name + '\'' +
                '}';
    }
}

