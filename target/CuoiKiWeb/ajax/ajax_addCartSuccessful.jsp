<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 12/11/2022
  Time: 1:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String addcart = (String) request.getAttribute("addcart");%>
<%if (addcart.equals("success")) {%>
<a class="notify" style="color:green; font-size: 16px; font-weight: 600;"><i class="fas fa-check"
                                                                             style="color: green"></i>Thêm sản phẩm vào
    giỏ hàng thành công !</a>
<%}%>