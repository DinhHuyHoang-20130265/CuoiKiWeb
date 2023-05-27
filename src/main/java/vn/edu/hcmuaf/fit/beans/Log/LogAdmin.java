package vn.edu.hcmuaf.fit.beans.Log;

import java.io.Serializable;
import java.util.Date;

public class LogAdmin implements Serializable {
    private String id;
    private String id_user;
    private String message;
    private String level; // level chỉ coi log là thuộc cấp gì (login, error, order,....)
    private String type; // admin hay customer
    private Date created_date;

    public LogAdmin() {

    }

    public LogAdmin(String id,String id_user, String message, String level, String type,Date created_date) {
        this.id = id;
        this.id_user = id_user;
        this.message = message;
        this.level = level;
        this.type = type;
        this.created_date = created_date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    @Override
    public String toString() {
        return "LogAdmin{" +
                "id='" + id + '\'' +
                ", id_user='" + id_user + '\'' +
                ", message='" + message + '\'' +
                ", level='" + level + '\'' +
                ", type='" + type + '\'' +
                ", created_date=" + created_date +
                '}';
    }
}
