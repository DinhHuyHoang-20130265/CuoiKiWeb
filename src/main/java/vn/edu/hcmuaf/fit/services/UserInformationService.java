package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.UserInformationDAO;
import vn.edu.hcmuaf.fit.beans.UserInformation;

import java.util.List;

public class UserInformationService {
    private static UserInformationService userInformationService;

    public static UserInformationService getInstance() {
        if (userInformationService == null) {
            userInformationService = new UserInformationService();
        }
        return userInformationService;
    }
    public UserInformation getUserInfo(String id){
        UserInformationDAO DAO = new UserInformationDAO();
        return DAO.getUserInfo(id);
    }
    public UserInformation getUserInfoById(String id){
        UserInformationDAO DAO = new UserInformationDAO();
        return DAO.getUserInfoById(id);
    }
}
