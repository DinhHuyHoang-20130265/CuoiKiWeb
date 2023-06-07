package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.services.ImportProductService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddImportController", value = "/AddImportController")
public class AddImportController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProd = request.getParameter("idProd");
        String quantity = request.getParameter("quantity");
        String id_admin = request.getParameter("id_admin");
        PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/html");

        if (ImportProductService.getInstance().checkIdProduct(idProd)){
            String productName = ProductService.getInstance().getProductHiddenAndDetails(idProd).getProd_name();
            ImportProductService.getInstance().insertImport(idProd, productName, quantity, id_admin);
            writer.write("Đã nhập hàng thành công sản phẩm "+ productName +" với số lượng "+quantity);
        }else {
            writer.write("Sản phẩm chưa có trong kho, vui lòng thêm sản phẩm sau đó quay lại nhập hàng!");
        }
    }
}
