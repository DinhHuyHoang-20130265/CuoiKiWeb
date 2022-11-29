package vn.edu.hcmuaf.fit.beans.product;

import java.io.Serializable;
import java.util.List;

public class ProductColor implements Serializable {
    private List<String> values;

    public ProductColor() {
    }

    public ProductColor(List<String> values) {
        this.values = values;
    }


    public List<String> getValues() {
        return values;
    }

    public void setValues(List<String> values) {
        this.values = values;
    }

    @Override
    public String toString() {
        return "ProductColor{" +
                ", values=" + values +
                '}';
    }
}

