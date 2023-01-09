<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.category.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductColor" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductSize" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductImage" %>
<%@ page import="java.util.Arrays" %>
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
            if (role.getTable().equals("product")) {
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
                <h3 class="title"> Sửa sản phẩm
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%} else {%>
                <h3 class="title"> Thêm sản phẩm
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%}%>
            </div>
            <%
                Product p = null;
                if (request.getParameter("id") != null)
                    p = ProductService.getInstance().getProductHiddenAndDetails(request.getParameter("id"));
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
                        <label class="col-sm-2 form-control-label text-xs-right"> Tên sản phẩm: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="name"
                                   id="name" value="<%=(p != null) ? p.getProd_name() : ""%>" placeholder="Nhập tên">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Giá: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="price" id="price"
                                   value="<%=(p != null) ? p.getPrice() : ""%>" placeholder="Nhập giá">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Màu: </label>
                        <div class="col-sm-10">
                            <ul id="color" class="color-box">
                                <li class="product__filter-item">
                                    <%
                                        List<ProductColor> colors = null;
                                        if (p != null)
                                            colors = p.getColors();
                                        String colortemp = "";
                                        if (colors != null) {
                                            for (ProductColor color1 : colors) {
                                                colortemp += color1.getColor_name() + ",";
                                            }
                                        }
                                        String[] color = colortemp.split(",");
                                        List<String> colorcheck = Arrays.asList(color);
                                    %>
                                    <label class="form-check-label">
                                        <div class="foo black <%=(p!= null && colorcheck.contains("black")) ? "active" : ""%>">
                                            <input type="checkbox" class="checkcolor" value="black"
                                                   style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("black")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo dark_grey <%=(p!= null && colorcheck.contains("darkgrey")) ? "active" : ""%>">
                                            <input type="checkbox" class="checkcolor"
                                                   value="darkgrey"
                                                   style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("darkgrey")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo grey <%=( p!= null && colorcheck.contains("grey")) ? "active" : ""%>">
                                            <input
                                                    type="checkbox" class="checkcolor" value="grey"
                                                    style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("grey")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo light_blue <%=(p!= null && colorcheck.contains("lightblue")) ? "active" : ""%>">
                                            <input type="checkbox" class="checkcolor"
                                                   value="lightblue"
                                                   style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("lightblue")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo blue <%=(p!= null && colorcheck.contains("blue")) ? "active" : ""%>">
                                            <input
                                                    type="checkbox" class="checkcolor" value="blue"
                                                    style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("blue")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo dark_blue <%=(p!= null && colorcheck.contains("darkblue")) ? "active" : ""%>">
                                            <input type="checkbox" class="checkcolor"
                                                   value="darkblue"
                                                   style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("darkblue")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo dark_green <%=(p!= null && colorcheck.contains("darkgreen")) ? "active" : ""%>">
                                            <input type="checkbox" class="checkcolor"
                                                   value="darkgreen"
                                                   style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("darkgreen")) ? "checked" : ""%>>
                                        </div>
                                    </label>
                                    <label class="form-check-label">
                                        <div class="foo green <%=(p!= null && colorcheck.contains("green")) ? "active" : ""%>">
                                            <input type="checkbox" class="checkcolor" value="green"
                                                   style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("green")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo purple <%=(p!= null && colorcheck.contains("purple")) ? "active" : ""%>">
                                            <input type="checkbox" class="checkcolor" value="purple"
                                                   style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("purple")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo pink <%=(p!= null && colorcheck.contains("pink")) ? "active" : ""%>">
                                            <input
                                                    type="checkbox" class="checkcolor" value="pink"
                                                    style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("pink")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo yellow <%=(p!= null && colorcheck.contains("yellow")) ? "active" : ""%>">
                                            <input type="checkbox" class="checkcolor" value="yellow"
                                                   style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("yellow")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo orange <%=(p!= null && colorcheck.contains("orange")) ? "active" : ""%>">
                                            <input type="checkbox" class="checkcolor" value="orange"
                                                   style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("orange")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo red <%=(p!= null && colorcheck.contains("red")) ? "active" : ""%>">
                                            <input
                                                    type="checkbox" class="checkcolor" value="red"
                                                    style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("red")) ? "checked" : ""%>>
                                        </div>
                                        <div class="foo brown <%=(p!= null && colorcheck.contains("brown")) ? "active" : ""%>">
                                            <input type="checkbox" class="checkcolor" value="brown"
                                                   style="opacity: 0; width: 20px;height: 20px;float: left;" <%=(p!= null && colorcheck.contains("brown")) ? "checked" : ""%>>
                                        </div>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Size: </label>
                        <%
                            List<ProductSize> sizes = null;
                            if (p != null)
                                sizes = p.getSizes();
                            String sizetemp = "";
                            if (sizes != null) {
                                for (ProductSize size1 : sizes) {
                                    sizetemp += size1.getSize_name() + ",";
                                }
                            }
                            String[] size = sizetemp.split(",");
                            List<String> sizecheck = Arrays.asList(size);
                        %>
                        <div class="col-sm-10">
                            <ul id="size" class="size-box" style="display: inline-flex; padding-left: 20px;">
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check1">
                                        <input type="checkbox" class="form-check-input checksize" id="check1"
                                               name="option2" <%=(p!= null && sizecheck.contains("S")) ? "checked" : ""%>><span>S</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check2">
                                        <input type="checkbox" class="form-check-input checksize" id="check2"
                                               name="option2" <%=(p!= null && sizecheck.contains("M")) ? "checked" : ""%>><span>M</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check3">
                                        <input type="checkbox" class="form-check-input checksize" id="check3"
                                               name="option2" <%=(p!= null && sizecheck.contains("L")) ? "checked" : ""%>><span>L</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check4">
                                        <input type="checkbox" class="form-check-input checksize" id="check4"
                                               name="option2" <%=(p!= null && sizecheck.contains("XL")) ? "checked" : ""%>><span>XL</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check5">
                                        <input type="checkbox" class="form-check-input checksize" id="check5"
                                               name="option2" <%=(p!= null && sizecheck.contains("2XL")) ? "checked" : ""%>><span>2XL</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check6">
                                        <input type="checkbox" class="form-check-input checksize" id="check6"
                                               name="option2" <%=(p!= null && sizecheck.contains("28")) ? "checked" : ""%>><span>28</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check7">
                                        <input type="checkbox" class="form-check-input checksize" id="check7"
                                               name="option2" <%=(p!= null && sizecheck.contains("29")) ? "checked" : ""%>><span>29</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check8">
                                        <input type="checkbox" class="form-check-input checksize" id="check8"
                                               name="option2" <%=(p!= null && sizecheck.contains("30")) ? "checked" : ""%>><span>30</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check9">
                                        <input type="checkbox" class="form-check-input checksize" id="check9"
                                               name="option2" <%=(p!= null && sizecheck.contains("31")) ? "checked" : ""%>><span>31</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check10">
                                        <input type="checkbox" class="form-check-input checksize" id="check10"
                                               name="option2" <%=(p!= null && sizecheck.contains("32")) ? "checked" : ""%>><span>32</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check11">
                                        <input type="checkbox" class="form-check-input checksize" id="check11"
                                               name="option2" <%=(p!= null && sizecheck.contains("34")) ? "checked" : ""%>><span>34</span>
                                    </label>
                                </li>
                                <li class="product__filter-item">
                                    <label class="form-check-label" for="check12">
                                        <input type="checkbox" class="form-check-input checksize" id="check12"
                                               name="option2" <%=(p!= null && sizecheck.contains("36")) ? "checked" : ""%>><span>36</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Nhập loại sản phẩm: </label>
                        <div class="col-sm-10" style="">
                            <select class="c-select form-control" name="select-cate" id="select-cate"
                                    onfocus='this.size=5;' onblur='this.size=1;'
                                    onchange='this.size=1; this.blur();'>
                                <%
                                    List<Category> cate = CategoryService.getInstance().getAllCate();
                                    Category cat = null;
                                    if (p != null) {
                                        for (Category c : p.getCategories()) {
                                            if (c.getParent_id() == null)
                                                cat = c;
                                        }
                                    }
                                    ;
                                %>
                                <%for (Category c : cate) {%>
                                <option value="<%=c.getId()%>" <%=(cat != null && c.getId().equals(cat.getId())) ? "selected" : ""%>><%=c.getCate_name()%>
                                </option>
                                <%}%>
                                <option value="other">Khác</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Hiển thị: </label>
                        <div class="col-sm-10" style="">
                            <select class="c-select form-control" id="select-status">
                                <% int status = 0;
                                    if (p != null)
                                        status = p.getProd_status();%>
                                <option value="1" <%=(status == 1) ? "selected" : ""%>>Hiển
                                    thị
                                </option>
                                <option value="0" <%=(status == 0) ? "selected" : ""%>>Ẩn
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Số lượng tồn kho: </label>
                        <div class="col-sm-10" style="">
                            <input type="number" class="form-control boxed" name="quantity"
                                   id="quantity" placeholder="Nhập số lượng" min="0"
                                   value="<%=(p!= null )? p.getQuantity() : ""%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Mô tả nhanh: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" id="description" name="description"
                                   value="<%=(p != null) ? p.getProd_desc() : ""%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Mô tả: </label>
                        <div class="col-sm-10">
                            <textarea id="editor">
                                <%=(p != null) ? p.getContent() : ""%>
                            </textarea>
                            <script>
                                CKEDITOR.replace('editor');
                            </script>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Hình ảnh: </label>
                        <div class="col-sm-10">
                            <div class="images-container">
                                <% int i = 0;
                                    if (p != null) {
                                        if (p.getMain_img_link() != null) {%>
                                <div class="image-container">
                                    <div class="image" id="container<%=i%>">
                                        <div class="controls">
                                            <a id="remove<%=i%>" class="control-btn remove"
                                               style="display: flex !important;width: 136px;justify-content: center;align-items: center;">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>
                                        <img class='img-product-review' src='<%=p.getMain_img_link()%>'
                                             style='height: 100%'>
                                    </div>
                                </div>
                                <%
                                            i++;
                                        }
                                    }
                                %>
                                <% if (p != null) {
                                    if (p.getImages() != null) {
                                        for (ProductImage img : p.getImages()) { %>
                                <div class="image-container">
                                    <div class="image" id="container<%=i%>">
                                        <div class="controls">
                                            <a id="remove<%=i%>" class="control-btn remove"
                                               style="display: flex !important;width: 136px;justify-content: center;align-items: center;">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>
                                        <img class='img-product-review' src='<%=img.getProd_img_link()%>'
                                             style='height: 100%'>
                                    </div>
                                </div>
                                <%
                                                i++;
                                            }
                                        }
                                    }
                                %>
                                <div class="image-container">
                                    <div class="image" id="container<%=i%>">
                                        <input type="file" id="image<%=i%>" name="files" class="input-file"/>
                                    </div>
                                </div>
                            </div>
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
    const idProduct = $("#idEdit").val();
    if (idProduct.length > 0) {
        $(".remove").each(function () {
            const id = this.id.substring(6);
            removeFilesData(id)
        })
    } else {
        removeFilesData(1)
    }

    function reloadUpLoadFile() {
        $(".input-file").each(function () {
            $(this).on('change', function (e) {
                const idName = $(this).attr("id");
                const id = idName.substr(5);
                const value = $(this).val();
                let name = "";
                if (value.indexOf("\\") != -1)
                    name = value.substring(value.lastIndexOf("\\") + 1);
                else
                    name = value.substring(value.lastIndexOf("/") + 1);
                uploadFile(id, name, e)
            })
        });
    }

    $(".input-file").each(function () {
        $(this).on('change', function (e) {
            const idName = $(this).attr("id");
            const id = idName.substr(5);
            const value = $(this).val();
            let name = "";
            if (value.indexOf("\\") != -1)
                name = value.substring(value.lastIndexOf("\\") + 1);
            else
                name = value.substring(value.lastIndexOf("/") + 1);
            uploadFile(id, name, e)
        })
    });

    function uploadFile(id, name, event) {
        event.stopPropagation();
        event.preventDefault();
        const files = event.target.files;
        const data = new FormData();
        $.each(files, function (key, value) {
            data.append(key, value);
        });
        postFilesData(id, name, data);
    }

    function removeFilesData(idDelete) {
        $("#remove" + idDelete).on("click", function (e) {
            e.preventDefault();
            const id = this.id.substring(6);
            const src = $("#container" + id + " .img-product-review").attr("src");
            let imageName = "";
            if (src.indexOf("\\") != -1)
                imageName = src.substring(src.lastIndexOf("\\") + 1);
            else
                imageName = src.substring(src.lastIndexOf("/") + 1);
            $("#container" + id).parent().remove();
            const value = $("#deletedFile").val();
            if (value.length > 0)
                $("#deletedFile").val($("#deletedFile").val() + imageName + ",");
            else
                $("#deletedFile").val(imageName + ",");
            console.log($("#deletedFile").val());
        });
    }

    function postFilesData(id, name, data) {
        let bool = false;
        $(".img-product-review").each(function () {
            let nameFile = $(this).attr("src");
            if (nameFile.indexOf(name) != -1) {
                bool = true;
            }
        })
        if (bool === false) {
            $.ajax({
                url: '/CuoiKiWeb_war/UpDownImageProductController',
                type: 'POST',
                data: data,
                cache: false,
                dataType: 'json',
                processData: false,
                contentType: false,
                success: function (data, textStatus, jqXHR) {
                    //success
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $("#container" + id).prepend("<img class='img-product-review' src='http://localhost:8080/CuoiKiWeb_war/assets/imgProduct/images/" + name + "' style='height: 100%'>");
                    $(".images-container #container" + id).prepend(`<div class="controls">
                                            <a id="remove` + id + `" class="control-btn remove" style="display: flex !important;width: 136px;justify-content: center;align-items: center;">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>`)
                    $(".images-container").append(` <div class="image-container">
                                    <div class="image" id="container` + (parseInt(id) + 1) + `">
                                        <input type="file" id="image` + (parseInt(id) + 1) + `" name="files" class="input-file"/>
                                    </div>
                                </div>
                     `)
                    let value = $("#deletedFile").val();
                    if (value.indexOf(name) !== -1) {
                        value = value.replace(name + ",", "");
                        $("#deletedFile").val(value);
                    }
                    console.log($("#deletedFile").val());
                    reloadUpLoadFile();
                    removeFilesData(id);

                }
            });
        } else {
            alert("Bạn đã upload ảnh này rồi !")
        }
    }
