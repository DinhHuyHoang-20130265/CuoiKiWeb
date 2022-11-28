package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class SiteUser implements Serializable {
    private String id;
    private String username;
    private String pass;
    private Byte user_status;

    public SiteUser(String id, String username, String pass, Byte user_status) {
        this.id = id;
        this.username = username;
        this.pass = pass;
        this.user_status = user_status;
    }
    public SiteUser() {
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Byte getUser_status() {
        return user_status;
    }

    public void setUser_status(Byte user_status) {
        this.user_status = user_status;
    }

    @Override
    public String toString() {
        return "SiteUser{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", pass='" + pass + '\'' +
                ", user_status=" + user_status +
                '}';
    }
}
