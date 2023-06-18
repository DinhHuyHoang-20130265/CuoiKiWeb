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
<% PromotionCode code = (PromotionCode) request.getSession().getAttribute("code");%>
<%=code.getDiscount_money()%>

