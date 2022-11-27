package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

public class AdminRole implements Serializable {
    private List<String> roles;

    public AdminRole(List<String> roles) {
        this.roles = roles;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
    //  Phương thức kiểm tra vai trò
    public boolean accept(String role) {
        if (role == null) return false;
        return roles.contains(role);
    }
    @Override
    public String toString() {
        return "AdminRole{" +
                "roles=" + roles +
                '}';
    }
}
