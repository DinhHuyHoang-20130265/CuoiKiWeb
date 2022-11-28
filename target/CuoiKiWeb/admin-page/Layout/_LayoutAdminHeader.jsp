<%--
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
                <i class="fa fa-search"></i>
                <input type="search" placeholder="Tìm...">
                <div class="underline"></div>
            </div>
        </form>
    </div>
    <div class="header-block header-block-nav">
        <ul class="nav-profile">
            <li class="notifications new">
                <a href="" data-toggle="dropdown">
                    <i class="fa fa-bell-o"></i>
                    <sup>
                        <span class="counter">8</span>
                    </sup>
                </a>
                <div class="dropdown-menu notifications-dropdown-menu">
                    <ul class="notifications-container">
                        <li>
                            <a href="" class="notification-item">
                                <div class="img-col">
                                    <div class="img" style="background-image: url('/admin-page/assets/faces/3.jpg')">
                                    </div>
                                </div>
                                <div class="body-col">
                                    <p>
                                        <span class="accent">User2</span> Thêm sản phẩm:
                                        <span class="accent">Áo vippro123 được làm từ tinh bột</span>.
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="" class="notification-item">
                                <div class="img-col">
                                    <div class="img" style="background-image: url('/admin-page/assets/faces/5.jpg')">
                                    </div>
                                </div>
                                <div class="body-col">
                                    <p>
                                        <span class="accent">User1</span> Sửa thông tin sản phẩm:
                                        <span class="accent">Áo vippro123 được làm từ tinh bột</span>.
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="" class="notification-item">
                                <div class="img-col">
                                    <div class="img" style="background-image: url('/admin-page/assets/faces/8.jpg')">
                                    </div>
                                </div>
                                <div class="body-col">
                                    <p>
                                        <span class="accent">User3</span> Xoá sản phẩm:
                                        <span class="accent">Áo vippro123 được làm từ tinh bột</span>.
                                    </p>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <footer>
                        <ul>
                            <li>
                                <a href=""> Xem tất cả </a>
                            </li>
                        </ul>
                    </footer>
                </div>
            </li>
            <li class="profile dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                   aria-haspopup="true" aria-expanded="false">
                    <div class="img"
                         style="background-image: url('https://avatars3.githubusercontent.com/u/3959008?v=3&s=40')">
                    </div>
                    <span class="name"> Admin </span>
                </a>
                <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                    <a class="dropdown-item" href="#">
                        <i class="fa fa-user icon"></i> Tài khoản </a>
                    <a class="dropdown-item" href="#">
                        <i class="fa fa-bell icon"></i> Thông báo </a>
                    <a class="dropdown-item" href="#">
                        <i class="fa fa-gear icon"></i> Cài đặt </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">
                        <i class="fa fa-power-off icon"></i> Đăng xuất </a>
                </div>
            </li>
        </ul>
    </div>
</header>
