package vn.edu.hcmuaf.fit.db;

import java.io.IOException;
import java.util.Properties;

public class DBProperties {
    public static Properties prop= new Properties();
    static {
        try {
            prop.load( DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public static String host(){  return prop.get("db.host").toString(); }
    public static String port(){  return prop.get("db.port").toString(); }
    public static String user(){  return prop.get("db.user").toString(); }
    public static String pass(){  return prop.get("db.pass").toString(); }
    public static String name(){  return prop.get("db.name").toString(); }

}
