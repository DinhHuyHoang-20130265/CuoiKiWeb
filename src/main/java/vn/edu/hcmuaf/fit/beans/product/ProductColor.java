package vn.edu.hcmuaf.fit.beans.product;

import java.io.Serializable;
import java.util.List;

public class ProductColor implements Serializable {
    private String prod_id;
    private String color_name;

    public ProductColor() {
    }

    public ProductColor(String prod_id, String color_name) {
        this.prod_id = prod_id;
        this.color_name = color_name;
    }

    public String getProd_id() {
        return prod_id;
    }

    public void setProd_id(String prod_id) {
        this.prod_id = prod_id;
    }

    public String getColor_name() {
        return color_name;
    }

    public void setColor_name(String color_name) {
        this.color_name = color_name;
    }

    @Override
    public String toString() {
        return "ProductColor{" +
                "prod_id=" + prod_id +
                ", color_name='" + color_name + '\'' +
                '}';
    }
}

