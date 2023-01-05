package vn.edu.hcmuaf.fit.beans.order;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {
    private String ord_id;
    private String ord_date;
    private int status;
    private int payment_method;
    private int delivered;
    private String delivery_date;
    private String custumer_id;

    public Order() {

    }
    public Order(String ord_id, String ord_date, int status, int payment_method, int delivered, String delivery_date, String custumer_id) {
        this.ord_id = ord_id;
        this.ord_date = ord_date;
        this.status = status;
        this.payment_method = payment_method;
        this.delivered = delivered;
        this.delivery_date = delivery_date;
        this.custumer_id = custumer_id;
    }

    public String getOrd_id() {
        return ord_id;
    }

    public void setOrd_id(String ord_id) {
        this.ord_id = ord_id;
    }

    public String getOrd_date() {
        return ord_date;
    }

    public void setOrd_date(String ord_date) {
        this.ord_date = ord_date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(int payment_method) {
        this.payment_method = payment_method;
    }

    public int getDelivered() {
        return delivered;
    }

    public void setDelivered(int delivered) {
        this.delivered = delivered;
    }

    public String getDelivery_date() {
        return delivery_date;
    }

    public void setDelivery_date(String delivery_date) {
        this.delivery_date = delivery_date;
    }

    public String getCustumer_id() {
        return custumer_id;
    }

    public void setCustumer_id(String custumer_id) {
        this.custumer_id = custumer_id;
    }

    @Override
    public String toString() {
        return "Order{" +
                "ord_id='" + ord_id + '\'' +
                ", ord_date=" + ord_date +
                ", status=" + status +
                ", payment_method=" + payment_method +
                ", delivered=" + delivered +
                ", delivery_date=" + delivery_date +
                ", custumer_id='" + custumer_id + '\'' +
                '}';
    }
}
