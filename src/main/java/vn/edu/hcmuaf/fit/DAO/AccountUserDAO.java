package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.MD5;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
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

    public void Remove(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.execute("SET FOREIGN_KEY_CHECKS=0");
                    handle.createUpdate("DELETE FROM user_account WHERE id =?")
                            .bind(0, id)
                            .execute();
                    handle.execute("SET FOREIGN_KEY_CHECKS=1");
                    return true;
                }
        );
    }

    public List<SiteUser> loadAccountWithConditions(int page, int numb, String search) {
        String query = "select a.id, a.username, a.pass, a.account_status from user_account a " +
                "INNER JOIN account_information ai ON a.id = ai.id" +
                " WHERE a.account_status IN (1, 0)";
        if (search != null) {
            if (!search.equals(""))
                query += " AND ai.full_name LIKE '%" + search + "%'";
        }
        String finalQuery = query;
        List<SiteUser> filter = JDBIConnector.get().withHandle(handle -> handle.createQuery(finalQuery)
                .mapToBean(SiteUser.class)
                .stream()
                .collect(Collectors.toList()));
        int numpage;
        int start = (page - 1) * numb;
        if (filter.size() - start >= numb) {
            numpage = start + numb;
        } else {
            numpage = filter.size();
        }
        List<SiteUser> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(filter.get(i));
        }
        return temp;
    }

    public SiteUser getAccountById(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("select a.id, a.username, a.pass,a.role, a.account_status from user_account a WHERE a.id = ?")
                .bind(0, id)
                .mapToBean(SiteUser.class)
                .first()
        );
    }

    public Byte getAccountRole(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("select a.role from user_account a WHERE a.id = ?")
                .bind(0, id)
                .mapTo(Byte.class)
                .first()
        );
    }

    public void AddNewAccount(String id, String fullname, String email, String username, String password, String address, String status, String role, String permission, String nameFile, String adminId) {
        String idUser = new SignUpDAO().generateIdUser();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("INSERT INTO user_account(id, username, pass, role, account_status) VALUES (?, ?, ?, ?, ?)")
                    .bind(0, idUser)
                    .bind(1, username)
                    .bind(2, MD5.md5(password))
                    .bind(3, Integer.parseInt(role))
                    .bind(4, Integer.parseInt(status))
                    .execute();
            handle.createUpdate("INSERT INTO account_information(id, full_name, email, phone_number, address, avatar_link, created_date, created_by) values (?, ?, ?, ? , ? , ?, CURDATE(), ?)")
                    .bind(0, idUser)
                    .bind(1, fullname)
                    .bind(2, email)
                    .bind(3, "")
                    .bind(4, address)
                    .bind(5, (nameFile == null || nameFile.equals("")) ? "" : "http://localhost:8080/CuoiKiWeb_war/assets/img/logo/" + nameFile)
                    .bind(6, adminId)
                    .execute();
            if (role.equals("1")) {
                String finaS = permission.substring(0, permission.length());
                String[] values = finaS.split(",");
                for (String val : values) {
                    String[] splited = val.split("-");
                    handle.createUpdate("INSERT INTO admin_permission values (?, ?, ?)")
                            .bind(0, idUser)
                            .bind(1, splited[0])
                            .bind(2, splited[1])
                            .execute();
                }
            }
            return null;
        });
    }

    public void UpdateAccount(String id, String fullname, String email, String username, String password, String address, String status, String role, String permission, String nameFile, String adminId) {
        String pass = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT pass from user_account where id= ?")
                .bind(0, id)
                .mapTo(String.class)
                .first());
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("UPDATE user_account SET username = ?, pass = ?, role = ?, account_status = ? WHERE  id = ?")
                    .bind(0, username)
                    .bind(1, (pass.equals(password)) ? pass : MD5.md5(password))
                    .bind(2, Integer.parseInt(role))
                    .bind(3, Integer.parseInt(status))
                    .bind(4, id)
                    .execute();
            handle.createUpdate("UPDATE account_information SET full_name =?, email = ?, address = ?, avatar_link = ?, updated_date = CURDATE(), updated_by = ? WHERE id = ?")
                    .bind(0, fullname)
                    .bind(1, email)
                    .bind(2, address)
                    .bind(3, (nameFile == null || nameFile.equals("")) ? "" : "http://localhost:8080/CuoiKiWeb_war/assets/img/logo/" + nameFile)
                    .bind(4, adminId)
                    .bind(5, id)
                    .execute();
            handle.createUpdate("DELETE FROM admin_permission WHERE id = ?")
                    .bind(0, id)
                    .execute();
            if (role.equals("1")) {
                String finaS = permission.substring(0, permission.length());
                String[] values = finaS.split(",");
                if (values.length > 0)
                    for (String val : values) {
                        String[] splited = val.split("-");
                        handle.createUpdate("INSERT INTO admin_permission values (?, ?, ?)")
                                .bind(0, id)
                                .bind(1, splited[0])
                                .bind(2, splited[1])
                                .execute();
                    }
            }
            return null;
        });
    }
    public String getIdUserByName(String username) {
        SiteUser Statement = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT ua.id" +
                                " FROM account_information a INNER JOIN user_account ua ON a.id = ua.id WHERE ua.account_status = 1 AND ua.username=? ")
                        .bind(0, username)
                        .mapToBean(SiteUser.class)
                        .first()
        );
        return Statement.getId().toString();
    }
    public String getPasswordById(String id){
        SiteUser Statement = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT pass FROM user_account Where account_status = 1 AND id = ?")
                .bind(0,id)
                .mapToBean(SiteUser.class)
                .first()
        );
                return MD5.md5(Statement.getPass());
    }
    public void ChangeUserPassword(String id,String password_new, String password_old, String password_confirm) {
    password_old = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT pass from user_account where id= ?")
                .bind(0, id)
                .mapTo(String.class)
                .first());
        String finalPassword_old = password_old;
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("UPDATE user_account SET pass = ? WHERE  id = ?")
                    .bind(1, MD5.md5(password_new))
                    .execute();
            if(MD5.md5(finalPassword_old).equals(password_new)){
                return false;
            }
            return password_new;
        });
    }
    public static void main(String[] args) {
//        new AccountUserDAO().UpdateAccount("CdhOE", "DinhHoang", "dinh123@gmail.com", "prolaanh",
//                "123123", "abc123123", "1", "0", "user-update", "vcl.jpg", "user2");
        System.out.println(new AccountUserDAO().getIdUserByName("teo"));
        System.out.println(new AccountUserDAO().getPasswordById(new AccountUserDAO().getIdUserByName("teo" )));

    }
}
