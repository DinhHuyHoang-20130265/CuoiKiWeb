package vn.edu.hcmuaf.fit.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.beans.AdminUser;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;


public class JDBIConnector {
    private static Jdbi jdbi;

    private static void makeConnect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL("jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/"
                + DBProperties.name());
        dataSource.setUser(DBProperties.user());
        dataSource.setPassword(DBProperties.pass());
        try {
            dataSource.setUseCompression(true);
            dataSource.setAutoReconnect(true);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new RuntimeException(throwables);
        }
        jdbi = Jdbi.create(dataSource);
    }


    private JDBIConnector() {
    }

    public static Jdbi get() {
        if(jdbi==null) makeConnect();
        return jdbi;
    }

    public static void main(String[] args) {
        List<AdminUser> users = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from admin_user")
                    .mapToBean(AdminUser.class).stream().collect(Collectors.toList());
        });
        System.out.println(users);
    }
}