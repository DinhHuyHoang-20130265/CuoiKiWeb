package vn.edu.hcmuaf.fit.APIController;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.beans.Transport;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Register", value = "/API/Register")
public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String access_token = request.getParameter("access_token");
        String provinceCode = request.getParameter("provinceCode");
        Transport result = api.getInstance().registerTransport(access_token, (String) request.getSession().getAttribute("district"), (String) request.getSession().getAttribute("ward"));
        String ord_id_return = (String) request.getSession().getAttribute("ord_id_return");
        OrderService.getInstance().setID_transport(ord_id_return, result.getId());
    }
}
