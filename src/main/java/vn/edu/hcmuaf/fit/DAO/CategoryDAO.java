package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class CategoryDAO {

    public CategoryDAO() {
    }

    public ArrayList<Category> loadAll() {
        return (ArrayList<Category>) JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT c.id, c.cate_name, c.cate_desc, c.parent_id, c.cate_status " +
                                "FROM product_categories c WHERE c.cate_status = 1")
                        .mapToBean(Category.class)
                        .stream()
                        .collect(Collectors.toList()));
    }

    public List<Category> getCategoryByIdProduct(String id) {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT c.id, c.cate_name, c.cate_desc, c.parent_id, c.cate_status " +
                                "FROM product_categories c " +
                                "INNER JOIN product_from_cate pfc ON c.id = pfc.cate_id " +
                                "WHERE c.cate_status = 1 AND pfc.prod_id = ?")
                        .bind(0, id)
                        .mapToBean(Category.class)
                        .stream()
                        .collect(Collectors.toList()));
    }

    public List<Category> getChildCategory(String id) {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT c.id, c.cate_name, c.cate_desc, c.parent_id, c.cate_status " +
                                "FROM product_categories c " +
                                "WHERE c.cate_status = 1 AND c.parent_id = ?")
                        .bind(0, id)
                        .mapToBean(Category.class)
                        .stream()
                        .collect(Collectors.toList()));
    }

    public Category getCateWithID(String category) {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT c.id, c.cate_name, c.cate_desc, c.parent_id, c.cate_status " +
                                "FROM product_categories c " +
                                "WHERE c.cate_status = 1 AND c.id = ?")
                        .bind(0, category)
                        .mapToBean(Category.class)
                        .first()
        );
    }

    public static void main(String[] args) {
        System.out.println(new CategoryDAO().getCateWithID("cate01"));
    }

}
