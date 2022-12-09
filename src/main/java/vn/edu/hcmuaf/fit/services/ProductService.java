package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.ProductDAO;
import vn.edu.hcmuaf.fit.beans.product.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private static ProductService productService;

    public static ProductService getInstance() {
        if (productService == null) {
            productService = new ProductService();
        }
        return productService;
    }

    public List<Product> loadProductWithCondition(int page, int num_per_page, String order_by, String category, String color
            , String price, String size, String search) {
        ProductDAO DAO = new ProductDAO();
        return DAO.loadProductWithCondition(page, num_per_page, order_by, category, color, price, size, search);
    }

    public ArrayList<Product> getListProduct() {
        ProductDAO DAO = new ProductDAO();
        DAO.loadAllProduct();
        return DAO.getListProduct();
    }

    public ArrayList<Product> getListProductByCateId(String id) {
        ProductDAO DAO = new ProductDAO();
        return DAO.getListProductByCateId(id);
    }


    public Product getProductAndDetails(String id) {
        ProductDAO DAO = new ProductDAO();
        Product product = DAO.getProductAndDetails(id);
        return product;
    }

    public static void main(String[] args) {
        ProductService.getInstance().getProductAndDetails("prod003");
    }
}
