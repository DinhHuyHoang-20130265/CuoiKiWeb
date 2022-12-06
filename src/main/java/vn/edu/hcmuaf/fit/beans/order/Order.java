package vn.edu.hcmuaf.fit.beans.order;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {
    private String ord_id;
    private Date ord_date;
    private byte status;
    private byte payment_method;
    private byte delivered;
    private Date delivery_date;
    private String custumer_id;

    public Order() {

    }
    public Order(String ord_id, Date ord_date, byte status, byte payment_method, byte delivered, Date delivery_date, String custumer_id) {
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

    public Date getOrd_date() {
        return ord_date;
    }

    public void setOrd_date(Date ord_date) {
        this.ord_date = ord_date;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public byte getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(byte payment_method) {
        this.payment_method = payment_method;
    }

    public byte getDelivered() {
        return delivered;
    }

    public void setDelivered(byte delivered) {
        this.delivered = delivered;
    }

    public Date getDelivery_date() {
        return delivery_date;
    }

    public void setDelivery_date(Date delivery_date) {
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
