<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.NewsComment" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %><%--
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
        <div class="item-col fixed item-col-img md" style="justify-content: center; min-width: 120px;margin: 0 50px;">
            <span>#<%=comment.getNews_id()%></span>
        </div>
        <div class="item-col fixed pull-left item-col-title"
             style="padding: 0 !important; max-width: 200px; text-align: center;">
            <div class="item-heading">Người bình luận</div>
            <div>
                <a>
                    <h4 class="item-title"><%=comment.getComment_by()%>
                    </h4>
                </a>
            </div>
        </div>
        <div class="item-col item-col-sales" style="text-align: center;margin: 0 50px;">
            <div class="item-heading">Mã bình luận</div>
            <div class="sales" style="text-align: center">#<%=comment.getComment_id()%>
            </div>
        </div>
        <div class="item-col item-col-author" style="text-align: center;margin: 0 20px;">
            <div class="item-heading">Trạng Thái</div>
            <div class="no-overflow" style="text-align: center">
                <%if (comment.getComment_status() == 1) {%>
                <a> Hiển thị </a>
                <%} else {%>
                <a> Đã Ẩn </a>
                <%}%>
            </div>
            <input type="text" id="status<%=comment.getComment_id()%>" value="<%=comment.getComment_status()%>"
                   style="display: none">
        </div>
        <div class="item-col item-col-date" style="text-align: center;margin: 0 50px;">
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
                        <%
                            AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
                            for (AdminRole role : admin.getRole()) {
                                if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("comment") && role.getPermission().equals("delete")) {
                        %>
                        <li>
                            <a class="remove" id="remove<%=comment.getComment_id()%>" style="cursor: pointer"
                               data-toggle="modal"
                               data-target="#confirm-modal">
                                <i class="fa fa-trash-o "></i>
                            </a>
                        </li>
                        <%
                            }
                            if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("comment") && role.getPermission().equals("update")) {
                        %>
                        <li>
                            <a class="toggle" id="toggle<%=comment.getComment_id()%>" style="cursor: pointer">
                                <%
                                    if (comment.getComment_status() == 1) { %>
                                <i class="fa fa-toggle-off" style="color: red"></i>
                                <% } else { %>
                                <i class="fa fa-toggle-on" style="color: green"></i>
                                <%} %>
                            </a>
                        </li>
                        <%
                                }
                            }
                        %>
                        <li>
                            <a class="info" id="info<%=comment.getComment_id()%>" style="cursor: pointer">
                                <i class="fa fa-info-circle"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</li>
<%}%>