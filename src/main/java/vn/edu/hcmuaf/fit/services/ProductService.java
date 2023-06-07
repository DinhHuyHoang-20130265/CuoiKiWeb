package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.ProductDAO;
import vn.edu.hcmuaf.fit.DAO.PromotionDAO;
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

    public List<Product> loadProductWithCondition(int page, int num_per_page, String order_by, String category, String color, String price, String size, String search) {
        ProductDAO DAO = new ProductDAO();
        return DAO.loadProductWithCondition(page, num_per_page, order_by, category, color, price, size, search);
    }

    public int getProductSaled(String id) {
        return new ProductDAO().getProductSaled(id);
    }

    public List<Product> loadProductWithConditionContainsStatus(int page, int num_per_page, String order_by, String category, String color, String price, String size, String search) {
        ProductDAO DAO = new ProductDAO();
        return DAO.loadProductWithConditionContainsStatus(page, num_per_page, order_by, category, color, price, size, search);
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
        return DAO.getProductAndDetails(id);
    }

    public List<Product> getFourProductsSameCate(String cate_id) {
        ProductDAO DAO = new ProductDAO();
        return DAO.getFourProductsSameCate(cate_id);
    }

    public void RemoveProduct(String id) {
        new ProductDAO().RemoveProduct(id);
    }

    public int isProductInOrder(String id) {
        return new ProductDAO().isProductInOrder(id);
    }

    public void InsertNewProduct(String name, String price, int status, String userid, int quantity, String[] stringSize, String[] stringColor, String idCate, String desc, String content, String[] imgFile) {
        new ProductDAO().InsertNewProduct(name, price, status, userid, quantity, stringSize, stringColor, idCate, desc, content, imgFile);
    }

    public void UpdateProduct(String id, String name, String price, int status, String userid, int quantity, String[] stringSize, String[] stringColor, String idCate, String desc, String content, String[] imgFile) {
        new ProductDAO().UpdateProduct(id, name, price, status, userid, quantity, stringSize, stringColor, idCate, desc, content, imgFile);
    }

    public Product getProductHiddenAndDetails(String id) {
        return new ProductDAO().getProductHiddenAndDetails(id);
    }

    public List<Product> loadAllProductContainStatus() {
        return new ProductDAO().loadAllProductContainStatus();
    }

    public void AddViewCount(String id) {
        new ProductDAO().AddViewCount(id);
    }

    public Product getProductById(String id) {
        return new ProductDAO().getProductById(id);
    }
    public static void main(String[] args) {
        new ProductDAO().loadAllProductContainStatus();
    }
}
