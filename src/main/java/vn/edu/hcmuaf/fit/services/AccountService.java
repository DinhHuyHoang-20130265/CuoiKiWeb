package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.AccountUserDAO;
import vn.edu.hcmuaf.fit.beans.SiteUser;

import java.util.List;

public class AccountService {
    private static AccountService accountService;

    public static AccountService getInstance() {
        if (accountService == null)
            accountService = new AccountService();
        return accountService;
    }

    public int getAccountRole(String id) {
        return new AccountUserDAO().getAccountRole(id);
    }
    public SiteUser getAccountById(String id) {
        return new AccountUserDAO().getAccountById(id);
    }
    public List<SiteUser> getAllUserServer() {
        return new AccountUserDAO().getAllUserServer();
    }

    public void RemoveAccount(String id) {
        new AccountUserDAO().Remove(id);
    }

    public List<SiteUser> loadAccountWithConditions(int page, int numb, String search) {
        return new AccountUserDAO().loadAccountWithConditions(page, numb, search);
    }

    public void UpdateUserInfo(String id, String fullName, String email, String diachi, String sdt) {
       new AccountUserDAO().updateUserInfo(id,fullName,email,diachi,sdt);
    }
}
