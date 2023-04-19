<%@ page import="vn.edu.hcmuaf.fit.beans.cart.Cart" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 4/19/2023
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Cart cart = (Cart) request.getSession().getAttribute("cart");%>
<% PromotionCode code = (PromotionCode) request.getSession().getAttribute("code");%>
<%NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<div class="subtotal">
    <div class="row row-sliderbar-footer">
        <div class="col-6"><span>Tạm tính:</span></div>
        <div class="col-6 text-right">
            <span><%=cart != null ? format.format(cart.total()) : 0%>₫</span></div>
    </div>
    <div class="row row-sliderbar-footer">
        <div class="col-6"><span>Phí vận chuyển</span></div>
        <div class="col-6 text-right"><span>30,000₫</span></div>
    </div>
    <% int discount_ship = code.getDiscount_money();
        if (code.getType_code().equals("SHIP")) {%>
    <div class="row row-sliderbar-footer">
        <div class="col-6"><span>Giảm giá mã vận chuyển</span></div>
        <div class="col-6 text-right"><span><%=format.format(discount_ship)%>₫</span></div>
    </div>
    <%}%>
    <% int discount_total = code.getDiscount_money();
        if (code.getType_code().equals("THOITRANG")) {%>
    <div class="row row-sliderbar-footer">
        <div class="col-6"><span>Giảm giá mã thời trang</span></div>
        <div class="col-6 text-right"><span><%=format.format(discount_total)%>₫</span></div>
    </div>
    <%}%>
</div>
<div class="total">
    <div class="row row-sliderbar-footer">
        <div class="col-6"><span>Tổng cộng:</span></div>
        <div class="col-6 text-right">
            <span><%=format.format(cart.total() + 30000 - discount_ship - discount_total)%>₫</span></div>
        <input class="total_input" value="<%=cart.total() + 30000 - discount_ship - discount_total%>"
               style="display: none">;
    </div>
</div>
<div class="salecode">
    <div class="row row-sliderbar-footer">
        <div class="col-6"><span>Nhập mã ưu đãi:</span></div>
        <textarea class="sale_code form-control"
                  placeholder="Nhập vào nếu có"></textarea>
        <button class="codebutt">Áp Dụng</button>
    </div>
</div>
<hr>
<div class="selection-pay">
    <div class="selection-pay-title">
        <h2>Chọn hình thức thanh toán</h2>
    </div>
    <div class="selection-btn">
        <input type="radio" id="cash" name="select-btn" value="0" checked>
        <label for="cash"> Thanh toán bằng tiền mặt khi nhận hàng(COD)</label><br>
        <input type="radio" id="bank" name="select-btn" value="1">
        <label for="bank"> Thanh toán bằng thẻ ngân hàng</label><br>
    </div>
</div>

