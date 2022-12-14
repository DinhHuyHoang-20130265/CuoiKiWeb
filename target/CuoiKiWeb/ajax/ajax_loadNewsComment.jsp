
<%@ page import="vn.edu.hcmuaf.fit.beans.news.NewsComment" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/13/2022
  Time: 2:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%SiteUser user = (SiteUser) request.getSession().getAttribute("user");%>
<%UserInformation userInformation = (UserInformation) request.getSession().getAttribute("userInformation");%>
<%List<NewsComment> loadComment = (List<NewsComment>) request.getAttribute("loadComment");%>
<% for (NewsComment comment : loadComment) {%>
<% for (UserInformation userInfor : userInformation){%>
<!-- load comment-->
<li class="box_result row">
  <%if (user != null){%>
  <img src="<%userInformation.getAvatarImgLink();%>" alt="avatar"/>
  <%}else {%>
  <img src="./assets/imgNews/news/avatar.jpg" alt="avatar"/>
  <%}%>
  <div class="result_comment col-md-11">
    <h4><%userInformation.getFullName();%>></h4>
    <p><%comment.getDescription();%></p>
    <div class="tools_comment">
      <a class="like" href="#">Thích</a>
      <span aria-hidden="true"> · </span>
      <a class="replay" href="#">Phản hồi</a>
      <span aria-hidden="true"> · </span>
      <i class="fa fa-thumbs-o-up"></i> <span class="count">1</span>
      <span aria-hidden="true"> · </span>
      <span><%comment.getComment_date();%>></span>
    </div>
    <ul class="child_replay"></ul>
  </div>
</li>
<%}%>
<%}%>