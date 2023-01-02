package vn.edu.hcmuaf.fit.DAO;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
public class NewsCommentDAO {

    public String generateIdComment() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT comment_id FROM news_comment").mapTo(String.class).stream().collect(Collectors.toList()));
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
        if (id.contains(sb.toString())) return generateIdComment();
        else return sb.toString();
    }
    public List<NewsComment> getCommentByNews(String id, String order_by){
        String sql = "SELECT nc.comment_id, nc.news_id,nc.comment_by" +
                ", nc.description,nc.commented_date, nc.comment_status FROM news_comment nc" +
                " INNER JOIN news n ON nc.news_id = n.news_id WHERE nc.comment_status = 1 AND n.news_id = '" + id + "' ";
        if (order_by != null) {
            if (order_by.equals("0")) {
                sql += " ORDER BY nc.commented_date DESC";
            } else if (order_by.equals("1")) {
                sql += " ORDER BY nc.commented_date ASC";
            }
        }
        String finalSQL = sql;
        return JDBIConnector.get().withHandle(handle -> handle.createQuery(finalSQL)
                .mapToBean(NewsComment.class)
                .stream()
                .collect(Collectors.toList()));
    }
    public static void main(String[] args) {
        System.out.println(new NewsCommentDAO().getCommentByNews("news001", "DESC"));
    }

    public String AddNewComment(String id, String comment, String NewsId) {
        String idNews = generateIdComment();
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("INSERT INTO news_comment values (?, ?, ?, ?, CURDATE(), 1)")
                            .bind(0, idNews)
                            .bind(1, NewsId)
                            .bind(2, id)
                            .bind(3, comment)
                            .execute();
                    return true;
                }
        );
        return  idNews;
    }

    public void RemoveComment(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM news_comment WHERE comment_id = ?")
                            .bind(0, id)
                            .execute();
                    return true;
                }
        );
    }
}
