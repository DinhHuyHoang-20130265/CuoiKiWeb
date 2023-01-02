package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.NewsCommentDAO;
import vn.edu.hcmuaf.fit.beans.news.News;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;

import java.util.List;

public class NewsCommentService {
    private static NewsCommentService newsCommentService;

    public static NewsCommentService getInstance() {
        if (newsCommentService == null) {
            newsCommentService = new NewsCommentService();
        }
        return newsCommentService;
    }

    public List<NewsComment> getNewsCommentByNews(String id, String order_by) {
        NewsCommentDAO DAO = new NewsCommentDAO();
        return DAO.getCommentByNews(id, order_by);
    }

    public String AddNewComment(String id, String comment,String NewsId) {
        NewsCommentDAO DAO = new NewsCommentDAO();
        return DAO.AddNewComment(id, comment, NewsId);
    }

    public void RemoveComment(String id) {
        NewsCommentDAO DAO = new NewsCommentDAO();
        DAO.RemoveComment(id);
    }
}
