package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class SiteUser implements Serializable {
    private String id;
    private String username;
    private String pass;
    private Byte account_status;

    public SiteUser(String id, String username, String pass, Byte account_status) {
        this.id = id;
        this.username = username;
        this.pass = pass;
        this.account_status = account_status;
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

    public Byte getAccount_status() {
        return account_status;
    }

    public void setAccount_status(Byte account_status) {
        this.account_status = account_status;
    }

    @Override
    public String toString() {
        return "SiteUser{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", pass='" + pass + '\'' +
                ", account_status=" + account_status +
                '}';
    }
}
