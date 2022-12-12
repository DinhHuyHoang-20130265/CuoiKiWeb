<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/12/2022
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Product> next6Product = (List<Product>) request.getAttribute("next6ProductSearch");%>
<%NumberFormat formatter = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<% for (Product p : next6Product) {%>
<div class="col-lg-4 col-md-6 col-12 mb-20"
     style="margin-bottom: 20px;">
  <a href="./ProductDetail.jsp?id=<%=p.getId()%>" class="product__new-item">
    <div class="card" style="width: 100%">
      <div>
        <img class="card-img-top" src="<%=p.getMain_img_link()%>" alt="Card image cap">
      </div>
      <div class="card-body">
        <h5 class="card-title custom__name-product">
          <%=p.getProd_name()%>
        </h5>
        <div class="product__price">
          <%if (p.getSales() != null) {%>
          <p class="card-text price-color product__price-old"><%=p.getPrice()%>đ</p>
          <p class="card-text price-color product__price-new"><%=formatter.format(p.getPrice() * (1 - (p.getSales().getDiscount_rate()) * 0.01))%>
            đ</p>
          <%} else {%>
          <p class="card-text price-color product__price-old" style="opacity: 0">0</p>
          <p class="card-text price-color product__price-new"><%=formatter.format(p.getPrice())%>đ</p>
          <%}%>
        </div>
        <div class="home-product-item__action">
                            <span class="home-product-item__like home-product-item__like--liked">
                                <i class="home-product-item__like-icon-empty far fa-heart"></i>
                                <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                            </span>
          <div class="home-product-item__rating">
            <i class="home-product-item__star--gold fas fa-star"></i>
            <i class="home-product-item__star--gold fas fa-star"></i>
            <i class="home-product-item__star--gold fas fa-star"></i>
            <i class="home-product-item__star--gold fas fa-star"></i>
            <i class="fas fa-star"></i>
          </div>
          <span class="home-product-item__sold"><%= p.getView_count()%> Lượt xem</span>
        </div>
        <%if (p.getSales() != null) {%>
        <div class="sale-off">
          <span class="sale-off-percent"><%=p.getSales().getDiscount_rate()%>%</span>
          <span class="sale-off-label">GIẢM</span>
        </div>
        <%}%>
      </div>
    </div>
  </a>
</div>
<%}%>
