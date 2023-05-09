package vn.edu.hcmuaf.fit.beans.contact;

import java.io.Serializable;
import java.util.Date;

public class Contact implements Serializable {
    private String id;
    private String name;
    private String email;
    private String phone;
    private String content;
    private String reply_content; // admin rep content
    private String id_admin; // id admin rep content
    private Date created_date;
    private byte status;

    public Contact() {

    }

    public Contact(String id, String name, String email, String phone,
                   String content, String reply_content, String id_admin, Date created_date, byte status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.content = content;
        this.reply_content = reply_content;
        this.id_admin = id_admin;
        this.created_date = created_date;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public String getId_admin() {
        return id_admin;
    }

    public void setId_admin(String id_admin) {
        this.id_admin = id_admin;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", content='" + content + '\'' +
                ", reply_content='" + reply_content + '\'' +
                ", id_admin='" + id_admin + '\'' +
                ", created_date=" + created_date +
                ", status=" + status +
                '}';
    }
}
