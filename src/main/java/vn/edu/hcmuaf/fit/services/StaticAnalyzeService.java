package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class StaticAnalyzeService {
    private static StaticAnalyzeService staticAnalyze;

    public static StaticAnalyzeService getInstance() {
        if (staticAnalyze == null) {
            staticAnalyze = new StaticAnalyzeService();
        }
        return staticAnalyze;
    }

    public List<Map<String, Object>> MostBuy() {
        return new StaticAnalyzeDAO().MostBuy();
    }

    public List<Map<String, Object>> MostBuyFromUser() {
        return new StaticAnalyzeDAO().MostBuyFromUser();
    }

    public List<Map<String, Object>> MostStorage() {
        return new StaticAnalyzeDAO().MostStorage();
    }

    public List<Map<String, Object>> MostSeen() {
        return new StaticAnalyzeDAO().MostSeen();
    }
}
