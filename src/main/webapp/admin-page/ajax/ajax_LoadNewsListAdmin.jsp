<%@ page import="vn.edu.hcmuaf.fit.beans.news.News" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/7/2023
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<News> list = (List<News>) request.getAttribute("news"); %>
<% if (list != null)
    for (News news : list) { %>
<li class="item">
    <div class="item-row">
        <div class="item-col fixed item-col-check">
            <label class="item-check" id="select-all-items">
                <input type="checkbox" class="checkbox">
                <span></span>
            </label>
        </div>
        <div class="item-col fixed pull-left item-col-title">
            <div class="item-heading">Tiêu đề</div>
            <div>
                <a href="item-editor.jsp" class="">
                    <h4 class="item-title"><%=news.getNews_title()%>> </h4>
                </a>
            </div>
        </div>
        <div class="item-col item-col-sales">
            <div class="item-heading">Mã bài</div>
            <div>#<%=news.getNews_id()%>> </div>
        </div>
        <div class="item-col item-col-stats no-overflow">
            <div class="item-heading">Số lượt xem</div>
            <div class="no-overflow">
               1
            </div>
        </div>
        <div class="item-col item-col-author">
            <div class="item-heading">Người thêm</div>
            <div class="no-overflow">
                <a><%=news.getPosted_by()%></a>
            </div>
        <div class="item-col item-col-category no-overflow">
        </div>
        <div class="item-col item-col-author">
            <div class="item-heading">Trạng thái</div>
            <div class="no-overflow">
                <a> Đã Ẩn </a>
            </div>
        </div>
        <div class="item-col item-col-date">
            <div class="item-heading">Ngày thêm</div>
            <div class="no-overflow"><%=news.getPosted_date()%></div>
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
                            <a class="remove" href="#" data-toggle="modal" data-target="#confirm-modal">
                                <i class="fa fa-trash-o "></i>
                            </a>
                        </li>
                        <li>
                            <a class="edit" href="post-editor.jsp">
                                <i class="fa fa-pencil"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        </div>
    </div>
</li>
<%}%>