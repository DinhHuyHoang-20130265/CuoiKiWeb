package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
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

    public List<NewsComment> getCommentByNews(String page, String id, String order_by) {
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
        List<NewsComment> comments = JDBIConnector.get().withHandle(handle -> handle.createQuery(finalSQL)
                .mapToBean(NewsComment.class)
                .stream()
                .collect(Collectors.toList()));

        int numpage;
        int start = (Integer.parseInt(page) - 1) * 6;
        if (comments.size() - start >= 6) {
            numpage = start + 6;
        } else {
            numpage = comments.size();
        }
        List<NewsComment> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(comments.get(i));
        }
        return temp;
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
        return idNews;
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

    public NewsComment getCommentByIdComment(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM news_comment WHERE comment_id = ?")
                .bind(0, id)
                .mapToBean(NewsComment.class)
                .first()
        );
    }

    public List<NewsComment> getAllCommentFromNews(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM news_comment WHERE news_id = ?")
                .bind(0, id)
                .mapToBean(NewsComment.class)
                .stream().collect(Collectors.toList())
        );
    }

    public List<NewsComment> getAllCommentByPage(int page) {
        List<NewsComment> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM news_comment")
                .mapToBean(NewsComment.class)
                .stream().collect(Collectors.toList())

        );
        int numpage;
        int start = (page - 1) * 6;
        if (list.size() - start >= 6) {
            numpage = start + 6;
        } else {
            numpage = list.size();
        }
        List<NewsComment> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(list.get(i));
        }
        return temp;
    }

    public void ChangeStatusComment(String id, String status) {
        JDBIConnector.get().withHandle(handle -> handle.createUpdate("UPDATE news_comment SET comment_status=? WHERE comment_id = ?")
                .bind(0, status.equals("0") ? 1 : 0)
                .bind(1, id)
                .execute()
        );
    }
    public String getUserByIdComment(String id){
        NewsComment user =  JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT comment_by FROM news_comment WHERE comment_id = ?")
                .bind(0, id)
                .mapToBean(NewsComment.class)
                .first()
        );
        return user.getComment_by().toString();
    }
    public static void main(String[] args) {
//        System.out.println(new NewsCommentDAO().getAllCommentByPage(1));
        System.out.println(new NewsCommentDAO().getUserByIdComment("cmt10"));
    }
}
