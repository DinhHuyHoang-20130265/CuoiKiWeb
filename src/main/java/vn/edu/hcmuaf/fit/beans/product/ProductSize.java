package vn.edu.hcmuaf.fit.beans.product;

import java.io.Serializable;
import java.util.List;

public class ProductSize implements Serializable {
    private String prod_id;
    private String size_name;

    public ProductSize() {
    }

    public ProductSize(String prod_id, String size_name) {
        this.prod_id = prod_id;
        this.size_name = size_name;
    }

    public String getProd_id() {
        return prod_id;
    }

    public void setProd_id(String prod_id) {
        this.prod_id = prod_id;
    }

    public String getSize_name() {
        return size_name;
    }

    public void setSize_name(String size_name) {
        this.size_name = size_name;
    }

    @Override
    public String toString() {
        return "ProductSize{" +
                "prod_id=" + prod_id +
                ", size_name='" + size_name + '\'' +
                '}';
    }
}
