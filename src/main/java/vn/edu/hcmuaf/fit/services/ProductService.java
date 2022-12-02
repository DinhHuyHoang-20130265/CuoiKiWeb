package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.ProductDAO;
import vn.edu.hcmuaf.fit.beans.product.Product;

import java.util.ArrayList;
public class ProductService {
    private static ProductService productService;
    public static ProductService getInstance() {
        if (productService == null) {
            productService = new ProductService();
        }
        return productService;
    }

    public ArrayList<Product> loadProductWithCondition(int page, int num_per_page, String order_by, String category, String color
            , double[] price, String size, String search) {
        ProductDAO DAO = new ProductDAO();
        DAO.loadProductWithCondition(page, num_per_page, order_by, category, color, price, size, search);
        return DAO.getListProduct();
    }

    public ArrayList<Product> getListProduct() {
        ProductDAO DAO = new ProductDAO();
        DAO.loadAllProduct();
        return DAO.getListProduct();
    }
}
