package vn.edu.hcmuaf.fit.beans.slide;

import java.io.Serializable;

public class Slide implements Serializable {
    private String slide_id;
    private String slide_link;
    private String slide_desc;
    private int slide_status;
    public Slide() {
    }

    public Slide(String slide_id, String slide_link, String slide_desc, int slide_status) {
        this.slide_id = slide_id;
        this.slide_link = slide_link;
        this.slide_desc = slide_desc;
        this.slide_status = slide_status;
    }

    public String getSlide_id() {
        return slide_id;
    }

    public void setSlide_id(String slide_id) {
        this.slide_id = slide_id;
    }

    public String getSlide_link() {
        return slide_link;
    }

    public void setSlide_link(String slide_link) {
        this.slide_link = slide_link;
    }

    public String getSlide_desc() {
        return slide_desc;
    }

    public void setSlide_desc(String slide_desc) {
        this.slide_desc = slide_desc;
    }

    public int getSlide_status() {
        return slide_status;
    }

    public void setSlide_status(int slide_status) {
        this.slide_status = slide_status;
    }

    @Override
    public String toString() {
        return "Slide{" +
                "slide_id='" + slide_id + '\'' +
                ", slide_link='" + slide_link + '\'' +
                ", slide_desc='" + slide_desc + '\'' +
                ", slide_status=" + slide_status +
                '}';
    }
}
