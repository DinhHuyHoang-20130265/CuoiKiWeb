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
    public List<Slide> getAllSlideByPage(int page) {
        return new SlideDAO().getAllSlideByPage(page);
    }

    public void RemoveSlide(String id) {
        new SlideDAO().RemoveSlide(id);
    }
    public Slide getSlideHiddenAndDetails(String id) {
        return new SlideDAO().getSlideHiddenAndDetails(id);
    }

    public void InsertNewSlide(String content, String newImg, int status) {
        new SlideDAO().InsertNewSlide(content, newImg, status);
    }

    public void UpdateSlide(String id, String content, String newImg, int status) {
        new SlideDAO().UpdateSlide(id, content, newImg, status);
    }
}
