<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Notify_Admin" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NotifyService" %><%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 11/27/2022
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header">
    <div class="header-block header-block-collapse d-lg-none d-xl-none">
        <button class="collapse-btn" id="sidebar-collapse-btn">
            <i class="fa fa-bars"></i>
        </button>
    </div>
    <div class="header-block header-block-search">
        <form role="search">
            <div class="input-container">
                <div class="underline"></div>
            </div>
        </form>
    </div>
    <div class="header-block header-block-nav">
        <ul class="nav-profile">
            <li class="notifications new">
                <%List<Notify_Admin> list = NotifyService.getInstance().loadNewestNotifies();%>
                <a data-toggle="dropdown" style="cursor: pointer">
                    <i class="fa fa-bell-o"></i>
                    <sup>
                        <span class="counter"><%=list != null ? list.size() : "0"%></span>
                    </sup>
                </a>
                <div class="dropdown-menu notifications-dropdown-menu">
                    <ul class="notifications-container"
                        style="overflow-x: scroll; overflow-y: scroll; max-height: 240px">
                        <% if (list != null)
                            for (Notify_Admin notify : list) {%>
                        <li>
                            <a class="notification-item"
                               href="./order-details.jsp?id=<%=notify.getOrder_id()%>">
                                <div class="img-col">
                                    <div class="img"
                                         style="background-image: url('http://localhost:8080/CuoiKiWeb_war/admin-page/assets/faces/8.jpg')">
                                    </div>
                                </div>
                                <div class="body-col">
                                    <p>
                                        <span class="accent"><%=notify.getContent()%></span>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                    <div id="dropdown-notify">
                        <%--                            <a class="loadmore-btn" id="loadMoreNotify" style="cursor: pointer;">Xem thêm</a>--%>
                        <input type="text" id="page-notify" value="2" style="display: none">
                        <a class="list-notify" href="notify-list.jsp" style="display: block; padding-top: 5px; text-align: center"
                        >Xem tất cả</a>
                    </div>
                </div>
            </li>
            <%
                AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
            %>
            <li class="profile dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                   aria-haspopup="true" aria-expanded="false">
                    <div class="img"
                         style="background-image: url('<%=UserInformationService.getInstance().getUserInfo(admin.getId()).getAvatar_link() == null ? "http://localhost:8080/CuoiKiWeb_war/admin-page/assets/faces/8.jpg" : UserInformationService.getInstance().getUserInfo(admin.getId()).getAvatar_link()%>')">
                    </div>
                    <span class="name"> <%=admin.getUsername()%> </span>
                </a>
                <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                    <a class="dropdown-item" href="../LogoutAdminController">
                        <i class="fa fa-power-off icon"></i> Đăng xuất </a>
                    <a class="dropdown-item" href="profile.jsp">
                        <i class="fa fa-user icon"></i> Thông tin tài khoản </a>
                </div>
            </li>
        </ul>
    </div>
</header>