package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class AdminUserDAO {
    private List<AdminUser> users;

    public AdminUserDAO() {
        users = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select a.id, a.username, a.pass, a.account_status from user_account a where a.role = 1")
                    .mapToBean(AdminUser.class)
                    .stream()
                    .collect(Collectors.toList());
        });
    }

    public boolean isExits(String username) {
        for (AdminUser user : this.users) {
            if (user.getUsername().equals(username))
                return true;
        }
        return false;
    }

    public AdminUser checkLogin(String username, String password) {
        AdminUser site = null;
        for (AdminUser user : this.users) {
            if (user.getUsername().equals(username) && user.getPass().equals(password)) {
                site = user;
                return site;
            }
        }
        return null;
    }

    public boolean checkStatus(String username) {
        for (AdminUser user : this.users) {
            if (user.getUsername().equals(username)) {
                if (user.getAccount_status() == 1)
                    return true;
            }
        }
        return false;
    }
}
