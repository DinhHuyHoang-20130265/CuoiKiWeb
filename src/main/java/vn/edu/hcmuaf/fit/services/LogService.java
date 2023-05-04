package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.LogAdminDAO;
import vn.edu.hcmuaf.fit.beans.LogAdmin;

import java.util.List;

public class LogService {
    private static LogService logService;

    public static LogService getInstance() {
        if (logService == null) {
            logService = new LogService();
        }
        return logService;
    }
    public List<LogAdmin> getAllLog() {
        return LogAdminDAO.getAllLog();
    }
    public List<LogAdmin> loadLogWithPage(int page,int logs){
        return new LogAdminDAO().loadLogWithPage(page, logs);
    }
    public List<LogAdmin> loadNewestLogs(){
        return new LogAdminDAO().loadNewestLogs();
    }
    public String addNewLog(String id_user, String level,String message) {
        LogAdminDAO DAO = new LogAdminDAO();
        return DAO.addNewLog(id_user, level,message);
    }
    public void removeLog(String id) {
        LogAdminDAO DAO = new LogAdminDAO();
        DAO.removeLog(id);
    }
}
