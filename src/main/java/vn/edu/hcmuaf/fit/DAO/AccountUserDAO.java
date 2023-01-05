package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.beans.UserInformation;
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
    public static void main(String[] args) {
        System.out.println(new AccountUserDAO().getAccountRole("user2"));
    }
}
