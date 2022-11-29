package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.product.Product;
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
        listProduct = (ArrayList<Product>) JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product WHERE prod_status = 1")
                    .mapToBean(Product.class)
                    .stream()
                    .collect(Collectors.toList());
        });
    }

    public void loadProduct(int page, int num_per_page, String order_by, String category, String color
            , double[] price, String size, String search) {
        String query = "SELECT DISTINCT p.id, p.prod_name, p.prod_desc, p.prod_status, p.main_img_link," +
                " p.price, p.released_date, p.released_by, p.quantity, p.warranty_day, p.view_count," +
                " p.updated_date, p.updated_by FROM product p INNER JOIN varitation v ON p.id = v.prod_id" +
                " INNER JOIN color c ON c.prod_id = p.id INNER JOIN size s ON p.id = s.prod_id" +
                " INNER JOIN product_from_cate pfc ON pfc.prod_id = p.id" +
                " INNER JOIN product_categories pc ON pfc.cate_id = pc.id" +
                " WHERE p.prod_status = 1";
        if (!category.equals("")) {
            query += " AND pc.name_category = ?";
        }
        if (!color.equals("")) {
            query += " AND v.var_name = 'color' AND vl.vari_value = ?";
        }
        if (price.length == 2) {
            query += " AND p.price >= ? AND p.price <= ?";
        }
        if (!size.equals("")) {
            query += " AND v.var_name = 'size' AND vl.vari_value = ?";
        }
        if (!search.equals("")) {
            query += " AND p.prod_name LIKE '%'?'%'";
        }
        if (!order_by.equals("")) {
            switch (order_by) {
                case "0":
                    query += " ORDER BY p.view_count DESC";
                    break;
                case "1":
                    query += " ORDER BY p.price ASC";
                    break;
                case "2":
                    query += " ORDER BY p.price DESC";
                    break;
                case "3":
                    query += " ORDER BY p.prod_name ASC";
                    break;
                case "4":
                    query += " ORDER BY p.prod_name DESC";
                    break;
                case "5":
                    query += " ORDER BY p.released_date DESC";
                    break;
                case "6":
                    query += " ORDER BY p.released_date ASC";
                    break;
                case "7":
                    query += " ORDER BY p.quantity ASC";
                    break;
            }
        }
        String finalQuery = query;
        listProduct = (ArrayList<Product>) JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery(finalQuery)
                    .bind(0, category)
                    .bind(1, color)
                    .bind(2, price[0])
                    .bind(3, price[1])
                    .bind(4, size)
                    .bind(5, search)
                    .mapToBean(Product.class)
                    .stream()
                    .collect(Collectors.toList());
        });
        int numpage = 0;
        if (listProduct.size() % num_per_page != 0) {
            numpage = ((int) (listProduct.size() / num_per_page) + 1);
        } else {
            numpage = (listProduct.size() / num_per_page);
        }
        int start = (page - 1) * num_per_page;
        List<Product> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(listProduct.get(i));
        }
        listProduct = (ArrayList<Product>) temp;
        System.out.println(listProduct);
    }

    public ArrayList<Product> getListProduct() {
        return (ArrayList<Product>) listProduct;
    }

    public void setListProduct(ArrayList<Product> listProduct) {
        this.listProduct = listProduct;
    }

    public static void main(String[] args) {
        new ProductDAO().loadProduct(2, 6, "2", "donam", "red", new double[]{260000, 420000}, "XL", "polo");
    }
}
