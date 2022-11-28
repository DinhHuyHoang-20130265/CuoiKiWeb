package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class SiteUserDAO {
    private List<SiteUser> users;

    public SiteUserDAO() {
        users = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from site_user").mapToBean(SiteUser.class).stream().collect(Collectors.toList());
        });
    }

    public boolean isExits(String username) {
        for (SiteUser user : this.users) {
            if (user.getUsername().equals(username))
                return true;
        }
        return false;
    }

    public SiteUser checkLogin(String username, String password) {
        SiteUser site = null;
        for (SiteUser user : this.users) {
            if (user.getUsername().equals(username) && user.getPass().equals(password)) {
                site = user;
                return site;
            }
        }
        return null;
    }

    public boolean checkStatus(String username) {
        for (SiteUser user : this.users) {
            if (user.getUsername().equals(username)) {
                if (user.getUser_status() == 1)
                    return true;
            }
        }
        return false;
    }
}
