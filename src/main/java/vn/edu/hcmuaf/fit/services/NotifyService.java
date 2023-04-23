package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.NotifyDAO;
import vn.edu.hcmuaf.fit.beans.Notify_Admin;

import java.util.List;

public class NotifyService {
    private static NotifyService notifyService;

    public static NotifyService getInstance() {
        if (notifyService == null) {
            notifyService = new NotifyService();
        }
        return notifyService;
    }

    public List<Notify_Admin> getAllNotify() {
        return NotifyDAO.getAllNotify();
    }
    public List<Notify_Admin> loadNotifyWithPage(int page){
        return new NotifyDAO().loadNotifyWithPage(page);
    }
    public Notify_Admin getNotifyById(String id){
        NotifyDAO DAO = new NotifyDAO();
        return DAO.getNotifyById(id);
    }
    public String addNewNotify(String content, String order_id,String type) {
        NotifyDAO DAO = new NotifyDAO();
        return DAO.addNewNotify(content, order_id,type);
    }
    public void removeNotify(String id){
        NotifyDAO DAO = new NotifyDAO();
        DAO.removeNotify(id);
    }
    public List<Notify_Admin> loadNewestNotifies(){
        return new NotifyDAO().loadNewestNotifies();
    }
}
