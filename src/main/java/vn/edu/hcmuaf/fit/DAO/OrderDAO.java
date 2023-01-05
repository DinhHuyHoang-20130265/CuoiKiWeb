package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class OrderDAO {
    public String generateIdOrder() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT ord_id FROM orders").mapTo(String.class).stream().collect(Collectors.toList()));
        String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String alphaNumeric = upperAlphabet + lowerAlphabet + numbers;

        StringBuilder sb = new StringBuilder();

        // create an object of Random class
        Random random = new Random();
        // specify length of random string
        int length = 10;
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(alphaNumeric.length());
            char randomChar = alphaNumeric.charAt(index);
            sb.append(randomChar);
        }
        if (id.contains(sb.toString())) return generateIdOrder();
        else return sb.toString();
    }

    public void insertOrder(String ord_id, int payment_method, double total, String address,
                                   String receive_name, String email, String phone_number, String note, String customer_id){
        String id = generateIdOrder();
        String date = java.time.LocalDate.now().toString();
        String date_3days = (java.time.LocalDate.now().plusDays(3)).toString();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("INSERT INTO orders (ord_id, ord_date, status, payment_method, delivered, total, delivery_date, address," +
                            "receive_name, email, phone_number, note, customer_id) VALUES(?,?,1,?,0,?,?,?,?,?,?,?,? )")
                    .bind(0,id)
                    .bind(1,date)
                    .bind(2,payment_method)
                    .bind(3,total)
                    .bind(4,date_3days)
                    .bind(5,address)
                    .bind(6,receive_name)
                    .bind(7,email)
                    .bind(8,phone_number)
                    .bind(9,note)
                    .bind(10,customer_id)
                    .execute();

            return null;
        });
    }

    public static void main(String[] args) {
        String date = java.time.LocalDate.now().toString();
        String date_3days = (java.time.LocalDate.now().plusDays(3)).toString();
        System.out.println(date);
        System.out.println(date_3days);

    }

}
