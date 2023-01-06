package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.product.Product;
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
    public Category getCategoryByProductId(String id) {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT c.id, c.cate_name, c.cate_desc, c.parent_id, c.cate_status " +
                                "FROM product_categories c " +
                                "INNER JOIN product_from_cate pfc ON c.id = pfc.cate_id " +
                                "INNER JOIN product p ON pfc.prod_id = p.id " +
                                "WHERE c.cate_status = 1 AND p.id = ? ORDER BY c.id DESC LIMIT 1")
                        .bind(0, id)
                        .mapToBean(Category.class)
                        .first()
        );
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

    public List<Category> loadCategoryWithConditionContainsStatus(int page, int num_per_page, String search) {
        String query = "SELECT id, cate_name, cate_desc, parent_id, cate_status FROM product_categories";
        if (search != null) {
            if (!search.equals(""))
                query += " AND cate_name LIKE '%" + search + "%'";
        }
        String finalQuery = query;
        List<Category> filter = (List<Category>) JDBIConnector.get().withHandle(handle -> handle.createQuery(finalQuery)
                .mapToBean(Category.class)
                .stream()
                .collect(Collectors.toList()));
        int numpage;
        int start = (page - 1) * num_per_page;
        if (filter.size() - start >= num_per_page) {
            numpage = start + num_per_page;
        } else {
            numpage = filter.size();
        }
        List<Category> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(filter.get(i));
        }
        return temp;
    }

    public static void main(String[] args) {
        System.out.println(new CategoryDAO().loadAll());
        System.out.println(new CategoryDAO().getCategoryByProductId("prod001"));
        System.out.println(new CategoryDAO().loadCategoryWithConditionContainsStatus(1,6,null));
    }

}
