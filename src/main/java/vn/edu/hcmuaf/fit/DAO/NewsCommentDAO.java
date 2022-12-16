package vn.edu.hcmuaf.fit.DAO;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import java.util.List;
import java.util.stream.Collectors;
public class NewsCommentDAO {
    public List<NewsComment> getCommentByNews(String id){
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT nc.comment_id, nc.news_id,nc.comment_by" +
                        ", nc.description, nc.parent_comment,nc.commented_date, nc.comment_status FROM news_comment nc" +
                        " INNER JOIN news n ON nc.news_id = n.news_id WHERE nc.comment_status = 1 AND n.news_id =? ")
                .bind(0,id)
                .mapToBean(NewsComment.class)
                .stream()
                .collect(Collectors.toList()));
    }
//    public List<NewsComment> getParentComment(String id){
//        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT nc.comment_id ,nc.comment_by" +
//                        ", nc.description, nc.parent_comment,nc.commented_date, nc.comment_status FROM news_comment nc" +
//                        " INNER JOIN news n ON nc.news_id = n.news_id WHERE n.news_id =? AND nc.comment_status = 1" +
//                        " AND comment_id IN (SELECT nc1.comment_id FROM news_comment nc1" +
//                                            " WHERE nc1.comment_id = nc1.parent_comment)")
//                .bind(0,id)
//                .mapToBean(NewsComment.class)
//                .stream()
//                .collect(Collectors.toList()));
//    }
//    public List<NewsComment> getChildComment(String id){
//        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT n.news_id,nc.comment_id ,nc.comment_by" +
//                        ", nc.description, nc.parent_comment,nc.commented_date, nc.comment_status FROM news_comment nc" +
//                        " INNER JOIN news n ON nc.news_id = n.news_id WHERE nc.comment_status = 1 AND nc.news_id=?" +
//                        " AND comment_id NOT IN (SELECT nc1.comment_id FROM news_comment nc1" +
//                        " WHERE nc1.comment_id = nc1.parent_comment)")
//                .bind(0,id)
//                .mapToBean(NewsComment.class)
//                .stream()
//                .collect(Collectors.toList()));
//    }
    public static void main(String[] args) {
        System.out.println("new 2 comment :" + new NewsCommentDAO().getCommentByNews("news002"));
        System.out.println("new 1 comment :" +new NewsCommentDAO().getCommentByNews("news001"));
    }
}
