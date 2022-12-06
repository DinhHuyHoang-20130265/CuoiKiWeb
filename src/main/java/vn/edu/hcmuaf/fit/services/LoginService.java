package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.SiteUserDAO;
import vn.edu.hcmuaf.fit.beans.MD5;
import vn.edu.hcmuaf.fit.beans.SiteUser;

public class LoginService {
    private static LoginService loadUserAccount;
    private String status;
    public static LoginService getInstance() {

        if (loadUserAccount == null) {
            loadUserAccount = new LoginService();
        }
        return loadUserAccount;

    }

    public SiteUser getAccountCustomer(String username, String password) {
        SiteUserDAO DAO = new SiteUserDAO();

        if (!DAO.isExits(username)) {
            status = "Tài khoản không tồn tại";
            return null;
        }
        if (!DAO.checkStatus(username)) {
            status = "Tài khoản bị vô hiệu hoá";
            return null;
        }
        SiteUser account = DAO.checkLogin(username, MD5.md5(password));
        if (account == null) {
            status = "Sai tên đăng nhập hoặc mật khẩu";
            return null;
        }
        return account;
    }

    public String getStatus() {
        return status;
    }
}
