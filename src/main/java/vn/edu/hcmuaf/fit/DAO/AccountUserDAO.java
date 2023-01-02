package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.beans.product.ProductSale;
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
        String query = "select a.id, a.username, a.pass, a.account_status from user_account a" +
                " WHERE a.account_status IN (1, 0)";
        if (search != null) {
            if (!search.equals(""))
                query += " AND a.username LIKE '%" + search + "%'";
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

    public static void main(String[] args) {
        System.out.println(new AccountUserDAO().loadAccountWithConditions(1, 6, null));
        System.out.println(new AccountUserDAO().loadAccountWithConditions(3, 6, null).size());
    }
}
