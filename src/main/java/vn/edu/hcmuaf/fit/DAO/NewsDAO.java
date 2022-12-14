package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.news.News;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class NewsDAO {
    private List<News> listNews;
    public List<News> loadAllNews() {
        return listNews = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM news")
                .mapToBean(News.class)
                .stream()
                .collect(Collectors.toList()));
    }
    public List<News> loadAllNewsWithPage(int pageNumb) {
        List<News> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM news")
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
    public static void main(String[] args) {
        System.out.println(new NewsDAO().loadAllNews());
    }
}
