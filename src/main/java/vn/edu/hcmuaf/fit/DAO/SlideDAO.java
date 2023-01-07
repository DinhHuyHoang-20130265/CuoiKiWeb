package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.slide.Slide;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class SlideDAO {
    public  List<Slide> LoadAllSlide() {
      return  JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM slide WHERE slide_status = 1")
                .mapToBean(Slide.class)
                .stream()
                .collect(Collectors.toList()));
    }
}
