package vn.edu.hcmuaf.fit.DAO;
import vn.edu.hcmuaf.fit.beans.UserInformation;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
public class UserInformationDAO {
    public UserInformation getUserInfo(String id){
        return  JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT DISTINCT a.id, a.full_name,a.email,a.phone_number,a.address,a.avatar_link, a.created_date," +
                                "a.created_by, a.updated_date, a.updated_by " +
                                "FROM account_information a INNER JOIN user_account ua ON a.id = ua.id WHERE a.id=? ")
                        .bind(0, id)
                        .mapToBean(UserInformation.class)
                        .first()
        );
    }
    public UserInformation getUserInfoById(String id){
        return  JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT DISTINCT a.id, a.full_name,a.email,a.phone_number,a.address,a.avatar_link, a.created_date," +
                                "a.created_by, a.updated_date, a.updated_by " +
                                "FROM account_information a INNER JOIN user_account ua ON a.id = ua.id WHERE account_status = 1 AND a.id=? ")
                        .bind(0, id)
                        .mapToBean(UserInformation.class)
                        .first()
        );
    }
    public static void main(String[] args) {
        System.out.println(new UserInformationDAO().getUserInfo("qwvKl").getAvatarImgLink() == null);
    }
}