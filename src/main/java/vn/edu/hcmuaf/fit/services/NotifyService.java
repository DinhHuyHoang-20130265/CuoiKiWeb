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
        return NotifyDAO.loadNotifyWithPage(page);
    }

    public void AddNewNotify(String content, String order_id) {
        NotifyDAO.addNewNotify(content, order_id);
    }
}
