<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.cart.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.cart.CartKey" %>
<%--<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 12/12/2022
  Time: 3:18 PM
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
                                    <div class="col-3">Số lượng</div>
                                    <div class="col-2">Thành tiền</div>
                                </div>
                            </div>
                            <div class="col-1"></div>
                        </div>
                    </div>
                    <div class="cart-body">
                        <% Cart cart = (Cart) request.getSession().getAttribute("cart");
                            int i = 1;
                            NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
                        <% if (cart != null) {
                            for (CartKey p : cart.getData().keySet()) {%>
                        <div class="row cart-body-row cart-body-row-1" style="align-items: center;">
                            <div class="col-md-11 col-10" style="text-align: center;">
                                <div class="row card-info" style="align-items: center;">
                                    <div class="col-md-2 col-12 card-info-img">
                                        <a href=""><img class="cart-img"
                                                        src="<%=cart.getData().get(p).getMain_img_link()%>"
                                                        alt=""></a>
                                    </div>
                                    <div class="col-md-3 col-12"
                                         style="display: flex; align-items: center; padding: 0 2px 0 2px">
                                        <a href="" class="cart-name"><h5><%=cart.getData().get(p).getProd_name()%>
                                        </h5></a>
                                        <div class="foo" style="background: <%=p.getColor()%>"></div>
                                        <p class="size_choosed" style="font-size: 12px;"><%=p.getSize()%>
                                        </p>
                                    </div>
                                    <%if (cart.getData().get(p).getSales() != null) {%>
                                    <div class="col-md-2 col-12" style="font-size: 16px;">
                                        <span><%=format.format(cart.getData().get(p).getPrice() * 0.01 * (100 - cart.getData().get(p).getSales().getDiscount_rate()))%>₫ - (-<%=cart.getData().get(p).getSales().getDiscount_rate()%>%)</span>
                                    </div>
                                    <%} else {%>
                                    <div class="col-md-2 col-12" style="font-size: 16px;">
                                        <span><%=format.format(cart.getData().get(p).getPrice())%>₫</span>
                                    </div>
                                    <%}%>
                                    <div class="col-md-3 col-12">
                                        <div class="cart-quantity" id="quantity-of-<%=p.getId()%>">
                                            <input type="button" value="-" class="control<%=p.getId()%>"
                                                   onclick="tru(<%=i%>)">
                                            <input type="text" value="<%=cart.getData().get(p).getQuantity_cart()%>"
                                                   class="text-input"
                                                   id="text_so_luong-<%=i%>" disabled>
                                            <input type="button" value="+" class="control<%=p.getId()%>"
                                                   onclick="cong(<%=i%>)">
                                            <input type="text" id="productcolor<%=p.getId()%>"
                                                   value="<%=p.getColor()%>" style="display: none">
                                            <input type="text" id="productsize<%=p.getId()%>"
                                                   value="<%=p.getSize()%>" style="display: none">
                                        </div>
                                    </div>
                                    <%if (cart.getData().get(p).getSales() != null) {%>
                                    <div class="col-md-2 col-12 hidden-xs" id="thanh_tien" style="font-size: 16px;">
                                        <span><%=format.format(cart.getData().get(p).getQuantity_cart() * (cart.getData().get(p).getPrice() * 0.01 * (100 - cart.getData().get(p).getSales().getDiscount_rate())))%>₫</span>
                                    </div>
                                    <%} else {%>
                                    <div class="col-md-2 col-12 hidden-xs" id="thanh_tien" style="font-size: 16px;">
                                        <span><%=format.format(cart.getData().get(p).getQuantity_cart() * cart.getData().get(p).getPrice())%>₫</span>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                            <div class="col-md-1 col-2 text-right">
                                <a href="#" id="delete<%=cart.getData().get(p).getId()%>"><i
                                        class="fas fa-trash"></i></a>
                            </div>
                        </div>
                        <%
                                    i++;
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
                <div class="cart-body-right">
                    <div class="cart-total">
                        <label>Thành tiền:</label>
                        <span class="total__price"><%=cart != null ? format.format(cart.total()) : 0%>₫</span>
                    </div>
                    <div class="cart-buttons">
                        <a style="display: block; text-align: center;" href="pay.jsp" class="chekout">THANH TOÁN</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>