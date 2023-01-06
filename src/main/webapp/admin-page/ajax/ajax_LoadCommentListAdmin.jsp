<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.NewsComment" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.News" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/6/2023
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<NewsComment> loadNewsComment = (List<NewsComment>) request.getAttribute("loadNewsComment"); %>
<% if (loadNewsComment != null)
    for (NewsComment comment : loadNewsComment) { %>
<li class="item">
    <div class="item-row">
        <div class="item-col fixed item-col-check">
            <label class="item-check" id="select-all-items">
                <input type="checkbox" class="checkbox">
                <span></span>
            </label>
        </div>
        <div class="item-col fixed item-col-img md" style="justify-content: center;">
            <span>#<%=comment.getNews_id()%></span>
        </div>
        <div class="item-col fixed pull-left item-col-title">
            <div class="item-heading">Người bình luận</div>
            <div>
                <a>
                    <h4 class="item-title"><%=comment.getComment_by()%>
                    </h4>
                </a>
            </div>
        </div>
        <div class="item-col item-col-sales">
            <div class="item-heading">Mã bình luận</div>
            <div class="sales" style="text-align: center">#<%=comment.getComment_id()%>
            </div>
        </div>
        <div class="item-col item-col-category no-overflow">
            <div class="item-heading">Lượt thích</div>
            <div class="no-overflow">
                <a>1</a>
            </div>
        </div>
        <div class="item-col item-col-author">
            <div class="item-heading">Trạng Thái</div>
            <div class="no-overflow" style="text-align: center">
                <%if (comment.getComment_status() == 1) {%>
                <a> Hiển thị </a>
                <%} else {%>
                <a> Đã Ẩn </a>
                <%}%>
            </div>
        </div>
        <div class="item-col item-col-date">
            <div class="item-heading">Ngày thêm</div>
            <div class="no-overflow"><%=comment.getCommented_date()%>
            </div>
        </div>
        <div class="item-col fixed item-col-actions-dropdown">
            <div class="item-actions-dropdown">
                <a class="item-actions-toggle-btn">
                                    <span class="inactive">
                                        <i class="fa fa-cog"></i>
                                    </span>
                    <span class="active">
                                        <i class="fa fa-chevron-circle-right"></i>
                                    </span>
                </a>
                <div class="item-actions-block">
                    <ul class="item-actions-list">
                        <li>
                            <a class="remove" id="remove<%=comment.getComment_id()%>">
                                <i class="fa fa-trash-o "></i>
                            </a>
                        </li>
                        <li>
                            <a class="info" id="info<%=comment.getComment_id()%>">
                                <i class="fa fa-info-circle"></i>
                            </a>
                        </li>
                        <li>
                            <a class="toggle" id="toggle<%=comment.getComment_id()%>">
                                <%
                                    if (comment.getComment_status() == 1) { %>
                                <i class="fa fa-toggle-off" style="color: #0b3d88"></i>
                                <% } else { %>
                                <i class="fa fa-toggle-on" style="color: green"></i>
                                <%} %>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</li>
<%}%>