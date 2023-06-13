package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.Log.LogAdmin;
import vn.edu.hcmuaf.fit.beans.contact.Contact;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
public class LogAdminDAO {
    public static List<LogAdmin> getAllLog() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT l.id, l.user_id, l.level, l.message, l.created_date FROM log_admin l")
                .mapToBean(LogAdmin.class)
                .stream().
                collect(Collectors.toList()));
    }
    public List<LogAdmin> loadLogWithPage(int page,int logs) {
        List<LogAdmin> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM log_admin ORDER BY created_date DESC ")
                .mapToBean(LogAdmin.class)
                .stream()
                .collect(Collectors.toList()));
        int numpage;
        int start = (page - 1) * logs;
        if (list.size() - start >= logs) {
            numpage = start + logs;
        } else {
            numpage = list.size();
        }
        List<LogAdmin> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(list.get(i));
        }
        return temp;
    }
    public static String generateIdLog() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT id FROM log_admin")
                .mapTo(String.class)
                .stream()
                .collect(Collectors.toList()));
        String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String alphaNumeric = upperAlphabet + lowerAlphabet + numbers;

        StringBuilder sb = new StringBuilder();

        // create an object of Random class
        Random random = new Random();
        // specify length of random string
        int length = 5;
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(alphaNumeric.length());
            char randomChar = alphaNumeric.charAt(index);
            sb.append(randomChar);
        }
        if (id.contains(sb.toString())) return generateIdLog();
        else return sb.toString();
    }
    public List<LogAdmin> loadNewestLogs() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("" +
                        "SELECT * FROM log_admin ORDER BY created_date DESC LIMIT 6")
                .mapToBean(LogAdmin.class)
                .stream()
                .collect(Collectors.toList()));
    }
    public String addNewLog(String id_user, String level,String type,String message) {
        String idLog = generateIdLog();
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("INSERT INTO log_admin values (?,?,?,?,?,CURDATE())")
                            .bind(0, idLog)
                            .bind(1, id_user)
                            .bind(2, level)
                            .bind(3, type)
                            .bind(4,message)
                            .execute();
                    return true;
                }
        );
        return idLog;
    }
    public void removeLog(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM log_admin WHERE id = ?")
                            .bind(0, id)
                            .execute();
                    return true;
                }
        );
    }
    public static void main(String[] args) {
        System.out.println(new LogAdminDAO().loadNewestLogs());
    }
}
