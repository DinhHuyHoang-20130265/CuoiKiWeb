package vn.edu.hcmuaf.fit.beans.promotion_code;

import java.io.Serializable;

public class PromotionCode implements Serializable {
    private String code_id;
    private String name_code;
    private String desc_code;
    private String type_code;
    private int discount_money;
    private int status;
    private String start_date;
    private String end_date;
    private String created_date;
    private String created_by;
    public PromotionCode() {
    }

    public PromotionCode(String code_id, String name_code, String desc_code, String type_code, int discount_money, int status, String start_date, String end_date, String created_date, String created_by) {
        this.code_id = code_id;
        this.name_code = name_code;
        this.desc_code = desc_code;
        this.type_code = type_code;
        this.discount_money = discount_money;
        this.status = status;
        this.start_date = start_date;
        this.end_date = end_date;
        this.created_date = created_date;
        this.created_by = created_by;
    }

    public String getCode_id() {
        return code_id;
    }

    public void setCode_id(String code_id) {
        this.code_id = code_id;
    }

    public String getName_code() {
        return name_code;
    }

    public void setName_code(String name_code) {
        this.name_code = name_code;
    }

    public String getDesc_code() {
        return desc_code;
    }

    public void setDesc_code(String desc_code) {
        this.desc_code = desc_code;
    }

    public String getType_code() {
        return type_code;
    }

    public void setType_code(String type_code) {
        this.type_code = type_code;
    }

    public int getDiscount_money() {
        return discount_money;
    }

    public void setDiscount_money(int discount_money) {
        this.discount_money = discount_money;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public String getCreated_by() {
        return created_by;
    }

    public void setCreated_by(String created_by) {
        this.created_by = created_by;
    }

    @Override
    public String toString() {
        return "PromotionCode{" +
                "code_id='" + code_id + '\'' +
                ", name_code='" + name_code + '\'' +
                ", desc_code='" + desc_code + '\'' +
                ", type_code='" + type_code + '\'' +
                ", discount_money=" + discount_money +
                ", status=" + status +
                ", start_date='" + start_date + '\'' +
                ", end_date='" + end_date + '\'' +
                ", created_date='" + created_date + '\'' +
                ", created_by='" + created_by + '\'' +
                '}';
    }
}
