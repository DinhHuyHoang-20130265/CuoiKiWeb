<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.cart.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.wishlist.WishList" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %><%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 11/27/2022
  Time: 11:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% SiteUser user = (SiteUser) request.getSession().getAttribute("user");%>
<% Cart cart = (Cart) request.getSession().getAttribute("cart"); %>
<% WishList wishList = (WishList) request.getSession().getAttribute("wishList"); %>

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
                <%
                } else if (user != null) {
                    UserInformation info = UserInformationService.getInstance().getUserInfo(user.getId());
                %>
                <div class="_object">
                    <img src="<%=(UserInformationService.getInstance().getUserInfo(user.getId()).getAvatar_link() != null && !UserInformationService.getInstance().getUserInfo(user.getId()).getAvatar_link().equals("null") && !UserInformationService.getInstance().getUserInfo(user.getId()).getAvatar_link().equals(""))? UserInformationService.getInstance().getUserInfo(user.getId()).getAvatar_link() : "./assets/img/product/noavatar.png"%>"
                         alt=""/>
                </div>
                <div class="_body">Xin
                    chào<br/><%=UserInformationService.getInstance().getUserInfo(user.getId()).getFull_name()%>
                </div>
                <%}%>
            </div>
        </a>
    </div>
    <%if (user == null) {%>
    <ul class="ul-first-menu">
        <li>
            <a href="Login.jsp">Đăng nhập</a>
        </li>
        <li>
            <a href="registration.jsp" class="abc">Đăng kí</a>
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
                    <a href="ProductHistory.jsp">Sản phẩm vừa xem</a>
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
                    <%
                    } else if (user != null) {
                        UserInformation info2 = UserInformationService.getInstance().getUserInfo(user.getId());
                    %>
                    <ul class="nav nav__first right">
                        <li class="nav-item nav-item__first nav-item__first-user">
                            <img src="<%=UserInformationService.getInstance().getUserInfo(user.getId()).getAvatar_link() == null ? "./assets/img/product/noavatar.png" : UserInformationService.getInstance().getUserInfo(user.getId()).getAvatar_link()%>"
                                 alt="" class="nav-item__first-img">
                            <span class="nav-item__first-name"><%=info2.getFull_name()%></span>
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
                    <%
                        }
                    %>
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
                        <%} else {%>
                        <a href="cart.jsp" class="header__second__cart--icon">
                            <i class="fas fa-shopping-cart"></i>
                            <span id="header__second__cart--notice"
                                  class="header__second__cart--notice"><%=cart.getQuantity_cart()%></span>
                        </a>
                        <%}%>
                    </div>
                </div>
                <div class="col-lg-6 m-auto pdt15">
                    <form class="example" action="RedirectSearchInProductPageController">
                        <input type="text" class="input-search" name="search" id="searchProduct"
                               placeholder="Tìm kiếm.." name="search"/>
                        <button type="submit" class="search-btn">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                    <div id="search-result" style="display: none">
                        <ul style="padding: 0; list-style-type: none;overflow: scroll;overflow-x: hidden; max-height: 450px;"
                            class="suggest_search">
                        </ul>
                    </div>
                </div>
                <div class="col-3 m-auto hidden-sm hidden-xs">
                    <div class="item-car clearfix" style="margin-left: 40px">
                        <% if (user == null) {%>
                        <a href="Login.jsp" class="header__second__cart--icon">
                            <i class="fas fa-shopping-cart"></i>
                        </a>
                        <%} else {%>
                        <a href="cart.jsp" class="header__second__cart--icon">
                            <i class="fas fa-shopping-cart"></i>
                            <span id="header__second__cart--notice"
                                  class="header__second__cart--notice"><%=cart.getQuantity_cart()%></span>
                        </a>
                        <%}%>
                    </div>
                    <div class="item-like clearfix" style="">
                        <% if (user == null) {%>
                        <a href="Login.jsp" class="header__second__like--icon">
                            <i class="far fa-heart"></i>
                        </a>
                        <%} else {%>
                        <a href="listlike.jsp" class="header__second__like--icon">
                            <i class="far fa-heart"></i>
                            <span id="header__second__like--notice"
                                  class="header__second__like--notice header_wishlist"><%=wishList.getQuantity()%></span>
                        </a>
                        <%}%>
                    </div>
                    <div class="item-history clearfix open-history" style="border: none; float:right; margin-right: 35px">
                        <a class="header__second__like--icon" style="cursor: pointer">
                            <i class="fas fa-history"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
