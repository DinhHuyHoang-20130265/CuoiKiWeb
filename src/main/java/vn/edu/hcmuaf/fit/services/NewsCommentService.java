package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.NewsCommentDAO;
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
    public List<NewsComment> getNewsCommentByNews(String id) {
        NewsCommentDAO DAO = new NewsCommentDAO();
        return DAO.getCommentByNews(id);
    }
//    public List<NewsComment> getParentComment(String id) {
//        NewsCommentDAO DAO = new NewsCommentDAO();
//        return DAO.getParentComment(id);
//    }
//    public List<NewsComment> getChildComment(String id) {
//        NewsCommentDAO DAO = new NewsCommentDAO();
//        return DAO.getChildComment(id);
//    }
}
