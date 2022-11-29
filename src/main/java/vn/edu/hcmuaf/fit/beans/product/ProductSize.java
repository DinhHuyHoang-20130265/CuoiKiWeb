package vn.edu.hcmuaf.fit.beans.product;

import java.io.Serializable;
import java.util.List;

public class ProductSize implements Serializable {
    private List<String> values;

    public ProductSize() {
    }

    public ProductSize(List<String> values) {
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
        return "ProductSize{" +
                ", values=" + values +
                '}';
    }
}
