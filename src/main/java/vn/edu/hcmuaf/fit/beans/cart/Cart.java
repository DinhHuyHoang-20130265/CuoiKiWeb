package vn.edu.hcmuaf.fit.beans.cart;

import vn.edu.hcmuaf.fit.beans.product.Product;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart implements Serializable {
    HashMap<CartKey, Product> data;

    public Cart() {
        this.data = new HashMap<>();
    }

    public Product get(CartKey item) {
        return data.get(item);
    }

    public int put(CartKey item, Product p) {
        if (data.containsKey(item)) {
            Product temp = data.get(item);
            temp.setQuantity_cart(temp.getQuantity_cart() + p.getQuantity_cart());
            data.put(item, temp);
        } else {
            data.put(item, p);
        }
        return data.get(item).getQuantity_cart();
    }

    public boolean remove(CartKey item) {
        return data.remove(item) == null;
    }

    public int getQuantity_cart() {
        int count = 0;
        for (CartKey key : data.keySet()) {
            count += data.get(key).getQuantity_cart();
        }
        return count;
    }

    public double total() {
        double sum = 0;
        for (Product p : data.values()) {
            if (p.getSales() != null)
                sum += (p.getQuantity_cart() * (p.getPrice() * 0.01 * (100 - p.getSales().getDiscount_rate())));
            else {
                sum += (p.getQuantity_cart() * p.getPrice());
            }
        }
        return sum;
    }

    public Collection<Product> list() {
        return data.values();
    }

    public HashMap<CartKey, Product> getData() {
        return data;
    }

    public static void main(String[] args) {
        Cart cart = new Cart();
        cart.put(new CartKey("prod001", "red", "XL"), new Product());
        cart.put(new CartKey("prod001", "red", "XL"), new Product());
        System.out.print(cart.list());
    }
}
