package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.AccountUserDAO;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class AccountService {
    private static AccountService accountService;

    public static AccountService getInstance() {
        if (accountService == null)
            accountService = new AccountService();
        return accountService;
    }

    public List<SiteUser> getAllUserServer() {
        return new AccountUserDAO().getAllUserServer();
    }
}
