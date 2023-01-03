<%@ page import="vn.edu.hcmuaf.fit.beans.wishlist.WishList" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 12/14/2022
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% WishList wishList = (WishList) request.getSession().getAttribute("wishList");%>
<%=wishList.getQuantity()%>