<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.category.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
<%@ page import="java.util.List" %>
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
    <style>
        .product__filter-item {
            margin-right: 25px;
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
            if (role.getTable().equals("product")) {
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
                <h3 class="title"> Thêm/sửa sản phẩm
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
            </div>
            <form name="item">
                <div class="card card-block">
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Tên sản phẩm: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" placeholder="Nhập tên">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Giá: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" placeholder="Nhập giá">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Màu: </label>
                        <div class="col-sm-10">
                            <ul id="color" class="color-box">
                                <li class="product__filter-item">
                                    <label class="form-check-label">
                                        <div class="foo black"><input type="checkbox" class="checkcolor" value="black"
                                                                      style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                                        <div class="foo dark_grey"><input type="checkbox" class="checkcolor" value="darkgrey"
                                                                          style="opacity: 0; width: 20px;height: 20px;float: left;">
                                        </div>
                                        <div class="foo grey"><input type="checkbox" class="checkcolor" value="grey"
                                                                     style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                                        <div class="foo light_blue"><input type="checkbox" class="checkcolor" value="lightblue"
                                                                           style="opacity: 0; width: 20px;height: 20px;float: left;">
                                        </div>
                                        <div class="foo blue"><input type="checkbox" class="checkcolor" value="blue"
                                                                     style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                                        <div class="foo dark_blue"><input type="checkbox" class="checkcolor" value="darkblue"
                                                                          style="opacity: 0; width: 20px;height: 20px;float: left;">
                                        </div>
                                        <div class="foo dark_green"><input type="checkbox" class="checkcolor" value="darkgreen"
                                                                           style="opacity: 0; width: 20px;height: 20px;float: left;">
                                        </div>
                                    </label>
                                    <label class="form-check-label">
                                        <div class="foo green"><input type="checkbox" class="checkcolor" value="green"
                                                                      style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                                        <div class="foo purple"><input type="checkbox" class="checkcolor" value="purple"
                                                                       style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                                        <div class="foo pink"><input type="checkbox" class="checkcolor" value="pink"
                                                                     style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                                        <div class="foo yellow"><input type="checkbox" class="checkcolor" value="yellow"
                                                                       style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                                        <div class="foo orange"><input type="checkbox" class="checkcolor" value="orange"
                                                                       style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                                        <div class="foo red"><input type="checkbox" class="checkcolor" value="red"
                                                                    style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                                        <div class="foo brown"><input type="checkbox" class="checkcolor" value="brown"
                                                                      style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Size: </label>
                        <div class="col-sm-10">
                            <ul id="size" class="size-box" style="display: inline-flex; padding-left: 20px;">
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check1">
                                        <input type="checkbox" class="form-check-input checksize" id="check1"
                                               name="option2"><span>S</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check2">
                                        <input type="checkbox" class="form-check-input checksize" id="check2"
                                               name="option2"><span>M</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check3">
                                        <input type="checkbox" class="form-check-input checksize" id="check3"
                                               name="option2"><span>L</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check4">
                                        <input type="checkbox" class="form-check-input checksize" id="check4"
                                               name="option2"><span>XL</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check5">
                                        <input type="checkbox" class="form-check-input checksize" id="check5"
                                               name="option2"><span>2XL</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check6">
                                        <input type="checkbox" class="form-check-input checksize" id="check6"
                                               name="option2"><span>28</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check7">
                                        <input type="checkbox" class="form-check-input checksize" id="check7"
                                               name="option2"><span>29</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check8">
                                        <input type="checkbox" class="form-check-input checksize" id="check8"
                                               name="option2"><span>30</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check9">
                                        <input type="checkbox" class="form-check-input checksize" id="check9"
                                               name="option2"><span>31</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check10">
                                        <input type="checkbox" class="form-check-input checksize" id="check10"
                                               name="option2"><span>32</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check11">
                                        <input type="checkbox" class="form-check-input checksize" id="check11"
                                               name="option2"><span>34</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check12">
                                        <input type="checkbox" class="form-check-input checksize" id="check12"
                                               name="option2"><span>36</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Nhập loại sản phẩm: </label>
                        <div class="col-sm-10" style="">
                            <select class="c-select form-control" onfocus='this.size=5;' onblur='this.size=1;' onchange='this.size=1; this.blur();'>
                                <%List<Category> cate = CategoryService.getInstance().getAllCate();%>
                                <%for (Category c : cate) {%>
                                <option value="<%=c.getId()%>"><%=c.getCate_name()%></option>
                                <%}%>
                                <option value="other">Khác</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Mô tả nhanh: </label>
                        <div class="col-sm-10">
                            <textarea id ="description" name="description" rows="4" cols="75"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Mô tả: </label>
                        <div class="col-sm-10">
                            <div id="editor">
                            </div>
                            <script>
                                CKEDITOR.replace('editor');
                            </script>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Hình ảnh: </label>
                        <div class="col-sm-10">
                            <div class="images-container">
                                <form action="UploadControler" method="post" enctype="multipart/form-data">
                                    <input type="file" name="files" multiple="true"/>
                                    <input type="submit" />
                                </form>
                                <div class="image-container">
                                    <div class="controls">
                                        <a href="" class="control-btn move">
                                            <i class="fa fa-arrows"></i>
                                        </a>
                                        <a href="" class="control-btn star">
                                            <i class="fa"></i>
                                        </a>
                                        <a href="#" class="control-btn remove" data-toggle="modal"
                                           data-target="#confirm-modal">
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </div>
                                    <div class="image"
                                         style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')">
                                        Ảnh chính
                                    </div>
                                </div>
                                <div class="image-container">
                                    <div class="controls">
                                        <a href="" class="control-btn move">
                                            <i class="fa fa-arrows"></i>
                                        </a>
                                        <a href="" class="control-btn star">
                                            <i class="fa"></i>
                                        </a>
                                        <a href="#" class="control-btn remove" data-toggle="modal"
                                           data-target="#confirm-modal">
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </div>
                                    <div class="image"
                                         style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg')">
                                    </div>
                                </div>
                                <div class="image-container">
                                    <div class="controls">
                                        <a href="" class="control-btn move">
                                            <i class="fa fa-arrows"></i>
                                        </a>
                                        <a href="" class="control-btn star">
                                            <i class="fa"></i>
                                        </a>
                                        <a href="#" class="control-btn remove" data-toggle="modal"
                                           data-target="#confirm-modal">
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </div>
                                    <div class="image"
                                         style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/eduardo_olv/128.jpg')">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-10 col-sm-offset-2">
                            <button type="submit" class="btn btn-primary"> Lưu</button>
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
        if ($(this).val() == 'other') {
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
    $("button[type='submit']").click(function () {
        const data = CKEDITOR.instances.editor.getData();
        console.log(data)
    })
</script>
</body>

</html>
<%
        }
    }
%>