package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.product.ProductColor;
import vn.edu.hcmuaf.fit.beans.product.ProductImage;
import vn.edu.hcmuaf.fit.beans.product.ProductSale;
import vn.edu.hcmuaf.fit.beans.product.ProductSize;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class ProductPropertiesDAO {
    public List<ProductColor> getColorList(String id) {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT id, color_name FROM color WHERE prod_id = ?")
                        .bind(0, id)
                        .mapToBean(ProductColor.class)
                        .stream()
                        .collect(Collectors.toList()));
    }

    public List<ProductSize> getSizeList(String id) {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT id, size_name FROM color WHERE prod_id = ?")
                        .bind(0, id)
                        .mapToBean(ProductSize.class)
                        .stream()
                        .collect(Collectors.toList()));
    }

    public List<ProductImage> getImageList(String id) {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT prod_img_link FROM img_product WHERE prod_id = ?")
                        .bind(0, id)
                        .mapToBean(ProductImage.class)
                        .stream()
                        .collect(Collectors.toList()));
    }

    public List<ProductSale> getSaleList(String id) {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT promo_id, product_id, name_prom, desc_prom, discount_rate, start_date, end_date " +
                                "FROM promotion WHERE product_id = ?")
                        .bind(0, id)
                        .mapToBean(ProductSale.class)
                        .stream()
                        .collect(Collectors.toList()));
    }

    public static void main(String[] args) {
        System.out.println(new ProductPropertiesDAO().getSaleList("pd1"));
    }
}
