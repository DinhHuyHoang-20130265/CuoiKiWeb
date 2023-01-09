<%@ page import="vn.edu.hcmuaf.fit.beans.Notify_Admin" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.order.Order" %>
<%@ page import="vn.edu.hcmuaf.fit.services.OrderService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.DAO.OrderDAO" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/8/2023
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Notify_Admin> loadNotify = (List<Notify_Admin>) request.getAttribute("loadNotify");
  if (loadNotify != null)
    for (Notify_Admin notify : loadNotify) {%>
<li>
  <a href="" class="notification-item">
    <div class="img-col">
      <div class="img" style="background-image: url('/admin-page/assets/faces/4.jpg')">
      </div>
    </div>
    <div class="body-col">
      <p>
        <span class="accent"><%=notify.getContent()%></span>
        <span class="accent">Order: <%=notify.getOrder_id()%></span>
      </p>
    </div>
  </a>
</li>
<%
}%>