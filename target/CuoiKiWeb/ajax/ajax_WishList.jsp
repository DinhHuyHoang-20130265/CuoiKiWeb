<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.wishlist.WishList" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 1/2/2023
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%SiteUser user = (SiteUser) request.getSession().getAttribute("user");%>
<%NumberFormat formatter = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<div class="container">
  <div class="cart-wrap">
    <div class="cart-content">
      <form action="" class="form-cart">
        <div class="cart-body-left">
          <div class="cart-heding hidden-xs">
            <div class="row cart-row">
              <div class="col-11" style="text-align: center;">
                <div class="row">
                  <div class="col-5">Sản phẩm</div>
                  <div class="col-2">Đơn giá</div>
                  <div class="col-2"></div>
                </div>
              </div>
              <div class="col-1"></div>
            </div>
          </div>
          <div class="cart-body">
            <% WishList wishList = (WishList) request.getSession().getAttribute("wishList");
              NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
            <% if (wishList != null) {
              for (String id : wishList.getData().keySet()) {%>
            <div class="row cart-body-row cart-body-row-1" style="align-items: center;">
              <div class="col-md-11 col-10" style="text-align: center;">
                <div class="row card-info" style="align-items: center;">
                  <div class="col-md-2 col-12 card-info-img">
                    <a href=""><img class="cart-img"
                                    src="<%=wishList.getData().get(id).getMain_img_link()%>"
                                    alt=""></a>
                  </div>
                  <div class="col-md-3 col-12">
                    <a href="" class="cart-name">
                      <h5><%=wishList.getData().get(id).getProd_name()%>
                      </h5>
                    </a>
                  </div>
                  <%if (wishList.getData().get(id).getSales() != null) {%>
                  <div class="col-md-2 col-12" style="font-size: 16px;">
                    <span><%=format.format(wishList.getData().get(id).getPrice() * 0.01 * (100 - wishList.getData().get(id).getSales().getDiscount_rate()))%>₫ - (-<%=wishList.getData().get(id).getSales().getDiscount_rate()%>)</span>
                  </div>
                  <%} else {%>
                  <div class="col-md-2 col-12" style="font-size: 16px;">
                    <span><%=format.format(wishList.getData().get(id).getPrice())%>₫</span>
                  </div>
                  <%}%>
                  <div class="col-md-3 col-12">
                    <div class="cart-fiding">
                      <a href="#">Tìm sản phẩm tương tự</a>
                    </div>
                  </div>
                  <div class="col-md-2 col-12" style="font-size: 16px;">
                    <a href="cart.jsp" class="likecartbutton"> Giỏ hàng </a>
                  </div>
                </div>
              </div>
              <div class="col-md-1 col-2 text-right delete-product">
                <a href="#" class="deleteProd" id="delete<%=wishList.getData().get(id).getId()%>"><i
                        class="fas fa-trash"></i></a>
              </div>
            </div>
            <%
                }
              }
            %>
          </div>
          <div class="cart-footer">
            <div class="row cart-footer-row">
              <div class="col-1"></div>
              <div class="col-11 continue">
                <a href="Product.jsp">
                  <i class="fas fa-chevron-left"></i>
                  Tiếp tục mua sắm
                </a>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
