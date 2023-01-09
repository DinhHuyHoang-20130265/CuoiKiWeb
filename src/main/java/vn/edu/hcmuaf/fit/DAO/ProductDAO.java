package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.product.*;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class ProductDAO {
    private List<Product> listProduct;

    public ProductDAO() {
        listProduct = new ArrayList<>();
    }

    public void loadAllProduct() {
        listProduct = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM product WHERE prod_status = 1").mapToBean(Product.class).stream().collect(Collectors.toList()));
    }

    public int getProductSaled(String id) {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT COUNT(prod_id) FROM order_details WHERE prod_id= ?").bind(0, id).mapTo(Integer.class).one());
    }

    public List<Product> loadAllProductContainStatus() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM product").mapToBean(Product.class).stream().collect(Collectors.toList()));
    }

    public List<Product> loadProductWithCondition(int page, int num_per_page, String order_by, String cate_id, String color, String price, String size, String search) {
        String query = "SELECT p.id, p.prod_name, p.prod_desc, p.prod_status, p.main_img_link," + " p.price, p.released_date, p.released_by, p.quantity, p.warranty_day, p.view_count," + " p.updated_date, p.updated_by FROM product p" + " LEFT JOIN color c ON c.prod_id = p.id LEFT JOIN size s ON p.id = s.prod_id" + " INNER JOIN product_from_cate pfc ON pfc.prod_id = p.id" + " WHERE p.prod_status = 1";
        if (cate_id != null) {
            if (!cate_id.equals("all")) query += " AND pfc.cate_id = \"" + cate_id + "\"";
        }
        if (color != null) {
            if (!"".equals(color)) query += " AND c.color_name IN (" + color.substring(0, color.length() - 1) + ")";
        }
        if (price != null) {
            if (!price.equals("-1")) {
                String[] splited = price.split("-");
                query += " AND p.price >= " + Double.parseDouble(splited[0]) + " AND p.price <= " + Double.parseDouble(splited[1]);
            }
        }
        if (size != null) {
            if (!"".equals(size)) query += " AND s.size_name IN (" + size.substring(0, size.length() - 1) + ")";
        }
        if (search != null) {
            query += " AND p.prod_name LIKE '%" + search + "%'";
        }
        query += " GROUP BY p.id ";
        if (color != null) {
            if (!"".equals(color)) {
                color = color.substring(0, color.length() - 1);
                List<String> listColor = new ArrayList<>(Arrays.asList(color.split(",")));
                query += " HAVING COUNT(DISTINCT c.color_name) = " + listColor.size() + " ";
            }
        }
        if (size != null) {
            if (!"".equals(size)) {
                size = size.substring(0, size.length() - 1);
                List<String> listSize = new ArrayList<>(Arrays.asList(size.split(",")));
                if (color != null) {
                    if (!"".equals(color)) query += " AND COUNT(DISTINCT s.size_name) = " + listSize.size() + " ";
                    else {
                        query += " HAVING COUNT(DISTINCT s.size_name) = " + listSize.size() + " ";
                    }
                } else query += " HAVING COUNT(DISTINCT s.size_name) = " + listSize.size() + " ";
            }
        }
        if (order_by != null) {
            switch (order_by) {
                case "0" -> query += " ORDER BY p.view_count DESC";
                case "1" -> query += " ORDER BY p.price ASC";
                case "2" -> query += " ORDER BY p.price DESC";
                case "3" -> query += " ORDER BY p.prod_name ASC";
                case "4" -> query += " ORDER BY p.prod_name DESC";
                case "5" -> query += " ORDER BY p.released_date ASC";
                case "6" -> query += " ORDER BY p.released_date DESC";
                case "7" -> query += " ORDER BY p.quantity ASC";
            }
        }
        String finalQuery = query;
        System.out.println(finalQuery);
        List<Product> filter = JDBIConnector.get().withHandle(handle -> handle.createQuery(finalQuery).mapToBean(Product.class).stream().collect(Collectors.toList()));
        List<ProductSale> sales = getListSale();
        for (Product p : filter) {
            for (ProductSale sale : sales) {
                if (p.getId().equals(sale.getProduct_id())) p.setSales(sale);
            }
        }
        int numpage;
        int start = (page - 1) * num_per_page;
        if (filter.size() % num_per_page != 0 && filter.size() - start >= num_per_page) {
            numpage = start + num_per_page;
        } else {
            numpage = filter.size();
        }
        List<Product> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(filter.get(i));
        }
        return temp;
    }

    public List<Product> loadProductWithConditionContainsStatus(int page, int num_per_page, String order_by, String cate_id, String color, String price, String size, String search) {
        String query = "SELECT DISTINCT p.id, p.prod_name, p.prod_desc, p.prod_status, p.main_img_link," + " p.price, p.released_date, p.released_by, p.quantity, p.warranty_day, p.view_count," + " p.updated_date, p.updated_by FROM product p" + " LEFT JOIN color c ON c.prod_id = p.id LEFT JOIN size s ON p.id = s.prod_id" + " INNER JOIN product_from_cate pfc ON pfc.prod_id = p.id" + " WHERE p.prod_status IN (1, 0)";
        if (cate_id != null) {
            if (!cate_id.equals("all")) query += " AND pfc.cate_id = \"" + cate_id + "\"";
        }
        if (color != null) {
            if (!"".equals(color)) query += " AND c.color_name IN (" + color.substring(0, color.length() - 1) + ")";
        }
        if (price != null) {
            if (!price.equals("-1")) {
                String[] splited = price.split("-");
                query += " AND p.price >= " + Double.parseDouble(splited[0]) + " AND p.price <= " + Double.parseDouble(splited[1]);
            }
        }
        if (size != null) {
            if (!"".equals(size)) query += " AND s.size_name IN (" + size.substring(0, size.length() - 1) + ")";
        }
        if (search != null) {
            if (!search.equals("")) query += " AND p.prod_name LIKE '%" + search + "%'";
        }
        if (order_by != null) {
            switch (order_by) {
                case "0" -> query += " ORDER BY p.view_count DESC";
                case "1" -> query += " ORDER BY p.price ASC";
                case "2" -> query += " ORDER BY p.price DESC";
                case "3" -> query += " ORDER BY p.prod_name ASC";
                case "4" -> query += " ORDER BY p.prod_name DESC";
                case "5" -> query += " ORDER BY p.released_date ASC";
                case "6" -> query += " ORDER BY p.released_date DESC";
                case "7" -> query += " ORDER BY p.quantity ASC";
            }
        }
        String finalQuery = query;
        List<Product> filter = JDBIConnector.get().withHandle(handle -> handle.createQuery(finalQuery).mapToBean(Product.class).stream().collect(Collectors.toList()));
        List<ProductSale> sales = getListSale();
        for (Product p : filter) {
            for (ProductSale sale : sales) {
                if (p.getId().equals(sale.getProduct_id())) p.setSales(sale);
            }
        }
        int numpage;
        int start = (page - 1) * num_per_page;
        if (filter.size() - start >= num_per_page) {
            numpage = start + num_per_page;
        } else {
            numpage = filter.size();
        }
        List<Product> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(filter.get(i));
        }
        return temp;
    }

    public ArrayList<Product> getListProductByCateId(String id) {
        return (ArrayList<Product>) JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT DISTINCT p.id, p.prod_name, p.prod_desc, p.prod_status, p.main_img_link," + " p.price, p.released_date, p.released_by, p.quantity, p.warranty_day, p.view_count," + " p.updated_date, p.updated_by FROM product p INNER JOIN product_from_cate pfc ON p.id = pfc.prod_id" + " WHERE p.prod_status = 1 AND pfc.cate_id = ?").bind(0, id).mapToBean(Product.class).stream().collect(Collectors.toList()));
    }

    public List<ProductSale> getListSale() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT DISTINCT p.promo_id, p.product_id, p.name_prom, p.desc_prom, p.discount_rate," + " p.start_date, p.end_date FROM promotion p" + " WHERE p.end_date > DATE(NOW())").mapToBean(ProductSale.class).stream().collect(Collectors.toList()));
    }

    public List<Product> getFourProductsSameCate(String cate_id) {
        return (List<Product>) JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT DISTINCT p.id, p.prod_name, p.prod_desc, p.content, p.prod_status, p.main_img_link," + " p.price, p.released_date, p.released_by, p.quantity, p.warranty_day, p.view_count," + " p.updated_date, p.updated_by FROM product p INNER JOIN product_from_cate frcate ON p.id =  frcate.prod_id" + " INNER JOIN product_categories cate ON cate.id = frcate.cate_id " + " WHERE cate.id = ?" + "ORDER BY p.id LIMIT 4").bind(0, cate_id).mapToBean(Product.class).stream().collect(Collectors.toList())

        );
    }

    public ArrayList<Product> getListProduct() {
        return (ArrayList<Product>) listProduct;
    }

    public void setListProduct(ArrayList<Product> listProduct) {
        this.listProduct = listProduct;
    }

    public Product getProductHiddenAndDetails(String id) {
        Product product = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT p.id, p.prod_name, p.prod_desc, p.content, p.prod_status, p.main_img_link," + " p.price, p.released_date, p.released_by, p.quantity, p.warranty_day, p.view_count," + " p.updated_date, p.updated_by FROM product p " + " WHERE p.id =?").bind(0, id).mapToBean(Product.class).one());
        List<ProductColor> colors;
        List<ProductSize> sizes;
        List<ProductImage> images;
        ProductSale sale = null;
        colors = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.prod_id, c.color_name FROM color c Where c.prod_id =?").bind(0, id).mapToBean(ProductColor.class).stream().collect(Collectors.toList()));
        sizes = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.prod_id, c.size_name FROM size c Where c.prod_id =?").bind(0, id).mapToBean(ProductSize.class).stream().collect(Collectors.toList()));
        images = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.prod_id, c.prod_img_link FROM img_product c Where c.prod_id =?").bind(0, id).mapToBean(ProductImage.class).stream().collect(Collectors.toList()));
        try {
            sale = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT DISTINCT p.promo_id, p.product_id, p.name_prom, p.desc_prom, p.discount_rate," + " p.start_date, p.end_date FROM promotion p" + " WHERE p.end_date > DATE(NOW()) AND p.product_id = ?").bind(0, id).mapToBean(ProductSale.class).one());
        } catch (Exception e) {

        }
        List<Category> categories = new CategoryDAO().getCategoryByIdProduct(id);
        product.setCategories(categories);
        product.setImages(images);
        product.setColors(colors);
        product.setSizes(sizes);
        product.setSales(sale);
        return product;
    }

    public Product getProductAndDetails(String id) {
        Product product = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT p.id, p.prod_name, p.prod_desc, p.content, p.prod_status, p.main_img_link," + " p.price, p.released_date, p.released_by, p.quantity, p.warranty_day, p.view_count," + " p.updated_date, p.updated_by FROM product p " + " WHERE p.prod_status = 1 AND p.id =?").bind(0, id).mapToBean(Product.class).one());
        List<ProductColor> colors;
        List<ProductSize> sizes;
        List<ProductImage> images;
        ProductSale sale = null;
        colors = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.prod_id, c.color_name FROM color c Where c.prod_id =?").bind(0, id).mapToBean(ProductColor.class).stream().collect(Collectors.toList()));
        sizes = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.prod_id, c.size_name FROM size c Where c.prod_id =?").bind(0, id).mapToBean(ProductSize.class).stream().collect(Collectors.toList()));
        images = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.prod_id, c.prod_img_link FROM img_product c Where c.prod_id =?").bind(0, id).mapToBean(ProductImage.class).stream().collect(Collectors.toList()));
        try {
            sale = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT DISTINCT p.promo_id, p.product_id, p.name_prom, p.desc_prom, p.discount_rate," + " p.start_date, p.end_date FROM promotion p" + " WHERE p.end_date > DATE(NOW()) AND p.product_id = ?").bind(0, id).mapToBean(ProductSale.class).one());
        } catch (Exception e) {

        }
        List<Category> categories = new CategoryDAO().getCategoryByIdProduct(id);
        product.setCategories(categories);
        product.setImages(images);
        product.setColors(colors);
        product.setSizes(sizes);
        product.setSales(sale);
        return product;
    }

    public void RemoveProduct(String id) {
        JDBIConnector.get().withHandle(handle -> {
            handle.execute("SET FOREIGN_KEY_CHECKS=0");
            handle.createUpdate("DELETE FROM product WHERE id =?").bind(0, id).execute();
            handle.execute("SET FOREIGN_KEY_CHECKS=1");
            return true;
        });
    }

    public int isProductInOrder(String id) {
        List<String> idProduct = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT prod_id FROM order_details WHERE prod_id=?").bind(0, id).mapTo(String.class).stream().collect(Collectors.toList()));
        if (idProduct.contains(id)) return 1;
        else return 0;
    }

    public String generateIdProduct() {
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
        if (id.contains(sb.toString())) return generateIdProduct();
        else return sb.toString();
    }

    public void InsertNewProduct(String name, String price, int status, String userid, int quantity, String[] stringSize, String[] stringColor, String idCate, String desc, String content, String[] imgFile) {
        String id = generateIdProduct();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("INSERT INTO product values (?, ?, ?, ?, ?, ?, ?, CURDATE(),?,?, 30, 0, NULL, NULL)").bind(0, id).bind(1, name).bind(2, desc).bind(3, content).bind(4, status).bind(5, (imgFile == null) ? "NULL" : "http://localhost:8080/CuoiKiWeb_war/assets/imgProduct/images/" + imgFile[0]).bind(6, Double.parseDouble(price)).bind(7, userid).bind(8, quantity).execute();
            handle.createUpdate("INSERT INTO product_from_cate values (? ,?)").bind(0, idCate).bind(1, id).execute();
            if (imgFile != null) {
                for (int i = 1; i < imgFile.length; i++) {
                    handle.createUpdate("INSERT INTO img_product VALUES (?, ?)").bind(0, id).bind(1, "http://localhost:8080/CuoiKiWeb_war/assets/imgProduct/images/" + imgFile[i]).execute();
                }
            }
            if (stringSize != null) {
                for (int i = 0; i < stringSize.length; i++) {
                    handle.createUpdate("INSERT INTO size VALUES (?, ?)").bind(0, id).bind(1, stringSize[i]).execute();
                }
            }
            if (stringColor != null) {
                for (int i = 0; i < stringColor.length; i++) {
                    handle.createUpdate("INSERT INTO color VALUES (?, ?)").bind(0, id).bind(1, stringColor[i]).execute();
                }
            }
            return true;
        });

    }

    public void UpdateProduct(String id, String name, String price, int status, String userid, int quantity, String[] stringSize, String[] stringColor, String idCate, String desc, String content, String[] imgFile) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("UPDATE product SET prod_name = ?, prod_desc = ?, content =?, prod_status =?, main_img_link = ?, " + "price = ?, quantity = ?, updated_date = CURDATE(), updated_by = ? WHERE id = ?").bind(0, name).bind(1, desc).bind(2, content).bind(3, status).bind(4, (imgFile == null || imgFile.length == 0) ? "NULL" : "http://localhost:8080/CuoiKiWeb_war/assets/imgProduct/images/" + imgFile[0]).bind(5, Double.parseDouble(price)).bind(6, quantity).bind(7, userid).bind(8, id).execute();
            handle.createUpdate("DELETE FROM product_from_cate WHERE prod_id = ?").bind(0, id).execute();
            handle.createUpdate("DELETE FROM img_product WHERE prod_id=?").bind(0, id).execute();
            handle.createUpdate("DELETE FROM color WHERE prod_id=?").bind(0, id).execute();
            handle.createUpdate("DELETE FROM size WHERE prod_id=?").bind(0, id).execute();
            handle.createUpdate("INSERT INTO product_from_cate values (? ,?)").bind(0, idCate).bind(1, id).execute();
            if (imgFile != null) {
                for (int i = 1; i < imgFile.length; i++) {
                    handle.createUpdate("INSERT INTO img_product VALUES (?, ?)").bind(0, id).bind(1, "http://localhost:8080/CuoiKiWeb_war/assets/imgProduct/images/" + imgFile[i]).execute();
                }
            }
            if (stringSize != null) {
                for (int i = 0; i < stringSize.length; i++) {
                    handle.createUpdate("INSERT INTO size VALUES (?, ?)").bind(0, id).bind(1, stringSize[i]).execute();
                }
            }
            if (stringColor != null) {
                for (int i = 0; i < stringColor.length; i++) {
                    handle.createUpdate("INSERT INTO color VALUES (?, ?)").bind(0, id).bind(1, stringColor[i]).execute();
                }
            }
            return true;
        });
    }

    public static void main(String[] args) {
        System.out.println(new ProductDAO().isProductInOrder("prod010"));
    }
}
