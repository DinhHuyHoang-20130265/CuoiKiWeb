<%@ page import="vn.edu.hcmuaf.fit.beans.order.OrderDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.order.Order" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/6/2023
  Time: 12:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<OrderDetail> list = (List<OrderDetail>) request.getAttribute("list");
    NumberFormat formatter = NumberFormat.getInstance(new Locale("vn", "VN"));
    Order order = (Order) request.getAttribute("order");
    if (list != null) {
%>
<div class="modal-body" style="margin-top:10px">
    <div class="body-one">
        <div>Tổng tiền: <p><%=formatter.format(order.getTotal())%> đ</p></div>
        <div>Phí ship:<p>30.000 đ</p></div>
        <div>Thành Tiền: <p><%=formatter.format(order.getTotal() + 30000)%> đ</p></div>
    </div>
    <form action="">
        <div class="my-order-heading">
            <div class="row" style="text-align:center">
                <div class="col-4">Sản phẩm</div>
                <div class="col-1">SL</div>
                <div class="col-3">Giá</div>
                <div class="col-1">Giảm</div>
                <div class="col-3">Tổng</div>
            </div>
        </div>
        <%
            for (OrderDetail orderDetail : list) {
                Product product = ProductService.getInstance().getProductAndDetails(orderDetail.getProd_id());
        %>
        <div class="body-two">
            <div class="row" style="text-align:center; margin-top:10px">
                <div class="col-4" style="display: flex;">
                    <a href=""><img src="<%=product.getMain_img_link()%>" alt=""
                                    style="width: 50px;height: 70px;margin-right: 5px;"></a>
                    <h5><%=product.getProd_name()%> - <%=orderDetail.getProd_color()%>
                        - <%=orderDetail.getProd_size()%>
                    </h5>
                </div>
                <div class="col-1"><%=orderDetail.getQuantity()%>
                </div>
                <div class="col-3"><%=formatter.format(product.getPrice())%>
                </div>
                <%
                    if (product.getSales() != null) { %>
                <div class="col-1"><%=product.getSales().getDiscount_rate()%>%</div>
                <div class="col-3"><%=formatter.format(product.getPrice() * (100 - product.getSales().getDiscount_rate()) * 0.01 * orderDetail.getQuantity())%>
                </div>
                <% } else { %>
                <div class="col-1">0%</div>
                <div class="col-3"><%=formatter.format(product.getPrice() * orderDetail.getQuantity())%>
                </div>
                <%}%>
            </div>
        </div>
        <% }%>
    </form>
</div>
<% } %>