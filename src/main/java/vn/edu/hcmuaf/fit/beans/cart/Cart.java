package vn.edu.hcmuaf.fit.beans.cart;

import vn.edu.hcmuaf.fit.beans.product.Product;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class Cart implements Serializable {
    HashMap<CartKey, Product> data;
    public Cart() { this.data = new HashMap<>(); }

    public Product get(CartKey item) {
        return data.get(item);
    }

    public int put(CartKey item, Product p) {
        int quantity = p.getQuantity_cart();
        if(data.containsKey(item)) {
            quantity = p.getQuantity_cart() + 1;
        }
        else {
            data.put(item, p);
        }
        return data.get(item).getQuantity_cart();
    }
    public boolean remove(CartKey item) {
        return data.remove(item) == null;
    }
    public double total() {
        double sum = 0;
        for(Product p:data.values()) {
            sum += (p.getQuantity() * p.getPrice());
        }
        return sum;
    }

    public Collection<Product> list() {
        return data.values();
    }
}
