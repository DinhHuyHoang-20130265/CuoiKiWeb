package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

public class AdminUser implements Serializable{
    private String id;
    private String username;
    private String pass;
    private String email;
    private boolean status;
    private HashMap<String, List<String>> role;
    public AdminUser(String id, String username, String pass, String email, boolean status, HashMap<String, List<String>> role) {
        this.id = id;
        this.username = username;
        this.pass = pass;
        this.email = email;
        this.status = status;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    public HashMap<String, List<String>> getRole() {
        return role;
    }

    public void setRole(HashMap<String, List<String>> role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "AdminUser{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", pass='" + pass + '\'' +
                ", email='" + email + '\'' +
                ", status='" + status + '\'' +
                ", role=" + role.toString() +
                '}';
    }
}
