package vn.edu.hcmuaf.fit.beans.cart;

import java.util.Objects;

public class CartKey {
    String id;
    String color;
    String size;

    public CartKey(String id, String color, String size) {
        this.id = id;
        this.color = color;
        this.size = size;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "CartKey{" +
                "id='" + id + '\'' +
                ", color='" + color + '\'' +
                ", size='" + size + '\'' +
                '}';
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getColor(), getSize());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return id.equals(((CartKey) o).id) && color.equals(((CartKey) o).color) && size.equals(((CartKey) o).size);
    }

}
