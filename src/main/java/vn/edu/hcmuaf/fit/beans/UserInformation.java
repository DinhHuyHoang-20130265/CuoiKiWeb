package vn.edu.hcmuaf.fit.beans;

import vn.edu.hcmuaf.fit.services.UserInformationService;

import java.io.Serializable;
import java.util.Date;

public class UserInformation implements Serializable {
    private String id;
    private String full_name;
    private String email;
    private String phone_number;
    private String address;
    private String avatar_link;

    private Date created_date;
    private String created_by;

    private Date updated_date;
    private String updated_by;

    public UserInformation() {
    }

    public UserInformation(String id, String full_name, String email, String phone_number, String address, String avatar_link, Date created_date, String created_by, Date updated_date, String updated_by) {
        this.id = id;
        this.full_name = full_name;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.avatar_link = avatar_link;
        this.created_date = created_date;
        this.created_by = created_by;
        this.updated_date = updated_date;
        this.updated_by = updated_by;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar_link() {
        return avatar_link;
    }

    public void setAvatar_link(String avatar_link) {
        this.avatar_link = avatar_link;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public String getCreated_by() {
        return created_by;
    }

    public void setCreated_by(String created_by) {
        this.created_by = created_by;
    }

    public Date getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(Date updated_date) {
        this.updated_date = updated_date;
    }

    public String getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(String updated_by) {
        this.updated_by = updated_by;
    }

    @Override
    public String toString() {
        return "UserInformation{" +
                "id='" + id + '\'' +
                ", full_name='" + full_name + '\'' +
                ", email='" + email + '\'' +
                ", phone_number='" + phone_number + '\'' +
                ", address='" + address + '\'' +
                ", avatar_link='" + avatar_link + '\'' +
                ", created_date=" + created_date +
                ", created_by='" + created_by + '\'' +
                ", updated_date=" + updated_date +
                ", updated_by='" + updated_by + '\'' +
                '}';
    }
}