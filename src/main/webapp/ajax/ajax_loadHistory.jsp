<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 6/4/2023
  Time: 12:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<String> history = (List<String>) request.getSession().getAttribute("listVisited");
    NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
%>
<% if (history != null && !history.isEmpty()) {%>
<div id="popup" class="popup">
    <span class="close">x</span>
    <div class="popup-content">
        <table>
            <tr>
                <th></th>
                <th>Tên sản phẩm</th>
                <th>Giá tiền</th>
                <th></th>
            </tr>
            <% for (String id : history) {
                Product seenProduct = new ProductService().getProductAndDetails(id);%>
            <tr>
                <td><img class="cart-img" src="<%=seenProduct.getMain_img_link()%>" alt="" style="width: 65px"></td>
                <td><%=seenProduct.getProd_name()%>
                </td>
                <td>
                    <%if (seenProduct.getSales() != null) { %>
                    <%=format.format(seenProduct.getPrice() * 0.01 * (100 - seenProduct.getSales().getDiscount_rate()))%>
                    đ
                    <%} else { %>
                    <%=format.format(seenProduct.getPrice())%>đ
                    <%}%>
                </td>
                <td>
                    <a href="ProductDetail.jsp?id=<%=seenProduct.getId()%>">
                        <button class="detail-button">Chi tiết</button>
                    </a>
                </td>
            </tr>
            <%}%>
        </table>
    </div>
</div>
<%} else { %>
<div id="popup" class="popup">
    <span class="close">x</span>
    <div class="popup-content">
        <p>Không có sản phẩm được xem gần đây.</p>
    </div>
</div>
<%}%>