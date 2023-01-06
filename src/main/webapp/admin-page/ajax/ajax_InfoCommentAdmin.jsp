<%@ page import="vn.edu.hcmuaf.fit.beans.news.NewsComment" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/6/2023
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    NewsComment comment = (NewsComment) request.getAttribute("comment");
    UserInformation information = (UserInformation) request.getAttribute("info");
%>
<div class="modal-body">
    <div class="zoom-anim-dialog modal--view" id="modal-view">
        <div class="comments__autor">
            <img class="comments__avatar"
                 src="<%=information.getAvatar_link() == null ? "" : information.getAvatar_link()%>" alt="">
            <span class="comments__name"><%=information.getFull_name()%></span>
            <span class="comments__time"><%=comment.getCommented_date()%></span>
        </div>
        <p class="comments__text"><%=comment.getDescription()%>
        </p>
        <div class="comments__actions">
            <div class="comments__rate" style="text-align: center">
            </div>
        </div>
    </div>
</div>
