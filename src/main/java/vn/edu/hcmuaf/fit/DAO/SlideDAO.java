package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.slide.Slide;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class SlideDAO {
    public  List<Slide> LoadAllSlide() {
      return  JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM slide WHERE slide_status = 1")
                .mapToBean(Slide.class)
                .stream()
                .collect(Collectors.toList()));
    }
    public List<Slide> getAllSlideByPage(int page) {
        List<Slide> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM slide")
                .mapToBean(Slide.class)
                .stream()
                .collect(Collectors.toList())

        );
        int numpage;
        int start = (page - 1) * 6;
        if (list.size() - start >= 6) {
            numpage = start + 6;
        } else {
            numpage = list.size();
        }
        List<Slide> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(list.get(i));
        }
        return temp;
    }


    public void RemoveSlide(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM slide WHERE slide_id = ?")
                            .bind(0, id)
                            .execute();
                    return true;
                }
        );
    }
    public Slide getSlideHiddenAndDetails(String id) {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT slide_id, slide_link, slide_desc, slide_status FROM slide " +
                                " WHERE slide_id =?")
                        .bind(0, id)
                        .mapToBean(Slide.class)
                        .one()
        );
    }
    public String generateIdSlideProduct() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT review_id FROM product_review").mapTo(String.class).stream().collect(Collectors.toList()));
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
        if (id.contains(sb.toString())) return generateIdSlideProduct();
        else return sb.toString();
    }

    public void InsertNewSlide(String content, String newImg, int status) {
        String id = generateIdSlideProduct();
        JDBIConnector.get().withHandle(handle -> handle.createUpdate("INSERT INTO slide VALUES (?,?,?,?)")
                .bind(0,id)
                .bind(1,newImg)
                .bind(2,content)
                .bind(3, status)
                .execute()
        );
    }

    public void UpdateSlide(String id, String content, String newImg, int status) {
        JDBIConnector.get().withHandle(handle -> handle.createUpdate("UPDATE slide SET slide_link = ?, slide_desc = ?, slide_status= ? WHERE slide_id = ?")
                .bind(0,newImg)
                .bind(1,content)
                .bind(2,status)
                .bind(3, id)
                .execute()
        );
    }

    public static void main(String[] args) {
        System.out.println(new SlideDAO().getAllSlideByPage(1));
        System.out.println(new SlideDAO().LoadAllSlide());
    }
}
