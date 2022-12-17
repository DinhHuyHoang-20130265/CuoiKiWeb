package vn.edu.hcmuaf.fit.beans.wishlist;

import vn.edu.hcmuaf.fit.beans.product.Product;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class WishList implements Serializable {
    HashMap<String, Product> data;

    public WishList() {
        this.data = new HashMap<>();
    }

    public Product get(String id) {
        return data.get(id);
    }

    public void put(Product p) {
        data.put(p.getId(), p);
    }

    public boolean remove(String id) {
        return data.remove(id) == null;
    }
    public int getQuantity() {
        return data.keySet().size();
    }

    public Collection<Product> list() {
        return data.values();
    }

    public HashMap<String, Product> getData() {
        return data;
    }

    public static void main(String[] args) {
        WishList wishList = new WishList();
        wishList.put(new Product());
        wishList.put( new Product());
        wishList.put(new Product());
        wishList.put(new Product());
        System.out.print(wishList.getQuantity());
    }
}
