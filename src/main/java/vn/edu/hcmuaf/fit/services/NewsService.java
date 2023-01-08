package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.NewsCommentDAO;
import vn.edu.hcmuaf.fit.DAO.NewsDAO;
import vn.edu.hcmuaf.fit.beans.AdminLogin;
import vn.edu.hcmuaf.fit.beans.news.News;
import vn.edu.hcmuaf.fit.beans.news.NewsComment;

import java.util.ArrayList;
import java.util.List;

public class NewsService {
    private static NewsService newsService;

    public static NewsService getInstance() {
        if (newsService == null) {
            newsService = new NewsService();
        }
        return newsService;
    }
    public ArrayList<News> getListNews() {
        return (ArrayList<News>) new NewsDAO().loadAllNews();
    }

    public List<News> getListNewsByPage(int pageNumb) {
        return new NewsDAO().loadAllNewsWithPage(pageNumb);
    }

    public News getNewsById(String id) {
        return new NewsDAO().getNewsById(id);
    }

    public void RemoveNews(String id) {
        NewsDAO DAO = new NewsDAO();
        DAO.RemoveNews(id);
    }

    public void InsertNewNews(String title, String description,String content,String news_img_link, String posted_by) {
        NewsDAO DAO = new NewsDAO();
        DAO.InsertNewNews(title,description,content,news_img_link,posted_by);
    }

    public void UpdateNews(String news_id,String news_title, String description,String content,String news_img_link,String updated_by) {
        NewsDAO DAO = new NewsDAO();
        DAO.UpdateNews(news_id,news_title,description,content,news_img_link,updated_by);
    }
}
