package vn.edu.hcmuaf.fit.beans.product;

import java.io.Serializable;
import java.util.List;

public class ProductSize implements Serializable {
    private int id;
    private String color_name;

    public ProductSize() {
    }

    public ProductSize(int id, String color_name) {
        this.id = id;
        this.color_name = color_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getColor_name() {
        return color_name;
    }

    public void setColor_name(String color_name) {
        this.color_name = color_name;
    }

    @Override
    public String toString() {
        return "ProductSize{" +
                "id=" + id +
                ", color_name='" + color_name + '\'' +
                '}';
    }
}
