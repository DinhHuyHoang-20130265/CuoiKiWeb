package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.ImportProductDAO;
import vn.edu.hcmuaf.fit.beans.import_product.ImportProduct;

import java.util.List;

public class ImportProductService {
    private static ImportProductService importProductService;

    public static ImportProductService getInstance() {
        if (importProductService == null) {
            importProductService = new ImportProductService();
        }
        return importProductService;
    }
    public  List<ImportProduct> getListImport() {
        return new ImportProductDAO().getListImport();
    }
    public List<ImportProduct> loadImportWithConditionContainsStatus(int page, int num_per_page) {
        return new ImportProductDAO().loadImportWithConditionContainsStatus(page, num_per_page);
    }
    public void removeImport(String id) {
        new ImportProductDAO().removeImport(id);
    }
    public boolean checkIdProduct(String idProduct) {
        return new ImportProductDAO().checkIdProduct(idProduct);
    }
    public String insertImport(String idProduct,String prodName, String quantity, String id_admin){
        return new ImportProductDAO().insertImport(idProduct, prodName, quantity, id_admin);
    }
}
