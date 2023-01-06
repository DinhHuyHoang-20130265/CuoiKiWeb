package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.CategoryDAO;
import vn.edu.hcmuaf.fit.beans.category.Category;

import javax.servlet.jsp.JspWriter;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {
    private static CategoryService categoryService;

    public static CategoryService getInstance() {
        if (categoryService == null) {
            categoryService = new CategoryService();
        }
        return categoryService;
    }

    public List<Category> getAllCate() {
        CategoryDAO DAO = new CategoryDAO();
        return DAO.loadAll();
    }

    public List<Category> getChildCate(String id) {
        CategoryDAO DAO = new CategoryDAO();
        return DAO.getChildCategory(id);
    }

    public void CreateCategoryMenu(JspWriter writer) {
        try {
            int i = 1;
            CategoryDAO DAO = new CategoryDAO();
            for (Category cate : DAO.loadAll()) {
                i++;
                // Nếu parent_id=null, tức là tất cả menu cha
                if (cate.getParent_id() == null) {
                    writer.println(" <li class=\"ng-scope ng-has-child2\">");
                    //In tất cả menu cha cấp 0 (parent_id=0)
                    if (DAO.getChildCategory(cate.getId()).isEmpty()) {
                        writer.println("<a href='Product.jsp?category=" + cate.getId() + "'>" + cate.getCate_name() + "</a>");
                    } else {
                        writer.println("<a href='Product.jsp?category=" + cate.getId() + "'>" + cate.getCate_name() + "<i class=\"fas fa-plus cong" + i + "\" onclick=\"hienthi(" + i + ",'abc" + i + "')\"></i>\n" + "<i class=\"fas fa-minus tru" + i + " hidden\" onclick=\"hienthi(" + i + ",'abc" + i + "')\"></i>" + "</a>");
                        CreateChildMenu(cate.getId(), writer, i);
                        i++;
                    }
                }
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void CreateChildMenu(String id, JspWriter writer, int i) {
        try {
            List<String> idChildMenu = new ArrayList();
            List<String> nameChildMenu = new ArrayList();
            CategoryDAO DAO = new CategoryDAO();
            for (Category child : DAO.getChildCategory(id)) {
                if (child.getParent_id().equals(id)) {
                    idChildMenu.add(child.getId());
                    nameChildMenu.add(child.getCate_name());
                }
            }
            if (idChildMenu.size() > 0)//Nếu tồn tại menu con với parent_id=parentId
            {
                writer.println("<ul class=\"ul-has-child2 hidden\" id=\"abc" + i + "\">"); //Bắt đầu một phân cấp với thẻ <ul>
                for (int j = 0; j < idChildMenu.size(); j++) {
                    writer.println("<li class=\"ng-scope ng-has-child2\">"); //Bắt đầu một dòng menu con với thẻ <li>
                    if (DAO.getChildCategory(idChildMenu.get(j)).isEmpty()) {
                        writer.println("<a href='Product.jsp?category=" + idChildMenu.get(j) + "'>" + nameChildMenu.get(j) + "</a>");
                    } else {
                        //Đệ quy, gọi lại chính hàm CreateChildMenu với tham số là idChildMenu hiện tại.
                        i++;
                        writer.println("<a href='Product.jsp?category=" + idChildMenu.get(j) + "'>" + nameChildMenu.get(j) + "<i class=\"fas fa-plus cong" + i + "\" onclick=\"hienthi(" + i + ",'abc" + i + "')\"></i>\n" + "<i class=\"fas fa-minus tru" + i + " hidden\" onclick=\"hienthi(" + i + ",'abc" + i + "')\"></i>" + "</a>");
                        CreateChildMenu(idChildMenu.get(j), writer, i);
                        i++;
                    }
                }
                writer.println("</ul>"); //Kết thúc một phân cấp với thẻ </ul>
            } else {
                //Ngược lại, nếu không tồn tại menu con thì dùng thẻ đóng </li> để hoàn thành một cấp menu hiện tại.
                writer.println("</li>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void CreateCategoryMenuNotMobile(JspWriter writer) {
        try {
            CategoryDAO DAO = new CategoryDAO();
            for (Category cate : DAO.loadAll()) {
                int i = 1;
                // Nếu parent_id=null, tức là tất cả menu cha
                if (cate.getParent_id() == null) {
                    writer.println("<li class=\"level" + i + "\">");
                    //In tất cả menu cha cấp 0 (parent_id=0)
                    writer.println("<a class=\"hmega\" href=\"Product.jsp?category=" + cate.getId() + "\">" + cate.getCate_name() + "</a>");
                    CreateChildMenuNotMobile(cate.getId(), writer, i);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void CreateChildMenuNotMobile(String id, JspWriter writer, int i) {
        try {
            List<String> idChildMenu = new ArrayList();
            List<String> nameChildMenu = new ArrayList();
            CategoryDAO DAO = new CategoryDAO();
            for (Category child : DAO.getChildCategory(id)) {
                if (child.getParent_id().equals(id)) {
                    idChildMenu.add(child.getId());
                    nameChildMenu.add(child.getCate_name());
                }
            }
            if (idChildMenu.size() > 0)//Nếu tồn tại menu con với parent_id=parentId
            {
                writer.println(" <ul class=\"level" + i + "\">"); //Bắt đầu một phân cấp với thẻ <ul>
                i++;
                for (int j = 0; j < idChildMenu.size(); j++) {
                    writer.println("<li class=\"level" + i + "\">"); //Bắt đầu một dòng menu con với thẻ <li>
                    writer.println("<a class=\"hmega\" href=\"Product.jsp?category=" + idChildMenu.get(j) + "\" style=\" font-weight: 400;\">" + nameChildMenu.get(j) + "</a>");
                    CreateChildMenuNotMobile(idChildMenu.get(j), writer, i);
                }
                writer.println("</ul>"); //Kết thúc một phân cấp với thẻ </ul>
            } else {
                //Ngược lại, nếu không tồn tại menu con thì dùng thẻ đóng </li> để hoàn thành một cấp menu hiện tại.
                writer.println("</li>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Category getCateWithID(String category) {
        return new CategoryDAO().getCateWithID(category);
    }
    public List<Category> loadloadCategoryWithConditionContainsStatus(int page, int num_per_page, String search) {
        return new CategoryDAO().loadCategoryWithConditionContainsStatus(page, num_per_page, search);
    }

    public static void main(String[] args) {
    }

    public List<Category> getCateWithProductID(String id) {
        return new CategoryDAO().getCategoryByIdProduct(id);
    }
}
