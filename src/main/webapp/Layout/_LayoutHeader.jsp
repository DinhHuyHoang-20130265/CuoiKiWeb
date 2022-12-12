<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.cart.Cart" %><%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 11/27/2022
  Time: 11:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% SiteUser user = (SiteUser) session.getAttribute("user");%>
<% Cart cart = (Cart) request.getSession().getAttribute("cart"); %>
<div class="overlay hidden"></div>
<!-- mobile menu -->
<div class="mobile-main-menu">
    <div class="drawer-header">
        <a href="">
            <div class="drawer-header--auth">
                <%if (user == null) {%>
                <div class="_object">
                    <img src="./assets/img/product/noavatar.png" alt=""/>
                </div>
                <div class="_body">Đăng nhập <br/>Nhận nhiều ưu đãi hơn</div>
                <%} else if (user != null) {%>
                <div class="_object">
                    <img src="./assets/img/product/noavatar.png" alt=""/>
                </div>
                <div class="_body">Xin chào<br/><%=user.getUsername()%>
                </div>
                <%}%>
            </div>
        </a>
    </div>
    <%if (user == null) {%>
    <ul class="ul-first-menu">
        <li>
            <a href="">Đăng nhập</a>
        </li>
        <li>
            <a href="" class="abc">Đăng kí</a>
        </li>
        <%} else if (user != null) {%>
        <ul class="ul-first-menu">
            <li>
                <a href="accountManagement.jsp">Tài khoản của tôi</a>
            </li>
            <li>
                <a href="LogoutController">Đăng xuất</a>
            </li>
        </ul>
        <%}%>
    </ul>
    <div class="la-scroll-fix-infor-user">
        <div class="la-nav-menu-items">
            <div class="la-title-nav-items">
                <strong>Danh mục</strong>
            </div>
            <ul class="la-nav-list-items">
                <li class="ng-scope">
                    <a href="index.jsp">Trang chủ</a>
                </li>
                <li class="ng-scope">
                    <a href="intro.jsp">Giới thiệu</a>
                </li>
                <li class="ng-scope ng-has-child1">
                    <a href="Product.jsp?category=all">Sản phẩm <i class="fas fa-plus cong"></i>
                        <i class="fas fa-minus tru hidden"></i></a>
                    <ul class="ul-has-child1">
                        <li class="ng-scope ng-has-child2">
                            <a href="Product.jsp?category=all">Tất cả sản phẩm</a>
                        </li>
                        <%CategoryService.getInstance().CreateCategoryMenu(out);%>
                    </ul>
                </li>
                <li class="ng-scope">
                    <a href="news.jsp">Tin tức</a>
                </li>
                <li class="ng-scope">
                    <a href="contact.jsp">Liên hệ</a>
                </li>
            </ul>
        </div>
    </div>
    <ul class="mobile-support">
        <li>
            <div class="drawer-text-support">Hỗ trợ</div>
        </li>
        <li>
            <i class="fas fa-phone-square-alt footer__item-icon">Liên hệ: </i>
            <a href="tel:0373132765">0373132765</a>
        </li>
        <li>
            <i class="fas fa-envelope-square footer__item-icon">Email: </i>
            <a href="mailto:pntshopnlu@gmail.com">pntshopnlu@gmail.com</a>
        </li>
    </ul>
