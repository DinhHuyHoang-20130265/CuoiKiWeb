package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

public class AdminRole implements Serializable {
    private String table;
    private String permission;

    public AdminRole(String table, String permission) {
        this.table = table;
        this.permission = permission;
    }

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return "AdminRole{" +
                "role_id=" + table +
                ", role_permission='" + permission + '\'' +
                '}';
    }
}
