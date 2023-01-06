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

    public List<NewsComment> getAllCommentFromNews(String id) {
        NewsCommentDAO DAO = new NewsCommentDAO();
        return DAO.getAllCommentFromNews(id);
    }

    public List<NewsComment> getAllCommentByPage(int page) {
        NewsCommentDAO DAO = new NewsCommentDAO();
        return DAO.getAllCommentByPage(page);
    }

    public List<NewsComment> getNewsCommentByNews(String page, String id, String order_by) {
        NewsCommentDAO DAO = new NewsCommentDAO();
        return DAO.getCommentByNews(page, id, order_by);
    }

    public NewsComment getNewsCommentByIdComment(String id) {
        NewsCommentDAO DAO = new NewsCommentDAO();
        return DAO.getCommentByIdComment(id);
    }

    public String AddNewComment(String id, String comment, String NewsId) {
        NewsCommentDAO DAO = new NewsCommentDAO();
        return DAO.AddNewComment(id, comment, NewsId);
    }

    public void RemoveComment(String id) {
        NewsCommentDAO DAO = new NewsCommentDAO();
        DAO.RemoveComment(id);
    }

    public void ChangeStatusComment(String id, String status) {
        new NewsCommentDAO().ChangeStatusComment(id, status);
    }
}
