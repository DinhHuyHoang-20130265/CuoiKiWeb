package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.news.News;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class NewsDAO {
    private List<News> listNews;
    public List<News> loadAllNews() {
        return listNews = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT n.news_id, n.news_title, n.description" +
                        ", n.content, n.news_img_link, n.posted_date, n.posted_by, n.updated_date, n.updated_by FROM news n")
                .mapToBean(News.class)
                .stream()
                .collect(Collectors.toList()));
    }
    public List<News> loadAllNewsWithPage(int pageNumb) {
        List<News> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT n.news_id, n.news_title, n.description, n.content, n.news_img_link, n.posted_date, n.posted_by, n.updated_date, n.updated_by FROM news n")
                .mapToBean(News.class)
                .stream()
                .collect(Collectors.toList()));
        int numpage;
        int start = (pageNumb - 1) * 4;
        if (list.size() - start >= 4) {
            numpage = start + 4;
        } else {
            numpage = list.size();
        }
        List<News> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(list.get(i));
        }
        return temp;
    }
    public News getNewsById(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT n.news_id, n.news_title, n.description, " +
                        "n.content, n.news_img_link, n.posted_date, n.posted_by, n.updated_date, n.updated_by " +
                        "FROM news n WHERE n.news_id = ?")
                .bind(0, id)
                .mapToBean(News.class)
                .first()
        );
    }
    private String generateIdNews() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT id FROM user_account").mapTo(String.class).stream().collect(Collectors.toList()));
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
        if (id.contains(sb.toString())) return generateIdNews();
        else return sb.toString();

    }

    public void RemoveNews(String id) {
            JDBIConnector.get().withHandle(handle -> {
                        handle.createUpdate("SET FOREIGN_KEY_CHECKS = 0").execute();
                        handle.createUpdate("DELETE FROM news WHERE news_id = ? ")
                                .bind(0, id)
                                .execute();
                        handle.createUpdate("SET FOREIGN_KEY_CHECKS = 1").execute();
                        return true;
                    }
            );
    }

    public void UpdateNews(String news_id,String news_title, String description,String content,String news_img_link,String updated_by) {
        JDBIConnector.get().withHandle(handle ->{
            handle.createUpdate("UPDATE news SET news_title = ?, description = ?, content = ?, news_img_link = ? , updated_date = CURDATE() , updated_by = ? WHERE news_id = ?")
                            .bind(0, news_title)
                            .bind(1, description)
                            .bind(2, content)
                            .bind(3, news_img_link)
                            .bind(4, updated_by)
                            .bind(5, news_id)
                            .execute();
                    return null;
                }
        );
    }

    public void InsertNewNews(String title, String description,String content,String news_img_link, String posted_by) {
        String news_id = generateIdNews();
        JDBIConnector.get().withHandle(handle ->{
        handle.createUpdate("INSERT INTO news VALUES (?,?,?,?,?,CURDATE(),?,null,null)")
                .bind(0, news_id)
                .bind(1, title)
                .bind(2, description)
                .bind(3, content)
                .bind(4, news_img_link)
                .bind(5, posted_by)
                .execute();
              return true;
          }
        );
    }

    public static void main(String[] args) {
        System.out.println(new NewsDAO().loadAllNews());
        System.out.println(new NewsDAO().getNewsById("news003"));
        System.out.println(new NewsDAO().loadAllNewsWithPage(2));
    }
}
