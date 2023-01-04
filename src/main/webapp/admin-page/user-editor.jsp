<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.AccountService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.MD5" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> Trang Quản Lý </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->
    <link rel="stylesheet" href="css/vendor.css">
    <!-- Theme initialization -->
    <script>
        var themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
            {};
        var themeName = themeSettings.themeName || '';
        if (themeName) {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app-' + themeName + '.css">');
        } else {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app.css">');
        }
    </script>
</head>

<body>
<%

    //----------------------Kiểm tra thử đăng nhập hay chưa--------------------//
    if (request.getSession().getAttribute("userAdmin") == null) {
        // Sendredirect tới login
        response.sendRedirect("login.jsp");

    } else {
        AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
        boolean check = false;
        for (AdminRole role : admin.getRole()) {
            if (role.getTable().equals("user")) {
                if (role.getPermission().equals("insert") || role.getPermission().equals("update"))
                    check = true;
            }
        }
        if (!check) {
            response.sendRedirect("index.jsp");
        } else {
%>
<div class="main-wrapper">
    <div class="app" id="app">
        <jsp:include page="Layout/_LayoutAdminHeader.jsp"></jsp:include>
        <jsp:include page="Layout/_LayoutAdminSideBar.jsp"></jsp:include>
        <article class="content item-editor-page">
            <div class="title-block">
                <%if (request.getParameter("id") != null) {%>
                <h3 class="title"> Sửa thông tin tài khoản
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%} else {%>
                <h3 class="title"> Thêm tài khoản
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%}%>
            </div>
            <form name="item">
                <input type="text" id="userId"
                       value="<%=request.getParameter("id") == null ? "" : request.getParameter("id")%>"
                       style="display: none">
                <div class="card card-block">
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Tên người dùng: </label>
                        <div class="col-sm-10">
                            <input type="text"
                                   value="<%=request.getParameter("id") != null ? UserInformationService.getInstance().getUserInfo(request.getParameter("id")).getFull_name() : ""%>"
                                   id="name" name="name" class="form-control boxed" placeholder="Nhập tên">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Email: </label>
                        <div class="col-sm-10">
                            <input type="email"
                                   value="<%=request.getParameter("id") != null ? UserInformationService.getInstance().getUserInfo(request.getParameter("id")).getEmail() : ""%>"
                                   id="email" name="email" class="form-control boxed"
                                   placeholder="Nhập email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Tên đăng nhập: </label>
                        <div class="col-sm-10">
                            <input value="<%=request.getParameter("id") != null ? AccountService.getInstance().getAccountById(request.getParameter("id")).getUsername() : ""%>"
                                   type="text" name="username" id=username style="width:200px"
                                   class="form-control boxed"
                                   placeholder="Nhập username">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Password: </label>
                        <div class="col-sm-10">
                            <input
                                    value="<%=request.getParameter("id") != null ? AccountService.getInstance().getAccountById(request.getParameter("id")).getPass() : ""%>"
                                    type="password" name="password" id="password" style="width:200px"
                                    class="form-control boxed"
                                    placeholder="Nhập password">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Địa chỉ: </label>
                        <div class="col-sm-10">
                            <input
                                    value="<%=request.getParameter("id") != null ? UserInformationService.getInstance().getUserInfo(request.getParameter("id")).getAddress() : ""%>"
                                    type="text" name="address" id="address" class="form-control boxed"
                                    placeholder="Nhập...">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Loại tài khoản </label>
                        <div class="col-sm-10" style="">
                            <select class="c-select form-control" name="select-cate" id="select-cate"
                                    onfocus='this.size=2;' onblur='this.size=1;'
                                    onchange='this.size=1; this.blur();'>
                                <% if (request.getParameter("id") != null) {
                                    if (AccountService.getInstance().getAccountRole(request.getParameter("id")) == 1) { %>
                                <option value="0">Tài khoản người dùng
                                </option>
                                <option value="1" selected>Tài khoản quản lý
                                </option>
                                <% } else if (AccountService.getInstance().getAccountRole(request.getParameter("id")) == 0) { %>
                                <option value="0" selected>Tài khoản người dùng
                                </option>
                                <option value="1">Tài khoản quản lý
                                </option>
                                <%
                                    }
                                } else {
                                %>
                                <option value="0">Tài khoản người dùng
                                </option>
                                <option value="1">Tài khoản quản lý
                                </option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row" id="role" style="display: <%=AccountService.getInstance().getAccountRole(request.getParameter("id")) == 1 ? "flex" : "none"%>">
                        <label class="col-sm-2 form-control-label text-xs-right"> Vai trò: </label>
                        <div class="col-sm-10" style="display: block">
                            <div class="role-select" id="role-select1" style="display: flex">
                                <select class="c-select form-control" name="select-role1" id="select-role1">
                                    <option value="null">Không có
                                    </option>
                                    <option value="user">Tài khoản
                                    </option>
                                    <option value="product"> Sản phẩm
                                    </option>
                                    <option value="comment" >Bình luận/Đánh giá
                                    </option>
                                    <option value="blog" >Tin tức
                                    </option>
                                    <option value="order" >Đơn hàng
                                    </option>
                                    <option value="category">Danh mục
                                    </option>
                                    <option value="slider">Banner
                                    </option>
                                </select>
                                <select class="c-select form-control" name="select-permission1" id="select-permission1">
                                    <option value="null">Không
                                    </option>
                                    <option value="insert">Thêm
                                    </option>
                                    <option value="update">Sửa
                                    </option>
                                    <option value="delete" >Xóa
                                    </option>
                                </select>
                                <button type="button" name="remove" id="remove"><i class="fa fa-times"></i></button>
                            </div>
                            <div class="role-select" id="role-select1" style="display: flex">
                                <select class="c-select form-control" name="select-role1" id="select-role1">
                                    <option value="null">Không có
                                    </option>
                                    <option value="user">Tài khoản
                                    </option>
                                    <option value="product"> Sản phẩm
                                    </option>
                                    <option value="comment" >Bình luận/Đánh giá
                                    </option>
                                    <option value="blog" >Tin tức
                                    </option>
                                    <option value="order" >Đơn hàng
                                    </option>
                                    <option value="category">Danh mục
                                    </option>
                                    <option value="slider">Banner
                                    </option>
                                </select>
                                <select class="c-select form-control" name="select-permission1" id="select-permission1">
                                    <option value="null">Không
                                    </option>
                                    <option value="insert">Thêm
                                    </option>
                                    <option value="update">Sửa
                                    </option>
                                    <option value="delete" >Xóa
                                    </option>
                                </select>
                                <button type="button" name="remove" id="remove"><i class="fa fa-times"></i></button>
                            </div>
                            <button type="button" name="remove" id="remove"><i class="fa fa-plus"></i></button>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Ảnh đại diện: </label>
                        <div class="col-sm-10">
                            <div class="images-container">
                                <div class="image-container">
                                    <div class="image" id="container1">
                                        <div class="controls">
                                            <a id="remove1" class="control-btn remove"
                                               style="display: flex !important;width: 136px;justify-content: center;align-items: center;">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>
                                        <img class='img-product-review' src=''
                                             style='height: 100%'>
                                    </div>
                                </div>
                                <div class="image-container">
                                    <div class="image" id="container">
                                        <input type="file" id="image" name="files" class="input-file"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-10 col-sm-offset-2">
                            <%if (request.getParameter("id") != null) {%>
                            <button type="submit" class="btn btn-primary"> Lưu</button>
                            <% } else { %>
                            <button type="submit" class="btn btn-primary"> Thêm</button>
                            <% } %>
                        </div>
                    </div>
                </div>
            </form>
        </article>
    </div>
</div>
<!-- Reference block for JS -->
<div class="ref" id="ref">
    <div class="color-primary"></div>
    <div class="chart">
        <div class="color-primary"></div>
        <div class="color-secondary"></div>
    </div>
</div>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
    ga('create', 'UA-80463319-4', 'auto');
    ga('send', 'pageview');
</script>
<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
<script>
    $('.foo').click(function () {
        $(this).toggleClass('active');
    })
    $('.size').click(function () {
        $(this).toggleClass('active');
    })
</script>
<script>
    $('select').on('change', function (e) {
        e.preventDefault();
        const optionSelected = $("option:selected", this);
        const valueSelected = this.value;
        if (valueSelected === "1") {

        }
    });
    $('.form-control').on('change', function () {
        if ($(this).val() === 'other') {
            $(this).after('<input placeholder="Nhập..." type="text" name="' + $(this).attr('name') + '" class="otherInput form-control boxed" style="width:50% !important; margin-top:5px;border: 1px solid #ced4da;border-radius: 0.25rem;"/>');
        } else {
            if ($(this).next().is('input.otherInput')) {
                $(this).next().remove();
            }
            ;
        }
        ;
    });
</script>
</body>

</html>
<%
        }
    }
%>