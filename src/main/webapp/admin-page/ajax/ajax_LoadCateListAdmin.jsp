<%@ page import="vn.edu.hcmuaf.fit.beans.category.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 1/6/2023
  Time: 6:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Category> categories = (List<Category>) request.getAttribute("categories");%>
<% for (Category category : categories) {%>
<li class="item">
    <div class="item-row">
        <div class="item-col fixed item-col-check">
            <label class="item-check" id="select-all-items">
                <input type="checkbox" class="checkbox">
                <span></span>
            </label>
        </div>
        <div class="item-col fixed pull-left item-col-title"
             style="max-width: 125px !important;">
            <div class="item-heading">Tên danh mục</div>
            <div>
                <a>
                    <h4 class="item-title"><%=category.getCate_name()%>
                    </h4>
                </a>
            </div>
        </div>
        <div class="item-col item-col-sales" style="text-align: left!important;">
            <div class="item-heading">Mã danh mục</div>
            <div class="sales" style="text-align: left; padding-left:20px">
                <%=category.getId()%>
            </div>
        </div>
        <div class="item-col item-col-category">
            <div class="item-heading">Mô tả danh mục</div>
            <div class="sales" style="text-align: left">
                <%=category.getCate_desc()%>
            </div>
        </div>
        <div class="item-col item-col-category">
            <div class="item-heading">Mã danh mục cha</div>
            <div class="sales" style="text-align: left">
                <%=category.getParent_id()%>
            </div>
        </div>
        <div class="item-col item-col-author" style="max-width: 80px;">
            <div class="item-heading">Trạng Thái</div>
            <div class="no-overflow" style="text-align: center">
                <a>
                    <%=category.getCate_status() == 1 ? "Hiển thị" : "Đã ẩn"%>
                </a>
            </div>
            <input type="text" id="status" value="<%=category.getCate_status()%>"
                   style="display: none">
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
                        <% AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
                            for (AdminRole role : admin.getRole()) {
                                if (role.getTable().equals("category") && role.getPermission().equals("delete")) {%>
                        <li>
                            <a class="remove" id="remove<%=category.getId()%>"
                               data-toggle="modal"
                               data-target="#confirm-modal" style="cursor: pointer">
                                <i class="fa fa-trash-o "></i>
                            </a>
                        </li>
                        <%
                            }
                            if (role.getTable().equals("category") && role.getPermission().equals("update")) {
                        %>
                        <li>
                            <a class="edit"
                               href="category-editor.jsp?id=<%=category.getId()%>">
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