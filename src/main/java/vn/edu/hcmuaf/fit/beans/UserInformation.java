package vn.edu.hcmuaf.fit.beans;

import vn.edu.hcmuaf.fit.services.UserInformationService;

import java.io.Serializable;

public class UserInformation implements Serializable {
    private String id;
    private String fullName;
    private String email;
    private String phoneNumb;
    private String address;
    private String avatarImgLink;
    public UserInformation(String id, String fullName, String email, String phoneNumb, String address, String avatarImgLink) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumb = phoneNumb;
        this.address = address;
        this.avatarImgLink = avatarImgLink;
    }
    public UserInformation(){

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

    @Override
    public String toString() {
        return "UserInformation{" +
                "id='" + id + '\'' +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumb='" + phoneNumb + '\'' +
                ", address='" + address + '\'' +
                ", avatarImgLink='" + avatarImgLink + '\'' +
                '}';
    }
}