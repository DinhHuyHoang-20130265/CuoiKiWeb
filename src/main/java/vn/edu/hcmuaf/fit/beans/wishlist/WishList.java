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

    public int put(Product p) {
        if (!data.containsKey(p.getId())) {
            p.setQuantity_wishlist(p.getQuantity_wishlist() + 1);
            data.put(p.getId(), p);
        } else {
            p.setQuantity_wishlist(p.getQuantity_wishlist());
        }
        return data.get(p.getId()).getQuantity_wishlist();
    }

    public int getQuantity_wishlist() {
        int count = 0;
        for (String id : data.keySet()) {
            count += data.get(id).getQuantity_wishlist();
        }
        return count;
    }

    public boolean remove(String id) {
        return data.remove(id) == null;
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
        wishList.put(new Product());
        wishList.put(new Product());
        wishList.put(new Product());
        System.out.print(wishList.list());
    }
}
