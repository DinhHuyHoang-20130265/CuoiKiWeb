<%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 11/27/2022
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="sidebar">
    <div class="sidebar-container">
        <div class="sidebar-header">
            <div class="brand">
                <div class="logo">
                    <span class="l l1"></span>
                    <span class="l l2"></span>
                    <span class="l l3"></span>
                    <span class="l l4"></span>
                    <span class="l l5"></span>
                </div>
                Quản Lý
            </div>
        </div>
        <nav class="menu">
            <ul class="sidebar-menu metismenu" id="sidebar-menu">
                <li class="active">
                    <a href="index.jsp">
                        <i class="fa fa-home"></i> Tổng quan </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-th-large"></i> Quản Lý Đối Tượng
                        <i class="fa arrow"></i>
                    </a>
                    <ul class="sidebar-nav">
                        <li>
                            <a href="#"> Sản phẩm<i class="fa arrow"></i></a>
                            <ul class="sidebar-nav">
                                <li>
                                    <a href="items-list.jsp"> Danh sách sản phẩm </a>
                                </li>
                                <li>
                                    <a href="item-editor.jsp"> Chỉnh sửa sản phẩm </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"> Danh mục <i class="fa arrow"></i></a>
                            <ul class="sidebar-nav">
                                <li>
                                    <a href="catetory-list.jsp"> Danh sách danh mục </a>
                                </li>
                                <li>
                                    <a href="category-editor.jsp"> Chỉnh sửa danh mục </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"> Bài báo <i class="fa arrow"></i></a>
                            <ul class="sidebar-nav">
                                <li>
                                    <a href="posts-list.jsp"> Danh sách bài báo </a>
                                </li>
                                <li>
                                    <a href="post-editor.jsp"> Chỉnh sửa bài báo</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"> Đơn hàng <i class="fa arrow"></i></a>
                            <ul class="sidebar-nav">
                                <li>
                                    <a href="orders-list.jsp"> Danh sách đơn hàng </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"> Người dùng <i class="fa arrow"></i></a>
                            <ul class="sidebar-nav">
                                <li>
                                    <a href="users-list.jsp"> Danh sách người dùng </a>
                                </li>
                                <li>
                                    <a href="user-editor.jsp"> Chỉnh sửa thông tin người dùng</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"> Bình luận/Đánh giá <i class="fa arrow"></i></a>
                            <ul class="sidebar-nav">
                                <li>
                                    <a href="comments-list.jsp"> Danh sách Bình luận tin tức </a>
                                </li>
                                <li>
                                    <a href="stars-list.jsp"> Danh sách đánh giá sản phẩm</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="">
                        <i class="fa fa-area-chart"></i> Thống kê
                        <i class="fa arrow"></i>
                    </a>
                    <ul class="sidebar-nav">
                        <li>
                            <a href="charts-morris.jsp"> Biểu đồ </a>
                        </li>
                        <li>
                            <a href="static-tables.jsp"> Bảng </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
    <footer class="sidebar-footer">
        <ul class="sidebar-menu metismenu" id="customize-menu">
            <li>
                <ul>
                    <li class="customize">
                        <div class="customize-item">
                            <div class="row customize-header">
                                <div class="col-4"></div>
                                <div class="col-4">
                                    <label class="title">Cố dịnh</label>
                                </div>
                                <div class="col-4">
                                    <label class="title">Linh hoạt</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <label class="title">Thanh công cụ:</label>
                                </div>
                                <div class="col-4">
                                    <label>
                                        <input class="radio" type="radio" name="sidebarPosition"
                                               value="sidebar-fixed">
                                        <span></span>
                                    </label>
                                </div>
                                <div class="col-4">
                                    <label>
                                        <input class="radio" type="radio" name="sidebarPosition" value="">
                                        <span></span>
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <label class="title">Tiêu đề:</label>
                                </div>
                                <div class="col-4">
                                    <label>
                                        <input class="radio" type="radio" name="headerPosition"
                                               value="header-fixed">
                                        <span></span>
                                    </label>
                                </div>
                                <div class="col-4">
                                    <label>
                                        <input class="radio" type="radio" name="headerPosition" value="">
                                        <span></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="customize-item">
                            <ul class="customize-colors">
                                <li>
                                    <span class="color-item color-red" data-theme="red"></span>
                                </li>
                                <li>
                                    <span class="color-item color-orange" data-theme="orange"></span>
                                </li>
                                <li>
                                    <span class="color-item color-green active" data-theme=""></span>
                                </li>
                                <li>
                                    <span class="color-item color-seagreen" data-theme="seagreen"></span>
                                </li>
                                <li>
                                    <span class="color-item color-blue" data-theme="blue"></span>
                                </li>
                                <li>
                                    <span class="color-item color-purple" data-theme="purple"></span>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <a href="">
                    <i class="fa fa-cog"></i> Sửa đổi giao diện </a>
            </li>
        </ul>
    </footer>
</aside>
<div class="sidebar-overlay" id="sidebar-overlay"></div>
<div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
<div class="mobile-menu-handle"></div>