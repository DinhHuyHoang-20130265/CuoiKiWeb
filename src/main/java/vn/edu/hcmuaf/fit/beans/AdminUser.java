package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

public class AdminUser implements Serializable {
    private String id;
    private String username;
    private String pass;
    private Byte account_status;
    private List<AdminRole> role;

    public AdminUser(String id, String username, String pass, Byte account_status, List<AdminRole> role) {
        this.id = id;
        this.username = username;
        this.pass = pass;
        this.account_status = account_status;
        this.role = role;
    }

    public AdminUser() {
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

    public List<AdminRole> getRole() {
        return role;
    }

    public void setRole(List<AdminRole> role) {
        this.role = role;
    }

    @Override
    public String toString() {
        if (role != null)
            return "AdminUser{" +
                    "id='" + id + '\'' +
                    ", username='" + username + '\'' +
                    ", pass='" + pass + '\'' +
                    ", account_status='" + account_status + '\'' +
                    ", role=" + role +
                    '}';
        return "AdminUser{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", pass='" + pass + '\'' +
                ", account_status='" + account_status + '\'' +
                '}';
    }
}
