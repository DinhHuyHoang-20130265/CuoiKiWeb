<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.NewsComment" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.DAO.UserInformationDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/16/2022
  Time: 8:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<NewsComment> loadNewsComment = (List<NewsComment>) request.getAttribute("loadNewsComment");%>
<%for (NewsComment comment : loadNewsComment){%>
<div class="box_result row">
    <div class="avatar_comment col-md-1">
        <img src="./assets/img/product/noavatar.png" alt="avatar"/>
    </div>
    <div class="result_comment col-md-11">
        <h4><%=comment.getComment_by()%></h4>
        <p><%=comment.getDescription()%></p>
        <div class="tools_comment">
            <a class="like" href="#">Thích</a>
            <span aria-hidden="true"> · </span>
            <a class="replay" href="#">Phản hồi</a>
            <span aria-hidden="true"> · </span>
            <i class="fa fa-thumbs-o-up"></i> <span class="count">1</span>
            <span aria-hidden="true"> · </span>
            <span><%=comment.getComment_date()%></span>
        </div>
        <div class="child_replay"></div>
    </div>
</div>
<%}%>