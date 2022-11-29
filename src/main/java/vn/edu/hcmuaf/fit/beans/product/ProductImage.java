package vn.edu.hcmuaf.fit.beans.product;

import java.io.Serializable;

public class ProductImage implements Serializable {
    private String prod_id;
    private String prod_img_link;

    public ProductImage(){}

    public ProductImage(String prod_id, String prod_img_link) {
        this.prod_id = prod_id;
        this.prod_img_link = prod_img_link;
    }

    public String getProd_id() {
        return prod_id;
    }

    public void setProd_id(String prod_id) {
        this.prod_id = prod_id;
    }

    public String getProd_img_link() {
        return prod_img_link;
    }

    public void setProd_img_link(String prod_img_link) {
        this.prod_img_link = prod_img_link;
    }

    @Override
    public String toString() {
        return "ProductImage{" +
                "prod_id='" + prod_id + '\'' +
                ", prod_img_link='" + prod_img_link + '\'' +
                '}';
    }
}
