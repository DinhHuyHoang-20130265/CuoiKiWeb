<%@ page import="vn.edu.hcmuaf.fit.beans.news.NewsComment" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/2/2023
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%NewsComment comment = (NewsComment) request.getAttribute("new_comment");
  UserInformation userInfo = UserInformationService.getInstance().getUserInfo(comment.getComment_by());
%>
<div class="box_result row" id="box_result<%=comment.getComment_id()%>">
  <div class="avatar_comment col-md-1">
    <img src="<%=userInfo.getAvatar_link() == null ? "http://localhost:8080/CuoiKiWeb_war/assets/imgNews/news/avatar.jpg" : userInfo.getAvatar_link()%>"
         alt="avatar"/>
  </div>
  <div class="result_comment col-md-11">
    <h4><%=userInfo.getFull_name()%>
    </h4>
    <p><%=comment.getDescription()%>
    </p>
    <div class="tools_comment">
      <span><%=comment.getCommented_date()%></span>
      <%
        SiteUser user = (SiteUser) request.getSession().getAttribute("user");
        if (user != null) {
          if (user.getId().equals(comment.getComment_by())) { %>
      <a class="remove" id="remove<%=comment.getComment_id()%>" style="cursor: pointer; float: right; color: darkred"><i class="fa fa-trash"></i></a>
      <% }
      } %>
    </div>
  </div>
</div>