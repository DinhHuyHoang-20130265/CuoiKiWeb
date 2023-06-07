package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.beans.category.Category;
import vn.edu.hcmuaf.fit.beans.import_product.ImportProduct;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class ImportProductDAO {
    private String generateIdImport() {
        List<String> id = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT id FROM user_account").mapTo(String.class).stream().collect(Collectors.toList()));
        String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String alphaNumeric = upperAlphabet + lowerAlphabet + numbers;
        StringBuilder sb = new StringBuilder();
        // create an object of Random class
        Random random = new Random();
        // specify length of random string
        int length = 10;
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(alphaNumeric.length());
            char randomChar = alphaNumeric.charAt(index);
            sb.append(randomChar);
        }
        if (id.contains(sb.toString())) return generateIdImport();
        else return sb.toString();
    }

    public String insertImport(String idProduct, String prodName, String quantity, String id_admin) {
        String id = generateIdImport();
        String date = java.time.LocalDate.now().toString();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("insert into import_product (id , id_prod, prod_name, quantity , import_by, date_import) " +
                            "values (?,?,?,?,?,?)")
                    .bind(0, id)
                    .bind(1, idProduct)
                    .bind(2, prodName)
                    .bind(3, quantity)
                    .bind(4, id_admin)
                    .bind(5, date)
                    .execute();
            return true;
        });
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update product set quantity=quantity + ? where id = ?")
                    .bind(0, quantity)
                    .bind(1, idProduct)
                    .execute();
            return true;
        });
        return id;
    }

    public List<ImportProduct> getListImport() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select id, id_prod, prod_name, quantity, import_by, date_import from `import_product` order by date_import desc")
                    .mapToBean(ImportProduct.class).stream().collect(Collectors.toList());
        });
    }

    public List<ImportProduct> loadImportWithConditionContainsStatus(int page, int num_per_page) {
        String query = "SELECT id, id_prod, prod_name, quantity, import_by, date_import FROM import_product";
        List<ImportProduct> filter = (List<ImportProduct>) JDBIConnector.get().withHandle(handle -> handle.createQuery(query).mapToBean(ImportProduct.class).stream().collect(Collectors.toList()));
        int numpage;
        int start = (page - 1) * num_per_page;
        if (filter.size() - start >= num_per_page) {
            numpage = start + num_per_page;
        } else {
            numpage = filter.size();
        }
        List<ImportProduct> temp = new ArrayList<>();
        for (int i = start; i < numpage; i++) {
            temp.add(filter.get(i));
        }
        return temp;
    }

    public void removeImport(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM import_product WHERE id = ?")
                            .bind(0, id)
                            .execute();
                    return true;
                }
        );
    }

    public boolean checkIdProduct(String idProduct) {
        List<String> listId = JDBIConnector.get().withHandle(
                handle -> handle.createQuery("SELECT id FROM product")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(idProduct)) return true;
        else return false;
    }

    public static void main(String[] args) {
        System.out.println(new ImportProductDAO().insertImport("prod001", "Áo len sọc lớn màu", "10", "user2"));
    }
}
