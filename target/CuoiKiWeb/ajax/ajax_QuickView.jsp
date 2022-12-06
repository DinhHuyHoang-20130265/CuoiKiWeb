<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductImage" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.category.Category" %><%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 12/5/2022
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Product productDetails = (Product) request.getAttribute("productDetails");%>
<!-- Modal body -->
<div class="modal-body">
    <div class="row">
        <div class="col-6">
            <div class="mb-2 main-img-2">
                <img src="<%=productDetails.getMain_img_link()%>" alt="" id="img-main"
                     xoriginal="<%=productDetails.getMain_img_link()%>"/>
            </div>
            <ul class="all-img-2">
                <%int i = 0;%>
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
                    <a href="#" title=""><%=productDetails.getProd_name()%>
                    </a>
                </h3>
                <div class="status-product">Trạng thái:
                    <b><%=productDetails.getQuantity() > 0 ? "Còn hàng" : "Hết Hàng!"%>
                    </b></div>
                <%
                    String cate = "";
                    for (Category category : productDetails.getCategories()) {
                        cate += category.getCate_name() + ", ";
                    }
                %>
                <div class="infor-oder">Loại sản phẩm: <b><%=cate%></b></div>
                <div class="price-product">
                    <%if(productDetails.getSales() != null) {%>
                    <div class="special-price">
                        <span><%=Math.round(productDetails.getPrice() * (1 - (productDetails.getSales().getDiscount_rate()) * 0.01))%>đ</span>
                    </div>
                    <div class="price-old">
                        Giá gốc:
                        <del><%=productDetails.getPrice()%>đ</del>
                        <span class="discount">(-<%=productDetails.getSales().getDiscount_rate()%>%)</span>
                    </div>
                </div>
                <%}%>
                <div class="product-description">
                    <%=productDetails.getProd_desc()%>
                </div>
                <div class="product__color d-flex" style="align-items: center">
                    <div class="title" style="font-size: 16px; margin-right: 10px">
                        Màu:
                    </div>
                    <div class="select-swap d-flex">
                        <div class="circlecheck">
                            <input type="radio" id="f-option" class="circle-1" name="selector" checked/>
                            <label for="f-option"></label>
                            <div class="outer-circle"></div>
                        </div>
                        <div class="circlecheck">
                            <input type="radio" id="g-option" class="circle-2" name="selector"/>
                            <label for="g-option"></label>
                            <div class="outer-circle"></div>
                        </div>
                        <div class="circlecheck">
                            <input type="radio" id="h-option" class="circle-3" name="selector"/>
                            <label for="h-option"></label>
                            <div class="outer-circle"></div>
                        </div>
                    </div>
                </div>
                <div class="product__size d-flex" style="align-items: center">
                    <div class="title" style="font-size: 16px; margin-right: 10px">
                        Kích thước:
                    </div>
                    <div class="select-swap">
                        <div class="swatch-element" data-value="38">
                            <input type="radio" class="variant-1" id="swatch-1-38" name="mau" value="trung"
                                   onclick="check()"/>
                            <label for="swatch-1-38" class="sd"><span>38</span></label>
                        </div>
                        <div class="swatch-element" data-value="39">
                            <input type="radio" class="variant-1" id="swatch-1-39" name="mau" value="thanh"
                                   onclick="check()"/>
                            <label for="swatch-1-39" class="sd"><span>39</span></label>
                        </div>
                        <div class="swatch-element" data-value="40">
                            <input type="radio" class="variant-1" id="swatch-1-40" name="mau" value="hieu"
                                   onclick="check()"/>
                            <label for="swatch-1-40" class="sd"><span>40</span></label>
                        </div>
                    </div>
                </div>
                <div class="product__wrap">
                    <div class="product__amount">
                        <label>Số lượng: </label>
                        <input type="button" value="-" class="control" onclick="tru()"/>
                        <input type="text" value="1" class="text-input" id="text_so_luong"
                               onkeypress="validate(event)"/>
                        <input type="button" value="+" class="control" onclick="cong()"/>
                    </div>
                </div>
                <div class="product__shopnow">
                    <button class="shopnow2">Mua ngay</button>
                </div>
            </div>
        </div>
    </div>
</div>
<button class="btn-default btn-close" data-dismiss="modal">
    <i class="fas fa-times-circle"></i>
</button>
