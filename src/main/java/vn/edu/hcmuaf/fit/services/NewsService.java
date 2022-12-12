package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.NewsDAO;
import vn.edu.hcmuaf.fit.beans.news.News;
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

    public List<News> getListNewsByPage(int page) {
        return new NewsDAO().loadAllNewsWithPage(page);
    }
}
