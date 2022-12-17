package vn.edu.hcmuaf.fit.beans.product;

import vn.edu.hcmuaf.fit.beans.category.Category;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Product implements Serializable {
    private String id;
    private String prod_name;
    private String prod_desc;

    private String content;
    private Byte prod_status;
    private String main_img_link;
    private double price;
    private Date released_date;
    private String released_by;
    private int quantity;
    private int warranty_day;
    private int view_count;
    private Date updated_date;
    private String updated_by;
    private List<ProductColor> colors;
    private List<ProductSize> sizes;
    private List<ProductImage> images;
    private ProductSale sales;
    private List<Category> categories;
    private int quantity_cart;
    private int quantity_wishlist;

    public Product() {
    }

    public Product(String id, String prod_name, String prod_desc, String content, Byte prod_status, String main_img_link, double price, Date released_date) {

        this.id = id;
        this.prod_name = prod_name;
        this.prod_desc = prod_desc;
        this.content = content;
        this.prod_status = prod_status;
        this.main_img_link = main_img_link;
        this.price = price;
        this.released_date = released_date;
        this.released_by = released_by;
        this.quantity = quantity;
        this.warranty_day = warranty_day;
        this.view_count = view_count;
        this.updated_date = updated_date;
        this.updated_by = updated_by;
        this.colors = colors;
        this.sizes = sizes;
        this.images = images;
        this.sales = sales;
        this.categories = categories;
        this.quantity_cart = quantity_cart;
        this.quantity_wishlist = quantity_wishlist;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public String getProd_desc() {
        return prod_desc;
    }

    public void setProd_desc(String prod_desc) {
        this.prod_desc = prod_desc;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Byte getProd_status() {
        return prod_status;
    }

    public void setProd_status(Byte prod_status) {
        this.prod_status = prod_status;
    }

    public String getMain_img_link() {
        return main_img_link;
    }

    public void setMain_img_link(String main_img_link) {
        this.main_img_link = main_img_link;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getReleased_date() {
        return released_date;
    }

    public void setReleased_date(Date released_date) {
        this.released_date = released_date;
    }

    public String getReleased_by() {
        return released_by;
    }

    public void setReleased_by(String released_by) {
        this.released_by = released_by;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getWarranty_day() {
        return warranty_day;
    }

    public void setWarranty_day(int warranty_day) {
        this.warranty_day = warranty_day;
    }

    public int getView_count() {
        return view_count;
    }

    public void setView_count(int view_count) {
        this.view_count = view_count;
    }

    public Date getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(Date updated_date) {
        this.updated_date = updated_date;
    }

    public String getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(String updated_by) {
        this.updated_by = updated_by;
    }

    public List<ProductColor> getColors() {
        return colors;
    }

    public void setColors(List<ProductColor> colors) {
        this.colors = colors;
    }

    public List<ProductSize> getSizes() {
        return sizes;
    }

    public void setSizes(List<ProductSize> sizes) {
        this.sizes = sizes;
    }

    public List<ProductImage> getImages() {
        return images;
    }

    public void setImages(List<ProductImage> images) {
        this.images = images;
    }

    public ProductSale getSales() {
        return sales;
    }

    public void setSales(ProductSale sales) {
        this.sales = sales;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public int getQuantity_cart() {
        return quantity_cart;
    }

    public void setQuantity_cart(int quantity_cart) {
        this.quantity_cart = quantity_cart;
    }

    public int getQuantity_wishlist() {
        return quantity_wishlist;
    }

    public void setQuantity_wishlist(int quantity_wishlist) {
        this.quantity_wishlist = quantity_wishlist;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", prod_name='" + prod_name + '\'' +
                ", prod_desc='" + prod_desc + '\'' +
                ", content='" + content + '\'' +
                ", prod_status=" + prod_status +
                ", main_img_link='" + main_img_link + '\'' +
                ", price=" + price +
                ", released_date=" + released_date +
                ", released_by='" + released_by + '\'' +
                ", quantity=" + quantity +
                ", warranty_day=" + warranty_day +
                ", view_count=" + view_count +
                ", updated_date=" + updated_date +
                ", updated_by='" + updated_by + '\'' +
                ", colors=" + colors +
                ", sizes=" + sizes +
                ", images=" + images +
                ", sales=" + sales +
                ", categories=" + categories +
                ", quantity_cart=" + quantity_cart +
                ", quantity_wishlist=" + quantity_wishlist +
                '}';
    }

}
