package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.product.*;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductDAO {
    private List<Product> listProduct;

    public ProductDAO() {
        listProduct = new ArrayList<>();
    }

    public void loadAllProduct() {
        listProduct = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM product WHERE prod_status = 1")
                .mapToBean(Product.class)
                .stream()
                .collect(Collectors.toList()));
    }

    public List<Product> loadProductWithCondition(int page, int num_per_page, String order_by, String cate_id, String color
            , double[] price, String size, String search) {
        String query = "SELECT DISTINCT p.id, p.prod_name, p.prod_desc, p.prod_status, p.main_img_link," +
                " p.price, p.released_date, p.released_by, p.quantity, p.warranty_day, p.view_count," +
                " p.updated_date, p.updated_by FROM product p" +
                " LEFT JOIN color c ON c.prod_id = p.id LEFT JOIN size s ON p.id = s.prod_id" +
                " INNER JOIN product_from_cate pfc ON pfc.prod_id = p.id" +
                " WHERE p.prod_status = 1";
        if (cate_id != null) {
            if (!cate_id.equals("all"))
                query += " AND pfc.cate_id = \"" + cate_id + "\"";
        }
        if (color != null) {
            query += " AND c.color_name = \"" + color + "\"";
        }
        if (price != null) {
            if (price.length == 2 && price[0] < price[1])
                query += " AND p.price >= " + price[0] + " AND p.price <= " + price[1];
        }
        if (size != null) {
            query += " AND s.size_name = \"" + size + "\"";
        }
        if (search != null) {
            query += " AND p.prod_name LIKE '%" + search + "%'";
        }
        if (order_by != null) {
            switch (order_by) {
                case "0" -> query += " ORDER BY p.view_count DESC";
                case "1" -> query += " ORDER BY p.price ASC";
                case "2" -> query += " ORDER BY p.price DESC";
                case "3" -> query += " ORDER BY p.prod_name ASC";
                case "4" -> query += " ORDER BY p.prod_name DESC";
                case "5" -> query += " ORDER BY p.released_date DESC";
                case "6" -> query += " ORDER BY p.released_date ASC";
                case "7" -> query += " ORDER BY p.quantity ASC";
            }
        }
        String finalQuery = query;
        List<Product> filter = JDBIConnector.get().withHandle(handle -> handle.createQuery(finalQuery)
                .mapToBean(Product.class)
                .stream()
                .collect(Collectors.toList()));
        List<ProductSale> sales = getListSale();
        for (Product p : filter) {
            for (ProductSale sale : sales) {
                if (p.getId().equals(sale.getProduct_id()))
                    p.setSales(sale);
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

    public ArrayList<Product> getListProductByCateId(String id) {
        return (ArrayList<Product>) JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT DISTINCT p.id, p.prod_name, p.prod_desc, p.prod_status, p.main_img_link," +
                                " p.price, p.released_date, p.released_by, p.quantity, p.warranty_day, p.view_count," +
                                " p.updated_date, p.updated_by FROM product p INNER JOIN product_from_cate pfc ON p.id = pfc.prod_id" +
                                " WHERE p.prod_status = 1 AND pfc.cate_id = ?")
                        .bind(0, id)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public List<ProductSale> getListSale() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT DISTINCT p.promo_id, p.product_id, p.name_prom, p.desc_prom, p.discount_rate," +
                                " p.start_date, p.end_date FROM promotion p" +
                                " WHERE p.end_date > DATE(NOW())")
                        .mapToBean(ProductSale.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public ArrayList<Product> getListProduct() {
        return (ArrayList<Product>) listProduct;
    }

    public void setListProduct(ArrayList<Product> listProduct) {
        this.listProduct = listProduct;
    }

    public Product getProductAndDetails(String id) {
        Product product = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT DISTINCT p.id, p.prod_name, p.prod_desc, p.prod_status, p.main_img_link," +
                                " p.price, p.released_date, p.released_by, p.quantity, p.warranty_day, p.view_count," +
                                " p.updated_date, p.updated_by FROM product p " +
                                " WHERE p.prod_status = 1 AND p.id =?")
                        .bind(0, id)
                        .mapToBean(Product.class)
                        .first()
        );

        List<ProductColor> colors = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT c.prod_id, c.color_name FROM color c Where c.prod_id =?")
                        .bind(0, id)
                        .mapToBean(ProductColor.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        List<ProductSize> sizes = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT c.prod_id, c.size_name FROM size c Where c.prod_id =?")
                        .bind(0, id)
                        .mapToBean(ProductSize.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        List<ProductImage> images = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT c.prod_id, c.prod_img_link FROM img_product c Where c.prod_id =?")
                        .bind(0, id)
                        .mapToBean(ProductImage.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        ProductSale sale = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT DISTINCT p.promo_id, p.product_id, p.name_prom, p.desc_prom, p.discount_rate," +
                                " p.start_date, p.end_date FROM promotion p" +
                                " WHERE p.end_date > DATE(NOW()) AND p.product_id = ?")
                        .bind(0, id)
                        .mapToBean(ProductSale.class)
                        .first()
        );
        List<Category> categories = new CategoryDAO().getCategoryByIdProduct(id);
        product.setCategories(categories);
        product.setImages(images);
        product.setColors(colors);
        product.setSizes(sizes);
        product.setSales(sale);
        return product;
    }

    public static void main(String[] args) {
        System.out.println(new ProductDAO().getProductAndDetails("prod001"));
    }

}
