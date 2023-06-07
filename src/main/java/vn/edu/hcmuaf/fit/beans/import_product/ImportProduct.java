package vn.edu.hcmuaf.fit.beans.import_product;

import java.io.Serializable;
import java.util.Date;

public class ImportProduct implements Serializable {
    String id;
    String id_prod;
    String prod_name;
    int quantity;
    String import_by;
    Date date_import;
    public ImportProduct() {
    }

    public ImportProduct(String id, String id_prod, String prod_name, int quantity, String import_by, Date date_import) {
        this.id = id;
        this.id_prod = id_prod;
        this.prod_name = prod_name;
        this.quantity = quantity;
        this.import_by = import_by;
        this.date_import = date_import;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId_prod() {
        return id_prod;
    }

    public void setId_prod(String id_prod) {
        this.id_prod = id_prod;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImport_by() {
        return import_by;
    }

    public void setImport_by(String import_by) {
        this.import_by = import_by;
    }

    public Date getDate_import() {
        return date_import;
    }

    public void setDate_import(Date date_import) {
        this.date_import = date_import;
    }

    @Override
    public String toString() {
        return "ImportProduct{" +
                "id='" + id + '\'' +
                ", id_prod='" + id_prod + '\'' +
                ", prod_name='" + prod_name + '\'' +
                ", quantity=" + quantity +
                ", import_by='" + import_by + '\'' +
                ", date_import=" + date_import +
                '}';
    }
}
