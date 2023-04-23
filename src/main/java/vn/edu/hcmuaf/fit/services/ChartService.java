package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.ChartDAO;

import java.util.Map;

public class ChartService {
    private static ChartService chartService;

    public static ChartService getInstance() {
        if (chartService == null) {
            chartService = new ChartService();
        }
        return chartService;
    }
    public Map<String, Integer> TopSaleProductThisMonth() {
        return new ChartDAO().TopSaleProductThisMonth();
    }
    public Map<String, Integer> SaledProductByNearest6Months() {
        return new ChartDAO().SaledProductByNearest6Months();
    }
    public Map<String, Integer> NumbOrderByNearest6Months() {
        return new ChartDAO().NumbOrderByNearest6Months();
    }
    public Map<String, Double> RevenueNearest6Months() {
        return new ChartDAO().RevenueNearest6Months();
    }
    public int totalAllTime() {
        return new ChartDAO().totalAllTime();
    }
}
