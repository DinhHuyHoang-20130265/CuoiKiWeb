package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.AccountUserDAO;
import vn.edu.hcmuaf.fit.DAO.SiteUserDAO;
import vn.edu.hcmuaf.fit.DAO.UserInformationDAO;
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

    public void AddNewAccount(String id, String fullname, String email, String username, String password, String address, String status, String role, String permission, String nameFile, String adminId) {
        new AccountUserDAO().AddNewAccount(id, fullname, email, username, password, address, status, role, permission, nameFile, adminId);
    }

    public void UpdateAccount(String id, String fullname, String email, String username, String password, String address, String status, String role, String permission, String nameFile, String adminId) {
        new AccountUserDAO().UpdateAccount(id, fullname, email, username, password, address, status, role, permission, nameFile, adminId);
    }

    public String getIdUserByName(String username){
        AccountUserDAO DAO = new AccountUserDAO();
        return DAO.getIdUserByName(username);
    }

    public SiteUser getUserByEmail(String email) {
        return new AccountUserDAO().getUserByEmail(email);
    }

    public void ChangeUserPassword(String id,String password_new, String password_old, String password_confirm) {
        new AccountUserDAO().ChangeUserPassword(id,password_new, password_old, password_confirm);
    }
}