<%--        <div id="got" class="got">--%>
            <div id="popup" class="popup">
                <span class="close">x</span>
                <div class="popup-content">
                    <table>

                    </table>
                </div>
            </div>
<%--        </div>--%>
    </div>
    <nav class="header_nav hidden-sm hidden-xs">
        <div class="container">
            <ul class="header_nav-list nav">
                <li class="header_nav-list-item">
                    <a href="index.jsp" class="<%=request.getRequestURL().indexOf("index") != -1 ? "active" : "" %>">Trang
                        chủ</a>
                </li>
                <li class="header_nav-list-item">
                    <a href="intro.jsp" class="<%=request.getRequestURL().indexOf("intro") != -1 ? "active" : "" %>">Giới
                        thiệu</a>
                </li>
                <li class="header_nav-list-item has-mega">
                    <a href="Product.jsp?category=all"
                       class="<%=request.getRequestURL().indexOf("category") != -1 ? "active" : "" %>">Sản phẩm<i
                            class="fas fa-angle-right"
                            style="margin-left: 5px"></i></a>
                    <div class="mega-content" style="overflow-x: hidden">
                        <div class="row">
                            <ul class="col-8 no-padding level0">
                                <li class="level1">
                                    <a class="hmega" href="Product.jsp?category=all">Tất cả sản phẩm</a>
                                </li>
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
                    <a href="news.jsp" class="<%=request.getRequestURL().indexOf("news") != -1 ? "active" : "" %>">Tin
                        tức</a>
                </li>
                <li class="header_nav-list-item">
                    <a href="contact.jsp"
                       class="<%=request.getRequestURL().indexOf("contact") != -1 ? "active" : "" %>">Liên hệ</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script>
    $(document).ready(function () {
        $("#searchProduct").focus(function () {
            $("#search-result").css("display", "block")
            $("#searchProduct").on("input", function (e) {
                e.preventDefault();
                const search = this.value
                $(".search-result").css("display", "block");
                if (search.length > 0) {
                    $.ajax({
                        url: "SearchProductController",
                        type: "post",
                        data: {
                            search: search
                        },
                        success: function (data) {
                            if ($.trim(data)) {
                                $(".suggest_search").html(data);
                            } else {
                                $(".suggest_search").html(`
                                <li class="product_suggest">
                                    <a>
                                        <div class="item-info">
                                            <strong class="error" style ="width: max-content; font-size: 16px; text-align: center;">Không tìm thấy sản phẩm</strong>
                                        </div>
                                    </a>
                                </li>`);
                            }
                        }
                    })
                } else {
                    $(".suggest_search").html(`
                    <li class="product_suggest">
                        <a>
                            <div class="item-info">
                                <strong class="error" style="width: max-content; font-size: 16px; text-align: center;">Nhập từ khóa để tìm kiếm sản phẩm</strong>
                            </div>
                        </a>
                    </li>`);
                }
            })
        })
        $("#searchProduct").on("blur", function () {
            if ($(".suggest_search:hover").length !== 0) {
                $("#search-result").css("display", "block")
            } else
                $("#search-result").css("display", "none")
        });
    })
    function loadHistory() {
        const list_history = $(".visited").val();
        const id_prod = $(".id_prod").val();
        $.ajax({
            url: "LoadHistoryController",
            type: "get",
            data: {
                list_history: list_history,
                id_prod: id_prod
            },
            success: function (data) {
                $(".popup-content table").append(data);
            }
        })
    }
    $(document).ready(function () {
        $(".open-history").click(function() {
            $("#popup").fadeIn();
        });
        $(".close").click(function() {
            $("#popup").fadeOut();
        });
        loadHistory();
    })
</script>
<!-- end header -->
