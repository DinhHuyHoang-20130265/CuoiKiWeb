<%@ page import="vn.edu.hcmuaf.fit.beans.cart.Cart" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 12/11/2022
  Time: 1:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Cart cart = (Cart) request.getSession().getAttribute("cart");%>
<%=cart.getQuantity_cart()%>
