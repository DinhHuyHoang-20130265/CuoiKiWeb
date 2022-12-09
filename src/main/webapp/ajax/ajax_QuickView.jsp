<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductImage" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.category.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductSize" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductColor" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 12/5/2022
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Product productDetails = (Product) request.getAttribute("productDetails");%>
<%SiteUser user = (SiteUser) request.getSession().getAttribute("user");%>
<!-- Modal body -->
<div class="modal-body">
    <div class="row">
        <div class="col-6">
            <div class="mb-2 main-img-2">
                <img src="<%=productDetails.getMain_img_link()%>" alt="" id="img-main"
                     xoriginal="<%=productDetails.getMain_img_link()%>"/>
            </div>
            <ul class="all-img-2">
                <li class="img-item-2">
                    <img src="<%=productDetails.getMain_img_link()%>" alt="" onclick="changeImg('image0')"
                         id="image0"/>
                </li>
                <%int i = 1;%>
                <%for (ProductImage image : productDetails.getImages()) {%>
                <li class="img-item-2">
                    <img src="<%=image.getProd_img_link()%>" alt="" onclick="changeImg('image<%=i%>')"
                         id="image<%=i++%>"/>
                </li>
                <%}%>
            </ul>
        </div>
        <div class="col-6">
            <div class="info-product">
                <h3 class="product-name">
                    <a href="./ProductDetail.jsp?id=<%=productDetails.getId()%>" title=""><%=productDetails.getProd_name()%>
                    </a>
                </h3>
                <div class="status-product">Trạng thái:
                    <b><%=(productDetails.getQuantity() > 0) ? "Còn hàng" : "Hết Hàng!"%>
                    </b></div>
                <%
                    String cate = "";
                    for (Category category : productDetails.getCategories()) {
                        cate += category.getCate_name() + ", ";
                    }
                    cate = cate.substring(0, cate.length() - 2);
                %>
                <div class="infor-oder">Loại sản phẩm: <b><%=cate%></b></div>
                <div class="price-product">
                    <%NumberFormat formatter = NumberFormat.getInstance(new Locale("vn", "VN"));%>
                    <%if(productDetails.getSales() != null) {%>
                    <div class="special-price">
                        <span><%=formatter.format(productDetails.getPrice() * (1 - (productDetails.getSales().getDiscount_rate()) * 0.01))%>đ</span>
                    </div>
                    <div class="price-old">
                        Giá gốc:
                        <del><%=formatter.format(productDetails.getPrice())%>đ</del>
                        <span class="discount">(-<%=productDetails.getSales().getDiscount_rate()%>%)</span>
                    </div>
                    <%} else {%>
                    <div class="special-price">
                        <span><%=formatter.format(productDetails.getPrice())%>đ</span>
                    </div>
                    <div class="price-old" style="opacity: 0;">
                        <del>0</del>
                        <span class="discount">0</span>
                    </div>
                    <%}%>
                </div>
                <div class="product-description">
                    <%=productDetails.getProd_desc()%>
                </div>
                <div class="product__color d-flex" style="align-items: center">
                    <div class="title" style="font-size: 16px; margin-right: 10px">
                        Màu:
                    </div>
                    <div class="select-swap d-flex">
                        <%for (ProductColor color : productDetails.getColors()) {%>
                        <div class="circlecheck">
                            <input type="radio" id="<%=color.getColor_name()%>-option" class="circle-<%=color.getColor_name()%>" name="selector"/>
                            <label for="<%=color.getColor_name()%>-option"></label>
                            <div class="outer-circle"></div>
                        </div>
                        <%}%>
                        <div class="circlecheck" style="opacity: 0;">
                            <input type="radio" id="-option" class="circle-" name="selector"/>
                            <label for="-option">0</label>
                            <div class="outer-circle">0</div>
                        </div>
                    </div>
                </div>
                <div class="product__size d-flex" style="align-items: center">
                    <div class="title" style="font-size: 16px; margin-right: 10px">
                        Kích thước:
                    </div>
                    <div class="select-swap">
                        <%for (ProductSize size : productDetails.getSizes()) {%>
                        <div class="swatch-element" data-value="<%=size.getSize_name()%>">
                            <input type="radio" class="variant-1" id="swatch-1-<%=size.getSize_name()%>" name="mau" value="<%=size.getSize_name()%>"
                                   onclick="check()"/>
                            <label for="swatch-1-<%=size.getSize_name()%>" class="sd"><span><%=size.getSize_name()%></span></label>
                        </div>
                        <%}%>
                        <div class="swatch-element" data-value="" style="opacity: 0">
                            <input type="radio" class="variant-1" id="swatch-1" name="mau"/>
                            <label for="swatch-1" class="sd"><span>0</span></label>
                        </div>
                    </div>
                </div>
                <div class="product__wrap">
                    <div class="product__amount">
                        <label>Số lượng: </label>
                        <input type="button" value="-" class="control" onclick="tru(10)"/>
                        <input type="text" value="1" class="text-input" id="text_so_luong-10"/>
                        <input type="button" value="+" class="control" onclick="cong(10)"/>
                    </div>
                </div>
                <div class="product__shopnow">
                    <%if (user != null) {%>
                        <%if (productDetails.getQuantity() > 0) {%>
                         <button class="shopnow2" id="addCart<%=productDetails.getId()%>">Thêm vào giỏ hàng</button>
                        <%} else {%>
                        <a class="notify" style="color: red; font-size: 16px; font-weight: 600;">Hết hàng !</a>
                        <%}%>
                    <%} else {%>
                    <a href="Login.jsp" class="notify" style="color: black; font-size: 16px; font-weight: 600;">Đăng nhập để thêm sản phẩm vào giỏ hàng</a>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>
<button class="btn-default btn-close" data-dismiss="modal">
    <i class="fas fa-times-circle"></i>
</button>
