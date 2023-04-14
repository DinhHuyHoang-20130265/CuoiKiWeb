<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.category.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductImage" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.promotion.Promotion" %>
<%@ page import="vn.edu.hcmuaf.fit.services.PromotionService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 1/7/2023
  Time: 8:06 AM
  To change this template use File | Settings | File Templates.
--%>
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
    <style>
        .product__filter-item {
            margin-right: 25px;
        }

        .input-file {
            color: transparent;
            width: 100%;
            height: 100%;
        }

        .input-file::before {
            content: 'Upload ảnh';
            color: black;
            display: inline-block;
            outline: none;
            white-space: nowrap;
            -webkit-user-select: none;
            cursor: pointer;
            font-weight: 600;
            font-size: 10pt;
            margin-left: 30px;
            margin-right: 30px;
        }

        .input-file:hover::before {
            border-color: black;
        }

        .input-file:active {
            outline: 0;
        }

        .input-file::-webkit-file-upload-button {
            visibility: hidden;
        }
    </style>
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
    <script src="ckeditor/ckeditor.js"></script>
    <script src="ckfinder/ckfinder.js"></script>
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
            if (role.getTable().equals("sales")) {
                if (role.getPermission().equals("insert") || (role.getPermission().equals("update") && request.getParameter("id") != null))
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
                <h3 class="title"> Sửa khuyến mãi
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%} else {%>
                <h3 class="title"> Thêm khuyến mãi
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%}%>
            </div>
            <%
                Promotion promo = null;
                if (request.getParameter("id") != null)
                    promo = PromotionService.getInstance().getPromotionHiddenAndDetails(request.getParameter("id"));
            %>
            <form name="item" method="post" enctype="multipart/form-data">
                <input type="text" id="idEdit"
                       value="<%=request.getParameter("id") == null ? "" : request.getParameter("id")%>"
                       style="display: none">
                <input type="text" id="userid"
                       value="<%=((AdminUser) request.getSession().getAttribute("userAdmin")).getId()%>"
                       style="display:none;">
                <div class="card card-block">
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Tên KM: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="name"
                                   id="name" value="<%=(promo != null) ? promo.getName_prom() : ""%>"
                                   placeholder="Nhập tên">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Chọn id sản phẩm: </label>
                        <div class="col-sm-10" style="">
                            <select class="c-select form-control" name="select-cate" id="select-cate"
                                    onfocus='this.size=5;' onblur='this.size=1;'
                                    onchange='this.size=1; this.blur();'>
                                <%
                                    List<Product> products = ProductService.getInstance().loadAllProductContainStatus();
                                    for (Product p : products) { %>
                                <option value="<%=p.getId()%>" <%=(promo != null) ? "selected" : ""%>><%=p.getId()%>
                                </option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Mô tả KM: </label>
                        <div class="col-sm-10">
                            <textarea id="editor">
                                <%=(promo != null) ? promo.getDesc_prom() : ""%>
                            </textarea>
                            <script>
                                CKEDITOR.replace('editor');
                            </script>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Tỉ lệ KM: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="discount_rate"
                                   id="discount_rate" value="<%=(promo != null) ? promo.getDiscount_rate() : ""%>"
                                   placeholder="Nhập tỉ lệ khuyến mãi">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Hiển thị: </label>
                        <div class="col-sm-10" style="">
                            <select class="c-select form-control" id="select-status">
                                <% int status = 1;
                                    if (promo != null)
                                        status = promo.getStatus();%>
                                <option value="1" <%=(status == 1) ? "selected" : ""%>>Hiển
                                    thị
                                </option>
                                <option value="0" <%=(status == 0) ? "selected" : ""%>>Ẩn
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Ngày bắt đầu: </label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control boxed" name="start_date"
                                   id="start_date" value="<%=(promo != null) ? promo.getStart_date() : ""%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Ngày kết thúc: </label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control boxed" name="end_date"
                                   id="end_date" value="<%=(promo != null) ? promo.getEnd_date() : ""%>">
                        </div>
                    </div>
                    <input type="text" id="deletedFile" value="" style="display: none">
                    <div class="form-group row">
                        <div class="col-sm-10 col-sm-offset-2">
                            <%if (request.getParameter("id") != null) {%>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                            <% } else {%>
                            <button type="submit" class="btn btn-primary">Thêm</button>
                            <%}%>
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
<script>
    const idPromo = $("#idEdit").val();
    if (idPromo.length > 0) {
        $(".remove").each(function () {
            const id = this.id.substring(6);
            removeFilesData(id)
        })
    } else {
        removeFilesData(1)
    }
</script>
<script>
    $("button[type='submit']").click(function (e) {
        e.preventDefault();
        const id = $("#idEdit").val();
        const name = $("#name").val();
        const discount_rate = $("#discount_rate").val();
        const idProduct = $('#select-cate').find(":selected").val();
        const status = $("#select-status").find(":selected").val();
        const content = CKEDITOR.instances.editor.getData();
        const start_date = $("#start_date").val();
        const end_date = $("#end_date").val();
        if (start_date > end_date) {
            alert("Ngày kết thúc không được bé hơn ngày bắt đầu!!")
            return false;
        }
        $.ajax({
            url: "/CuoiKiWeb_war/EditInsertPromotionController",
            type: "GET",
            data: {
                id: id,
                name: name,
                discount_rate: discount_rate,
                status: status,
                idProduct: idProduct,
                content: content,
                start_date: start_date,
                end_date: end_date
            },
            success: function () {
                if (id.length < 1)
                    alert("Thêm khuyến mãi thành công");
                else
                    alert("Cập nhật khuyến mãi thành công");
                window.location.href = "promotion-list.jsp"
            }
        })
    })
</script>
</body>

</html>
<%
        }
    }
%>