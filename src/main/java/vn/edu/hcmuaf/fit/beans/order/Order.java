package vn.edu.hcmuaf.fit.beans.order;

import java.io.Serializable;

public class Order implements Serializable {
    private String ord_id;
    private String ord_date;
    private int status;
    private int payment_method;
    private int payment_status;
    private int delivered;
    private int isCanceled;
    private double total;
    private String delivery_date;
    private String customer_id;
    private String address;
    private String receive_name;
    private String email;
    private String phone_number;
    private String note;
    private String code_id;
    private double transfer_fee;

    private String transaction_code;

    private String transaction_date_string;

    public Order() {
    }

    public Order(String ord_id, String ord_date, int status, int payment_method, int payment_status, int delivered, int isCanceled, double total, String delivery_date, String customer_id, String address, String receive_name, String email, String phone_number, String note, String code_id, double transfer_fee, String transaction_code, String transaction_date_string) {
        this.ord_id = ord_id;
        this.ord_date = ord_date;
        this.status = status;
        this.payment_method = payment_method;
        this.payment_status = payment_status;
        this.delivered = delivered;
        this.isCanceled = isCanceled;
        this.total = total;
        this.delivery_date = delivery_date;
        this.customer_id = customer_id;
        this.address = address;
        this.receive_name = receive_name;
        this.email = email;
        this.phone_number = phone_number;
        this.note = note;
        this.code_id = code_id;
        this.transfer_fee = transfer_fee;
        this.transaction_code = transaction_code;
        this.transaction_date_string = transaction_date_string;
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

    public int getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(int payment_status) {
        this.payment_status = payment_status;
    }

    public int getDelivered() {
        return delivered;
    }

    public void setDelivered(int delivered) {
        this.delivered = delivered;
    }

    public int getIsCanceled() {
        return isCanceled;
    }

    public void setIsCanceled(int isCanceled) {
        this.isCanceled = isCanceled;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getDelivery_date() {
        return delivery_date;
    }

    public void setDelivery_date(String delivery_date) {
        this.delivery_date = delivery_date;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReceive_name() {
        return receive_name;
    }

    public void setReceive_name(String receive_name) {
        this.receive_name = receive_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCode_id() {
        return code_id;
    }

    public void setCode_id(String code_id) {
        this.code_id = code_id;
    }

    public double getTransfer_fee() {
        return transfer_fee;
    }

    public void setTransfer_fee(double transfer_fee) {
        this.transfer_fee = transfer_fee;
    }

    public String getTransaction_code() {
        return transaction_code;
    }

    public void setTransaction_code(String transaction_code) {
        this.transaction_code = transaction_code;
    }

    public String getTransaction_date_string() {
        return transaction_date_string;
    }

    public void setTransaction_date_string(String transaction_date_string) {
        this.transaction_date_string = transaction_date_string;
    }

    @Override
    public String toString() {
        return "Order{" +
                "ord_id='" + ord_id + '\'' +
                ", ord_date='" + ord_date + '\'' +
                ", status=" + status +
                ", payment_method=" + payment_method +
                ", payment_status=" + payment_status +
                ", delivered=" + delivered +
                ", isCanceled=" + isCanceled +
                ", total=" + total +
                ", delivery_date='" + delivery_date + '\'' +
                ", customer_id='" + customer_id + '\'' +
                ", address='" + address + '\'' +
                ", receive_name='" + receive_name + '\'' +
                ", email='" + email + '\'' +
                ", phone_number='" + phone_number + '\'' +
                ", note='" + note + '\'' +
                ", code_id='" + code_id + '\'' +
                ", transfer_fee='" + transfer_fee + '\'' +
                ", transaction_code='" + transaction_code + '\'' +
                ", transaction_date_string='" + transaction_date_string + '\'' +
                '}';
    }
}
