<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/12/2022
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Product> products =  (List<Product>) request.getAttribute("productSearch");%>
<%NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<%for (Product p : products) {%>
<li class="product_suggest">
    <a href="ProductDetail.jsp?id=<%=p.getId()%>">
        <div class="item-img">
            <img src="<%=p.getMain_img_link()%>" alt="">
        </div>
        <div class="item-info">
            <h3 style="width: 175px; margin-bottom: 0px !important;">
                <%=p.getProd_name()%>
            </h3>
            <% if (p.getSales() != null){%>
            <strong class="price" style="width: 145px; text-align: center;"><%=format.format(p.getPrice() * 0.01 * (100 - p.getSales().getDiscount_rate()))%>đ</strong>
            <div class="box-p">
                <p class="price-old" style="color: red;margin: 0 !important;"><%=format.format(p.getPrice())%>₫</p>
                <span class="percent">(-<%=p.getSales().getDiscount_rate()%>%)</span>
            </div>
            <%} else {%>
            <strong class="price" style="width: 145px; text-align: center;"><%=format.format(p.getPrice())%>đ</strong>
            <div class="box-p">
                <p class="price-old" style="color: red;margin: 0 !important; opacity: 0">0</p>
                <span class="percent" style="opacity: 0">(-0%)</span>
            </div>
            <%}%>
        </div>
    </a>
</li>
<%}%>