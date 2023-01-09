package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class CategoryDAO {

    public CategoryDAO() {
    }

    public ArrayList<Category> loadAll() {
        return (ArrayList<Category>) JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.id, c.cate_name, c.cate_desc, c.parent_id, c.cate_status " + "FROM product_categories c WHERE c.cate_status = 1").mapToBean(Category.class).stream().collect(Collectors.toList()));
    }

    public List<Category> getCategoryByIdProduct(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.id, c.cate_name, c.cate_desc, c.parent_id, c.cate_status " + "FROM product_categories c " + "INNER JOIN product_from_cate pfc ON c.id = pfc.cate_id " + "WHERE c.cate_status = 1 AND pfc.prod_id = ?").bind(0, id).mapToBean(Category.class).stream().collect(Collectors.toList()));
    }

    public Category getCategoryByProductId(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.id, c.cate_name, c.cate_desc, c.parent_id, c.cate_status " + "FROM product_categories c " + "INNER JOIN product_from_cate pfc ON c.id = pfc.cate_id " + "INNER JOIN product p ON pfc.prod_id = p.id " + "WHERE c.cate_status = 1 AND p.id = ? ORDER BY c.id DESC LIMIT 1").bind(0, id).mapToBean(Category.class).first());
    }


    public List<Category> getChildCategory(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.id, c.cate_name, c.cate_desc, c.parent_id, c.cate_status " + "FROM product_categories c " + "WHERE c.cate_status = 1 AND c.parent_id = ?").bind(0, id).mapToBean(Category.class).stream().collect(Collectors.toList()));
    }

    public String getParentCategory(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.parent_id " + "FROM product_categories c " + "WHERE c.cate_status = 1 AND c.id = ?").bind(0, id).mapTo(String.class).findFirst().orElse(null));
    }

    public Category getCateWithID(String category) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.id, c.cate_name, c.cate_desc, c.parent_id, c.cate_status " + "FROM product_categories c " + "WHERE c.cate_status = 1 AND c.id = ?").bind(0, category).mapToBean(Category.class).first());
    }

    public List<Category> loadCategoryWithConditionContainsStatus(int page, int num_per_page) {
        String query = "SELECT id, cate_name, cate_desc, parent_id, cate_status FROM product_categories";
        List<Category> filter = (List<Category>) JDBIConnector.get().withHandle(handle -> handle.createQuery(query).mapToBean(Category.class).stream().collect(Collectors.toList()));
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

    public void RemoveCate(String id) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("SET FOREIGN_KEY_CHECKS = 0").execute();
            handle.createUpdate("DELETE FROM product_categories WHERE id=?").bind(0, id).execute();
            handle.createUpdate("SET FOREIGN_KEY_CHECKS = 1").execute();
            return null;
        });
    }

    public Category getCategoryHiddenAndDetails(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT id, cate_name, cate_desc, parent_id, cate_status FROM product_categories " + " WHERE id =?").bind(0, id).mapToBean(Category.class).one());
    }

    private String generateIdCategory() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT id FROM user_account").mapTo(String.class).stream().collect(Collectors.toList()));
        String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String alphaNumeric = upperAlphabet + lowerAlphabet + numbers;

        StringBuilder sb = new StringBuilder();

        // create an object of Random class
        Random random = new Random();
        // specify length of random string
        int length = 10;
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(alphaNumeric.length());
            char randomChar = alphaNumeric.charAt(index);
            sb.append(randomChar);
        }
        if (id.contains(sb.toString())) return generateIdCategory();
        else return sb.toString();

    }

    public void InsertNewCategory(String cate_name, String cate_desc, String parent_id, int status) {
        String id = generateIdCategory();
        JDBIConnector.get().withHandle(handle -> {
            if (parent_id.equals("0")) {
                handle.createUpdate("INSERT INTO product_categories VALUES (?,?,?,NULL,?)").bind(0, id).bind(1, cate_name).bind(2, cate_desc).bind(3, status).execute();
            } else {
                handle.createUpdate("INSERT INTO product_categories VALUES (?,?,?,?,?)").bind(0, id).bind(1, cate_name).bind(2, cate_desc).bind(3, parent_id).bind(4, status).execute();
            }
            return null;
        });
    }

    public void UpdateCategory(String id, String cate_name, String cate_desc, String parent_id, int status) {
        JDBIConnector.get().withHandle(handle -> {
            if (parent_id.equals("0")) {
                handle.createUpdate("UPDATE product_categories SET cate_name = ?, cate_desc = ?, parent_id = NULL, cate_status = ? WHERE id = ?").bind(0, cate_name).bind(1, cate_desc).bind(2, status).bind(3, id).execute();
            } else {
                handle.createUpdate("UPDATE product_categories SET cate_name = ?, cate_desc = ?, parent_id = ?, cate_status = ? WHERE id = ?").bind(0, cate_name).bind(1, cate_desc).bind(2, parent_id).bind(3, status).bind(4, id).execute();
            }
            return null;
        });
    }

    public static void main(String[] args) {
        System.out.println(new CategoryDAO().loadCategoryWithConditionContainsStatus(7, 6));
        new CategoryDAO().UpdateCategory("FbELtf6uwo", "Ao 3 lo", "1212", "cate01", 1);
    }
}
