package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.contact.Contact;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class ContactDAO {
    public static List<Contact> getAllContact() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM contact")
                .mapToBean(Contact.class)
                .stream().
                collect(Collectors.toList()));
    }
    public List<Contact> loadContactWithPage(int page) {
        List<Contact> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM contact ORDER BY created_date DESC ")
                .mapToBean(Contact.class)
                .stream()
                .collect(Collectors.toList()));
        int numpage;
        int start = (page - 1) * 4;
        if (list.size() - start >= 4) {
            numpage = start + 4;
        } else {
            numpage = list.size();
        }
        List<Contact> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(list.get(i));
        }
        return temp;
    }
    public static String generateIdContact() {
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
        if (id.contains(sb.toString())) return generateIdContact();
        else return sb.toString();
    }
    public List<Contact> loadNewestContact() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("" +
                        "SELECT * FROM contact ORDER BY created_date DESC LIMIT 6")
                .mapToBean(Contact.class)
                .stream()
                .collect(Collectors.toList()));
    }
    public String addNewContact(String name, String email,String phone,String content) {
        String idContact = generateIdContact();
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("INSERT INTO contact values (?,?,?,?,?,null,null,CURDATE(),0)")
                            .bind(0, idContact)
                            .bind(1, name)
                            .bind(2, email)
                            .bind(3, phone)
                            .bind(4,content)
                            .execute();
                    return true;
                }
        );
        return idContact;
    }
    public void updateContactAdmin(String admin_id, String admin_reply) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("UPDATE contact SET id_admin = ? ,reply_content = ?")
                            .bind(0, admin_id)
                            .bind(1, admin_reply)
                            .execute();
                    return null;
        });
    }
    public void removeContact(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM contact WHERE id = ?")
                            .bind(0, id)
                            .execute();
                    return true;
                }
        );
    }
    public Contact getContactById(String id){
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM contact WHERE id = ?")
                .bind(0, id)
                .mapToBean(Contact.class)
                .first()
        );
    }
    public static void main(String[] args) {
    }
}
