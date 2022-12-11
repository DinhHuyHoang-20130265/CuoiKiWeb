package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class AccountUserDAO {
    public List<SiteUser> getAllUserServer() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("select a.id, a.username, a.pass, a.account_status from user_account a")
                .mapToBean(SiteUser.class)
                .stream()
                .collect(Collectors.toList())
        );
    }
}
