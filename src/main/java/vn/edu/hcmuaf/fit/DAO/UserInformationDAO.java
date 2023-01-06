package vn.edu.hcmuaf.fit.DAO;
import vn.edu.hcmuaf.fit.beans.UserInformation;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.Statement;

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
    public void updateUserInfo(String id, String full_name, String email, String address, String phone_number) {
        System.out.println(id);
        System.out.println(full_name);
        System.out.println(email);
        System.out.println(address);
        System.out.println(phone_number);
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("UPDATE account_information SET full_name=? ,email=? ,address=?,phone_number=? WHERE id=?")
                .bind(0, full_name)
                .bind(1, email)
                .bind(2, address)
                .bind(3, phone_number)
                .bind(4, id)
                .execute();
            return true;
             }
        );
    }
    public String getIdUserByName(String username) {
        UserInformation Statement = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT ua.id" +
                                " FROM account_information a INNER JOIN user_account ua ON a.id = ua.id WHERE ua.account_status = 1 AND ua.username=? ")
                        .bind(0, username)
                        .mapToBean(UserInformation.class)
                        .first()
        );
       return Statement.getId().toString();
    }
    public static void main(String[] args) {
        System.out.println(new UserInformationDAO().getIdUserByName("teo"));
//        System.out.println(new UserInformationDAO().updateUserInfo(new UserInformationDAO().getIdUserByName("teo"),"","","",""));
////        System.out.println(new UserInformationDAO().getUserInfo("qwvKl"));
    }
}