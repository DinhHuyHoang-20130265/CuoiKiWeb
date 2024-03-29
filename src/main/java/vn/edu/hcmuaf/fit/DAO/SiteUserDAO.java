package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.beans.MD5;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class SiteUserDAO {
    private List<SiteUser> users;

    public SiteUserDAO() {
        users = JDBIConnector.get().withHandle(handle -> handle.createQuery("select a.id, a.username, a.pass, a.account_status from user_account a where a.role = 0")
                .mapToBean(SiteUser.class)
                .stream()
                .collect(Collectors.toList()));
    }

    public boolean isExits(String username) {
        for (SiteUser user : this.users) {
            if (user.getUsername().equals(username))
                return true;
        }
        return false;
    }

    public SiteUser checkLogin(String username, String password) {
        for (SiteUser user : this.users) {
            if (user.getUsername().equals(username) && user.getPass().equals(password)) {
                return user;
            }
        }
        return null;
    }

    public boolean checkStatus(String username) {
        for (SiteUser user : this.users) {
            if (user.getUsername().equals(username)) {
                return user.getAccount_status() == 1;
            }
        }
        return false;
    }

    public String checkEmailExits(String email) {
        List<String> id_account = JDBIConnector.get().withHandle(handle -> handle.createQuery("select ua.id from user_account ua INNER JOIN account_information ai ON ua.id = ai.id where ua.role = 0 AND ai.email = ?")
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
        for (SiteUser user : users) {
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
                    .bind(0, MD5.md5(pass1))
                    .bind(1, checkEmailExits(email))
                    .execute();
            return null;
        });
    }
//    public String getIdUser(String user_name) {
//        for (SiteUser user : users) {
//            if (user.getUsername().equals(user_name)) {
//                return "Tài khoản" + user.getId();
//            }
//        }
//        return "Tài khoản không tồn tại " + user_name;
//    }
    public static void main(String[] args) {
//        System.out.println(new SiteUserDAO().users);
    }
}
