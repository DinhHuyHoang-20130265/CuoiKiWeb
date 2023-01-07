package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.slide.Slide;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class SlideDAO {
    public  List<Slide> LoadAllSlide() {
      return  JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM slide WHERE slide_status = 1")
                .mapToBean(Slide.class)
                .stream()
                .collect(Collectors.toList()));
    }
    public List<Slide> getAllSlideByPage(int page) {
        List<Slide> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM slide")
                .mapToBean(Slide.class)
                .stream()
                .collect(Collectors.toList())

        );
        int numpage;
        int start = (page - 1) * 6;
        if (list.size() - start >= 6) {
            numpage = start + 6;
        } else {
            numpage = list.size();
        }
        List<Slide> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(list.get(i));
        }
        return temp;
    }


    public void RemoveSlide(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM slide WHERE slide_id = ?")
                            .bind(0, id)
                            .execute();
                    return true;
                }
        );
    }

    public static void main(String[] args) {
        System.out.println(new SlideDAO().getAllSlideByPage(1));
    }
}
