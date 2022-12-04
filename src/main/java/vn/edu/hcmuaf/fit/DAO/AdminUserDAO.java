package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class AdminUserDAO {
    private List<AdminUser> users;

    public AdminUserDAO() {
        users = JDBIConnector.get().withHandle(handle -> handle.createQuery("select a.id, a.username, a.pass, a.account_status from user_account a where a.role = 1")
                .mapToBean(AdminUser.class)
                .stream()
                .collect(Collectors.toList()));
    }

    public boolean isExits(String username) {
        for (AdminUser user : this.users) {
            if (user.getUsername().equals(username))
                return true;
        }
        return false;
    }

    public AdminUser checkLogin(String username, String password) {
        for (AdminUser user : this.users) {
            if (user.getUsername().equals(username) && user.getPass().equals(password)) {
                return user;
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

    public String checkEmailExits(String email) {
        List<String> id_account = JDBIConnector.get().withHandle(handle -> handle.createQuery("select ua.id from user_account ua INNER JOIN account_information ai ON ua.id = ai.id where ua.role = 1 AND ai.email = ?")
                .bind(0, email)
                .mapTo(String.class)
                .stream()
                .collect(Collectors.toList()));
        if (id_account.isEmpty())
            return "";
        return id_account.get(0);
    }

    public void updateVerifyCodeAndTimeOut(String id, String code, String expiry) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update user_account set verify_code = ? where id =?")
                    .bind(0, code)
                    .bind(1, id)
                    .execute();
            handle.createUpdate("update user_account set expiry = ? where id =?")
                    .bind(0, expiry)
                    .bind(1, id)
                    .execute();
            return null;
        });
    }

    public boolean checkIdStatus(String id_account) {
        for (AdminUser user : users) {
            if (user.getId().equals(id_account)) {
                if (user.getAccount_status() != 0)
                    return true;
            }
        }
        return false;
    }

    public void updatePasswordFromEmail(String pass1, String email) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update user_account set pass = ? where id =?")
                    .bind(0, pass1)
                    .bind(1, checkEmailExits(email))
                    .execute();
            return null;
        });
    }
    public static void main(String[] args) {
        System.out.println(new AdminUserDAO().users);
    }
}
