<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %><%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 1/2/2023
  Time: 11:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<SiteUser> accounts = (List<SiteUser>) request.getAttribute("users");%>
<% for (SiteUser user : accounts) {
    UserInformation info = UserInformationService.getInstance().getUserInfo(user.getId());
%>
<li class="item">
    <div class="item-row">
        <div class="item-col fixed item-col-check">
            <label class="item-check" id="select-all-items">
                <input type="checkbox" class="checkbox">
                <span></span>
            </label>
        </div>
        <div class="item-col fixed item-col-img md">
            <a>
                <div class="item-img rounded"
                     style="background-image: url(<%=(info.getAvatar_link() != null) ? info.getAvatar_link() : "https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg"%>)"></div>
            </a>
        </div>
        <div class="item-col fixed pull-left item-col-title">
            <div class="item-heading">Tên người dùng</div>
            <div>
                <a style="text-decoration: none">
                    <h4 class="item-title"><%=info.getFull_name()%>
                    </h4>
                </a>
            </div>
        </div>
        <div class="item-col item-col-sales">
            <div class="item-heading">Mã nguời dùng</div>
            <div><%=user.getId()%>
            </div>
        </div>
        <div class="item-col item-col-stats no-overflow">
            <div class="item-heading">Email</div>
            <div class="no-overflow">
                <%=info.getEmail() != null ? info.getEmail() : ""%>
            </div>
        </div>
        <div class="item-col item-col-category no-overflow">
            <div class="item-heading">Địa chỉ</div>
            <div class="no-overflow">
                <a style="text-decoration: none"><%=info.getAddress() != null ? info.getAddress() : ""%>
                </a>
            </div>
        </div>
        <div class="item-col item-col-author">
            <div class="item-heading">Trạng thái</div>
            <div class="no-overflow">
                <a><%=user.getAccount_status() == 1 ? "Hoạt động" : "Tạm dừng"%>
                </a>
            </div>
        </div>
        <div class="item-col item-col-date">
            <div class="item-heading">Ngày thêm</div>
            <div class="no-overflow"><%=info.getCreated_date() != null ? info.getCreated_date() : ""%>
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
                        <% AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
                            for (AdminRole role : admin.getRole()) {
                                if (role.getTable().equals("user") && role.getPermission().equals("delete")) {
                        %>
                        <li>
                            <a style="cursor: pointer" class="remove" id="remove<%=user.getId()%>" data-toggle="modal"
                               data-target="#confirm-modal">
                                <i class="fa fa-trash-o "></i>
                            </a>
                        </li>
                        <%
                            }
                            if (role.getTable().equals("user") && role.getPermission().equals("update")) {
                        %>
                        <li>
                            <a class="edit" href="user-editor.jsp?id=<%=user.getId()%>">
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
<% } %>
