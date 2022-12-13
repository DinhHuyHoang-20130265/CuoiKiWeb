package vn.edu.hcmuaf.fit.DAO;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import java.util.List;
import java.util.stream.Collectors;
public class NewsCommentDAO {
    private List<NewsComment> listNewsComment;
    public List<NewsComment> loadNewsComment() {
        return listNewsComment = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM news_comment")
                .mapToBean(NewsComment.class)
                .stream()
                .collect(Collectors.toList()));
    }
    public static void main(String[] args) {
        System.out.println(new NewsCommentDAO().loadNewsComment());
    }
}
