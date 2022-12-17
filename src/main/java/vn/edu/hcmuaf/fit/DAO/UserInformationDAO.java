package vn.edu.hcmuaf.fit.DAO;
import vn.edu.hcmuaf.fit.beans.UserInformation;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
public class UserInformationDAO {
    public List<UserInformation> getUserInfo(String id){
        return  JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT DISTINCT a.id, a.full_name,a.email,a.phone_number,a.address,a.avatar_link " +
                                "FROM account_information a INNER JOIN user_account ua ON a.id = ua.id WHERE a.id=? ")
                        .bind(0, id)
                        .mapToBean(UserInformation.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public List<UserInformation> getUserInfoById(String id){
        return  JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT DISTINCT a.id, a.full_name,a.email,a.phone_number,a.address,a.avatar_link " +
                                "FROM account_information a INNER JOIN user_account ua ON a.id = ua.id WHERE account_status = 1 AND a.id=? ")
                        .bind(0, id)
                        .mapToBean(UserInformation.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static void main(String[] args) {
        System.out.println(new UserInformationDAO().getUserInfoById("user3"));
        System.out.println(new UserInformationDAO().getUserInfo("user3"));
    }
}