</div>
<!-- end mobile menu -->
<!-- header -->
<header class="header">
    <div class="container">
        <div class="top-link clearfix hidden-sm hidden-xs">
            <div class="row">
                <div class="col-6 social_link">
                    <div class="social-title">Theo dõi:</div>
                    <a href=""><i class="fab fa-facebook" style="font-size: 24px; margin-right: 10px"></i></a>
                    <a href=""><i class="fab fa-instagram" style="font-size: 24px; margin-right: 10px; color: pink"></i></a>
                    <a href=""><i class="fab fa-youtube"
                                  style="font-size: 24px; margin-right: 10px; color: red"></i></a>
                    <a href=""><i class="fab fa-twitter" style="font-size: 24px; margin-right: 10px"></i></a>
                </div>
                <div class="col-6 login_link">
                    <% if (user == null) {%>
                    <ul class="header_link right m-auto">
                        <li>
                            <a href="Login.jsp"><i class="fas fa-sign-in-alt mr-3"></i>Đăng nhập</a>
                        </li>
                        <li>
                            <a href="registration.jsp"><i class="fas fa-user-plus mr-3" style="margin-left: 10px"></i>Đăng
                                kí</a>
                        </li>
                    </ul>
                    <%} else if (user != null) {%>
                    <ul class="nav nav__first right">
                        <li class="nav-item nav-item__first nav-item__first-user">
                            <img src="./assets/img/product/noavatar.png" alt="" class="nav-item__first-img">
                            <span class="nav-item__first-name"><%=user.getUsername()%></span>
                            <ul class="nav-item__first-menu">
                                <li class="nav-item__first-item">
                                    <a href="accountManagement.jsp">Tài khoản của tôi</a>
                                </li>
                                <li class="nav-item__first-item">
                                    <a href="LogoutController">Đăng xuất</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="header-main clearfix">
            <div class="row">
                <div class="col-lg-3 col-100-h">
                    <div id="trigger-mobile" class="visible-sm visible-xs">
                        <i class="fas fa-bars"></i>
                    </div>
                    <div class="logo">
                        <a href="index.jsp">
                            <img src="./assets/img/logo/logomain.png" alt=""/>
                        </a>
                    </div>
                    <div class="mobile_cart visible-sm visible-xs">
                        <% if (user == null) {%>
                        <a href="Login.jsp" class="header__second__cart--icon">
                            <i class="fas fa-shopping-cart"></i>
                        </a>
                        <%}
                        else {%>
                        <a href="cart.jsp" class="header__second__cart--icon">
                            <i class="fas fa-shopping-cart"></i>
                            <span id="header__second__cart--notice" class="header__second__cart--notice"><%=cart.getQuantity_cart()%></span>
                        </a>
                        <%}%>
                    </div>
                </div>
                <div class="col-lg-6 m-auto pdt15">
                    <form class="example" action="Product.jsp">
                        <input type="text" class="input-search" id="searchProduct" placeholder="Tìm kiếm.." name="search"/>
                        <button type="submit" class="search-btn">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                    <div id="search-result">
                        <ul style="padding: 0; list-style-type: none" class="suggest_search">
                            <li class="product_suggest">
                                <a href="#">
                                    <div class="item-img">
                                        <img src="http://localhost:8080/CuoiKiWeb_war/assets/imgProduct/images/men/1.jpg" alt="">
                                    </div>
                                    <div class="item-info">
                                        <h3 style="width: 175px; margin-bottom: 0px !important;">
                                            Samsung EB-P3300
                                        </h3>
                                        <strong class="price" style="width: 145px; text-align: center;">790.000₫</strong>
                                        <div class="box-p">
                                            <p class="price-old" style="color: red;margin: 0 !important;">990.000₫</p>
                                            <span class="percent">(-20%)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-3 m-auto hidden-sm hidden-xs">
                    <div class="item-car clearfix">
                        <% if (user == null) {%>
                        <a href="Login.jsp" class="header__second__cart--icon">
                            <i class="fas fa-shopping-cart"></i>
                        </a>
                        <%}
                        else {%>
                        <a href="cart.jsp" class="header__second__cart--icon">
                            <i class="fas fa-shopping-cart"></i>
                            <span id="header__second__cart--notice" class="header__second__cart--notice"><%=cart.getQuantity_cart()%></span>
                        </a>
                        <%}%>
                    </div>
                    <div class="item-like clearfix">
                        <a href="listlike.jsp" class="header__second__like--icon">
                            <i class="far fa-heart"></i>
                            <span id="header__second__like--notice" class="header__second__like--notice">3</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="header_nav hidden-sm hidden-xs">
        <div class="container">
            <ul class="header_nav-list nav">
                <li class="header_nav-list-item">
                    <a href="index.jsp" class="active">Trang chủ</a>
                </li>
                <li class="header_nav-list-item">
                    <a href="intro.jsp">Giới thiệu</a>
                </li>
                <li class="header_nav-list-item has-mega">
                    <a href="Product.jsp?category=all">Sản phẩm<i class="fas fa-angle-right"
                                                                  style="margin-left: 5px"></i></a>
                    <div class="mega-content" style="overflow-x: hidden">
                        <div class="row">
                            <ul class="col-8 no-padding level0">
                                <li class="level1">
                                    <a class="hmega" href="Product.jsp?category=all">Tất cả sản phẩm</a>
                                </li>
                                <!--     <li class="level1">
                                         <a class="hmega" href="Product.jsp?category=">Đồ Nam</a>
                                         <ul class="level1">
                                             <li class="level2">
                                                 <a href="Product.jsp">Áo Thun Nam</a>
                                                 <ul class="level2">
                                                     <li class="level3">
                                                         <a href="Product.jsp">Áo Thun Tay Dài Nam</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Áo Thun Polo Nam</a>
                                                     </li>
                                                 </ul>
                                             </li>
                                             <li class="level2">
                                                 <a href="Product.jsp">Áo Sơ Mi Nam</a>
                                                 <ul class="level2">
                                                     <li class="level3">
                                                         <a href="Product.jsp">Áo Sơ Mi Tay Ngắn Nam</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Áo Sơ Mi Tay Dài Nam</a>
                                                     </li>
                                                 </ul>
                                             </li>
                                             <li class="level2">
                                                 <a href="Product.jsp">Quần Short Nam</a>
                                                 <ul class="level2">
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Short Kaki Nam</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Short Jean Nam</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Short Thun Nam</a>
                                                     </li>
                                                 </ul>
                                             </li>
                                             <li class="level2">
                                                 <a href="Product.jsp">Quần Dài Nam</a>
                                                 <ul class="level2">
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Jean Cá Tính Nam</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Jogger Nam</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Kaki Nam</a>
                                                     </li>
                                                 </ul>
                                             </li>
                                         </ul>
                                     </li>
                                     <li class="level1">
                                         <a class="hmega">Đồ Nữ</a>
                                         <ul class="level1">
                                             <li class="level2">
                                                 <a href="Product.jsp">Áo Thun Nữ</a>
                                                 <ul class="level2">
                                                     <li class="level3">
                                                         <a href="Product.jsp">Áo Thun Tay Ngắn Nữ</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Áo Thun Tay Dài</a>
                                                     </li>
                                                 </ul>
                                             </li>
                                             <li class="level2">
                                                 <a href="Product.jsp">Áo Sơ Mi Nữ</a>
                                                 <ul class="level2">
                                                     <li class="level3">
                                                         <a href="Product.jsp">Áo Sơ Mi Tay Ngắn Nữ</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Áo Sơ Mi Tay Dài Nữ</a>
                                                     </li>
                                                 </ul>
                                             </li>
                                             <li class="level2">
                                                 <a href="Product.jsp">Quần Short Nữ</a>
                                                 <ul class="level2">
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Short Kaki Nữ</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Short Jean Nữ</a>
                                                     </li>
                                                 </ul>
                                             </li>
                                             <li class="level2">
                                                 <a href="Product.jsp">Quần Dài Nữ</a>
                                                 <ul class="level2">
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Jogger Nữ</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Jean Đơn Giản Nữ</a>
                                                     </li>
                                                     <li class="level3">
                                                         <a href="Product.jsp">Quần Jean Cá Tính Nữ</a>
                                                     </li>
                                                 </ul>
                                             </li>
                                             <li class="level2">
                                                 <a href="Product.jsp">Chân Váy</a>
                                             </li>
                                             <li class="level2"><a href="Product.jsp">Yếm</a></li>
                                         </ul>
                                     </li>
                                     <li class="level1">
                                         <a class="hmega">Đồ Unisex</a>
                                         <ul class="level1">
                                             <li class="level2">
                                                 <a href="Product.jsp">Áo Thun Unisex</a>
                                             </li>
                                         </ul>
                                     </li> -->
                                <%CategoryService.getInstance().CreateCategoryMenuNotMobile(out);%>
                            </ul>
                            <div class="col-4">
                                <a href="#">
                                    <picture>
                                        <img src="./assets/img/product/gif.gif" alt="" width="80%"/>
                                    </picture>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="header_nav-list-item">
                    <a href="news.jsp">Tin tức</a>
                </li>
                <li class="header_nav-list-item">
                    <a href="contact.jsp">Liên hệ</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- end header -->
