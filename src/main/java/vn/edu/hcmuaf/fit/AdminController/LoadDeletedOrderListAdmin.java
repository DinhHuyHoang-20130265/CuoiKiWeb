package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadDeletedOrderListAdmin", value = "/LoadDeletedOrderListAdmin")
public class LoadDeletedOrderListAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /*
    Load more danh sách đơn hàng softdelêete trong admin - Đinh Huy Hoàng 20130265
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        String order = request.getParameter("order");
        List<Order> orderList = OrderService.getInstance().getDeletedOrderListCondition(page, order, search);
        request.setAttribute("Deletedorders", orderList);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadDeletedOrderListAdmin.jsp").forward(request, response);
    }
}
