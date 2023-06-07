package vn.edu.hcmuaf.fit.IndexController;

import vn.edu.hcmuaf.fit.DAO.ProductDAO;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "LoadHistoryController", value = "/LoadHistoryController")
public class LoadHistoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String listHistoryParam = request.getParameter("list_history");
        String id_prod = request.getParameter("id_prod");
        List<String> history;
        if (listHistoryParam != null && !listHistoryParam.isEmpty()) {
            history = new ArrayList<>(Collections.singletonList(listHistoryParam));
        } else {
            history = new ArrayList<>();
        }
        if (!history.contains(id_prod)) {
            history.add(0, id_prod);
        }
        request.setAttribute("history", history);
        request.getRequestDispatcher("ajax/ajax_loadHistory.jsp").forward(request, response);
    }
}
