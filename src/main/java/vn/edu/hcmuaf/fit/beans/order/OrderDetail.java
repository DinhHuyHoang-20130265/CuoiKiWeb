package vn.edu.hcmuaf.fit.beans.order;

import java.io.Serializable;

public class OrderDetail implements Serializable {
    private String ord_id;
    private String prod_id;
    private String prod_name;
    private String prod_color;
    private String prod_size;
    private int quantity;
    private double price;

    public OrderDetail() {

    }

    public OrderDetail(String ord_id, String prod_id, String prod_name, String prod_color, String prod_size, int quantity, double price) {
        this.ord_id = ord_id;
        this.prod_id = prod_id;
        this.prod_name = prod_name;
        this.prod_color = prod_color;
        this.prod_size = prod_size;
        this.quantity = quantity;
        this.price = price;
    }

    public String getOrd_id() {
        return ord_id;
    }

    public void setOrd_id(String ord_id) {
        this.ord_id = ord_id;
    }

    public String getProd_id() {
        return prod_id;
    }

    public void setProd_id(String prod_id) {
        this.prod_id = prod_id;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public String getProd_color() {
        return prod_color;
    }

    public void setProd_color(String prod_color) {
        this.prod_color = prod_color;
    }

    public String getProd_size() {
        return prod_size;
    }

    public void setProd_size(String prod_size) {
        this.prod_size = prod_size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
