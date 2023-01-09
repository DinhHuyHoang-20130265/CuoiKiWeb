<%@ page import="vn.edu.hcmuaf.fit.beans.news.News" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/7/2023
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<News> loadNews = (List<News>) request.getAttribute("loadNews"); %>
<% if (loadNews != null)
    for (News news : loadNews) { %>
<li class="item" id="item<%=news.getNews_id()%>">
    <div class="item-row">
        <div class="item-col fixed item-col-check">
            <label class="item-check" id="select-all-items">
                <input type="checkbox" class="checkbox">
                <span></span>
            </label>
        </div>
        <div class="item-col fixed pull-left item-col-title" style="text-align: center;">
            <div class="item-heading">Tiêu đề</div>
            <div>
                <a href="item-editor.jsp?id=<%=news.getNews_id()%>" class="" style="margin-left: 30px !important;">
                    <h4 class="item-title"><%=news.getNews_title()%>
                    </h4>
                </a>
            </div>
        </div>
        <div class="item-col item-col-sales" style="text-align: center;">
            <div class="item-heading">Mã bài</div>
            <div>#<%=news.getNews_id()%>
            </div>
        </div>
        <div class="item-col item-col-stats no-overflow" style="text-align: center;">
            <div class="item-heading">Mô tả</div>
            <div class="no-overflow">
                <%=news.getDescription()%>
            </div>
        </div>
        <div class="item-col item-col-author" style="text-align: center;">
            <div class="item-heading">Người thêm</div>
            <div class="no-overflow">
                <a><%=news.getPosted_by()%>
                </a>
            </div>
        </div>
        <div class="item-col item-col-author" style="text-align: center;">
            <div class="item-heading">Trạng thái</div>
            <div class="no-overflow">
                <a> Hiển thị </a>
            </div>
        </div>
        <div class="item-col item-col-date" style="text-align: center;">
            <div class="item-heading">Ngày thêm</div>
            <div class="no-overflow"><%=news.getPosted_date()%>
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
                                if (role.getTable().equals("product") && role.getPermission().equals("delete")) {
                        %>
                        <li>
                            <a class="remove" id="remove<%=news.getNews_id()%>"
                               data-toggle="modal"
                               data-target="#confirm-modal" style="cursor: pointer">
                                <i class="fa fa-trash-o "></i>
                            </a>
                        </li>
                        <%
                            }
                            if (role.getTable().equals("product") && role.getPermission().equals("update")) {
                        %>
                        <li>
                            <a class="edit" id="edit" href="post-editor.jsp?id=<%=news.getNews_id()%>">
                                <i class="fa fa-pencil"></i>
                            </a>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</li>
<%}%>