</script>
<script>
    $("button[type='submit']").click(function (e) {
        e.preventDefault();
        const userID = $("#userid").val();
        const quantity = $("#quantity").val();
        const id = $("#idEdit").val();
        const name = $("#name").val();
        const price = $("#price").val();
        const size = $("input[type='checkbox']:checked.checksize");
        let stringSize = [];
        size.each(function () {
            stringSize.push($(this).parent().children("span").text());
        });
        let stringColor = [];
        const color = $("input[type='checkbox']:checked.checkcolor");
        color.each(function () {
            stringColor.push(this.value);
        });
        const idCate = $('#select-cate').find(":selected").val();
        const status = $("#select-status").find(":selected").val();
        const desc = $('#description').val();
        const content = CKEDITOR.instances.editor.getData();
        let imgFile = []
        $(".img-product-review").each(function () {
            let nameFile = $(this).attr("src");
            if (nameFile.indexOf("\\") != -1)
                imgFile.push(nameFile.substring(nameFile.lastIndexOf("\\") + 1));
            else
                imgFile.push(nameFile.substring(nameFile.lastIndexOf("/") + 1));
        })
        const removed = $("#deletedFile").val();
        const oldImg = removed.substring(0, removed.length - 1);
        $.ajax({
            url: "/CuoiKiWeb_war/EditInsertProductController",
            type: "GET",
            data: {
                userid: userID,
                quantity: quantity,
                oldImg: oldImg,
                id: id,
                name: name,
                price: price,
                status: status,
                size: stringSize,
                color: stringColor,
                idCate: idCate,
                desc: desc,
                content: content,
                imgFile: imgFile,
            },
            success: function () {
                if (id.length < 1)
                    alert("Thêm sản phẩm thành công");
                else
                    alert("Cập nhật sản phẩm thành công");
                window.location.href = "items-list.jsp"
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