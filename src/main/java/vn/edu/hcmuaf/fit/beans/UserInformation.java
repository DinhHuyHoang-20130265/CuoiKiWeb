package vn.edu.hcmuaf.fit.beans;

import vn.edu.hcmuaf.fit.services.UserInformationService;

import java.io.Serializable;
import java.util.Date;

public class UserInformation implements Serializable {
    private String id;
    private String fullName;
    private String email;
    private String phoneNumb;
    private String address;
    private String avatarImgLink;

    private Date created_date;
    private String created_by;

    private Date updated_date;
    private String updated_by;

    public UserInformation() {
    }

    public UserInformation(String id, String fullName, String email, String phoneNumb, String address, String avatarImgLink, Date created_date, String created_by, Date updated_date, String updated_by) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumb = phoneNumb;
        this.address = address;
        this.avatarImgLink = avatarImgLink;
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumb() {
        return phoneNumb;
    }

    public void setPhoneNumb(String phoneNumb) {
        this.phoneNumb = phoneNumb;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatarImgLink() {
        return avatarImgLink;
    }

    public void setAvatarImgLink(String avatarImgLink) {
        this.avatarImgLink = avatarImgLink;
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
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumb='" + phoneNumb + '\'' +
                ", address='" + address + '\'' +
                ", avatarImgLink='" + avatarImgLink + '\'' +
                ", created_date=" + created_date +
                ", created_by='" + created_by + '\'' +
                ", updated_date=" + updated_date +
                ", updated_by='" + updated_by + '\'' +
                '}';
    }
}