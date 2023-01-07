package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.SlideDAO;
import vn.edu.hcmuaf.fit.beans.slide.Slide;

import java.util.List;

public class SlideService {
    private static SlideService slideService;

    public static SlideService getInstance() {
        if (slideService == null) {
            slideService = new SlideService();
        }
        return slideService;
    }
    public List<Slide> LoadAllSlide() {
        return new SlideDAO().LoadAllSlide();
    }
}
