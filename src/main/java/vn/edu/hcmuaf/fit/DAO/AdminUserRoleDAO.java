package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.AdminRole;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.*;
import java.util.stream.Collectors;

public class AdminUserRoleDAO {
    private String id;

    public AdminUserRoleDAO(String id) {
        this.id = id;
    }

    public List<AdminRole> getRoleList() {
        List<AdminRole> table = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select role_id, role_name from admin_role where admin_id =?")
                    .bind(0, id)
                    .map((rs, ctx) -> new AdminRole(rs.getInt("role_id"), rs.getString("role_name")))
                    .list();
        });
        return table;
    }

    public List<String> getPermissionForRole(int admin_role_id) {
        List<String> role_permission = JDBIConnector
                .get()
                .withHandle(handle -> handle
                        .createQuery("select permission_type from permission_for_admin_role where admin_role_id = ?")
                .bind(0, admin_role_id)
                .mapTo(String.class)
                .stream()
                .collect(Collectors.toList()));
        return role_permission;
    }

    public ArrayList<String> getPermission(String table) {
        List<String> roles = new ArrayList<>();
        for (AdminRole role : getRoleList()) {
            if (role.getRole_permission().equals(table)) {
                getPermissionForRole(role.getRole_id()).forEach(k -> {
                    roles.add(k);
                });
            }
        }
        return (ArrayList<String>) roles;
    }
    public static void main(String[] args) {
        System.out.println(new AdminUserRoleDAO("ad1").getRoleList());
    }
}
