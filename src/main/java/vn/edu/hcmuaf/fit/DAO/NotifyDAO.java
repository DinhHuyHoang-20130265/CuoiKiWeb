package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.Notify_Admin;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class NotifyDAO {
    public static List<Notify_Admin> getAllNotify() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT n.id, n.content, n.order_id, n.created_date FROM notify_admin n")
                .mapToBean(Notify_Admin.class)
                .stream().
                collect(Collectors.toList()));
    }
    public List<Notify_Admin> loadNotifyWithPage(int page) {
        List<Notify_Admin> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM notify_admin ")
                .mapToBean(Notify_Admin.class)
                .stream()
                .collect(Collectors.toList()));
        int numpage;
        int start = (page - 1) * 3;
        if (list.size() - start >= 3) {
            numpage = start + 3;
        } else {
            numpage = list.size();
        }
        List<Notify_Admin> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(list.get(i));
        }
        return temp;
    }
    public static String generateIdNotify() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT ord_id FROM orders")
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
        if (id.contains(sb.toString())) return generateIdNotify();
        else return sb.toString();
    }

    public String addNewNotify(String content, String order_id) {
        String idNotify = generateIdNotify();
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("INSERT INTO notify_admin values (?,?,?,CURDATE())")
                            .bind(0, idNotify)
                            .bind(1, content)
                            .bind(2, order_id)
                            .execute();
                    return true;
                }
        );
        return idNotify;
    }
    public void removeNotify(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM notify_admin WHERE id = ?")
                            .bind(0, id)
                            .execute();
                    return true;
                }
        );
    }
    public Notify_Admin getNotifyById(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM notify_admin WHERE id = ?")
                            .bind(0, id)
                            .mapToBean(Notify_Admin.class)
                            .first()
        );
    }
    public static void main(String[] args) {
        System.out.println(new NotifyDAO().loadNotifyWithPage(1));
    //        System.out.println(NotifyDAO.getAllNotify());
    }
}
