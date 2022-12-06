package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class SignUpDAO {
    public SignUpDAO() {

    }

    public String checkUserInput(String email, String username) {
        String result = null;
        String emails = null;
        String usernames = null;
        try {
            emails = JDBIConnector.get().withHandle(
                    handle -> handle.createQuery("SELECT email FROM account_information WHERE email = ?")
                            .bind(0, email)
                            .mapTo(String.class)
                            .first()
            );
        } catch (Exception e) {
        }
        try {
            usernames = JDBIConnector.get().withHandle(
                    handle -> handle.createQuery("SELECT username FROM user_account WHERE username = ?")
                            .bind(0, username)
                            .mapTo(String.class)
                            .first()
            );
        } catch (Exception e) {
        }
        if (emails != null) {
            result = "Email đã được liên kết với tài khoản khác";
        }
        if (usernames != null) {
            result = "Username đã được sử dụng";
        }
        return result;
    }

    public String generateIdUser() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT id FROM user_account").mapTo(String.class).stream().collect(Collectors.toList()));
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
        if (id.contains(sb.toString())) return generateIdUser();
        else return sb.toString();
    }

    public void InsertUser(String fullname, String email, String username, String passwordEncrypted) {
        String id = generateIdUser();
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("INSERT INTO user_account(id, username, pass, role, account_status) VALUES (?, ?, ?, 0, 1)")
                            .bind(0, id)
                            .bind(1, username)
                            .bind(2, passwordEncrypted)
                            .execute();
                    handle.createUpdate("INSERT INTO account_information(id, full_name, email) VALUES (?, ?, ?)")
                            .bind(0, id)
                            .bind(1, fullname)
                            .bind(2, email)
                            .execute();
                    return null;
                }
        );
    }

    public static void main(String[] args) {
        System.out.println(new SignUpDAO().checkUserInput("dinh12345@gmail.com", "user"));
    }
}
