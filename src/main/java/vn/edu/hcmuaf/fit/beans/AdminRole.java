package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

public class AdminRole implements Serializable {
    private int role_id;
    private String role_permission;

    public AdminRole(int role_id, String role_permission) {
        this.role_id = role_id;
        this.role_permission = role_permission;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getRole_permission() {
        return role_permission;
    }

    public void setRole_permission(String role_permission) {
        this.role_permission = role_permission;
    }

    @Override
    public String toString() {
        return "AdminRole{" +
                "role_id=" + role_id +
                ", role_permission='" + role_permission + '\'' +
                '}';
    }
}
