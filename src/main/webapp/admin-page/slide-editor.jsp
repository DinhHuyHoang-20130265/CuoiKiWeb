<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.category.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.slide.Slide" %>
<%@ page import="vn.edu.hcmuaf.fit.services.SlideService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
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
        boolean check = true;
        for (AdminRole role : admin.getRole()) {
            if (role.getTable().equals("slider") || role.getTable().equals("admin")) {
                if (role.getPermission().equals("admin") || role.getPermission().equals("insert") || (role.getPermission().equals("update") && request.getParameter("id") != null))
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
                <h3 class="title"> Sửa slide
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%} else {%>
                <h3 class="title"> Thêm slide
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%}%>
            </div>
            <input type="text" id="userid"
                   value="<%=((AdminUser) request.getSession().getAttribute("userAdmin")).getId()%>"
                   style="display:none;">
            <%
                Slide slide = null;
                if (request.getParameter("id") != null)
                    slide = SlideService.getInstance().getSlideHiddenAndDetails(request.getParameter("id"));
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
                        <label class="col-sm-2 form-control-label text-xs-right"> Hiển thị: </label>
                        <div class="col-sm-10" style="">
                            <select class="c-select form-control" id="select-status">
                                <% int status = 1;
                                    if (slide != null)
                                        status = slide.getSlide_status();%>
                                <option value="1" <%=(status == 1) ? "selected" : ""%>>Hiển
                                    thị
                                </option>
                                <option value="0" <%=(status == 0) ? "selected" : ""%>>Ẩn
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Mô tả: </label>
                        <div class="col-sm-10">
                            <textarea id="editor">
                                <%=(slide != null) ? slide.getSlide_desc() : ""%>
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
                                <% if (request.getParameter("id") == null) { %>
                                <div class="image-container">
                                    <div class="image" id="container">
                                        <input type="file" id="image" name="files" class="input-file"/>
                                    </div>
                                </div>
                                <% } else { %>
                                <div class="image-container">
                                    <div class="image" id="container">
                                        <div class="controls">
                                            <a id="removeImg" class="control-btn remove"
                                               style="display: flex !important;width: 136px;justify-content: center;align-items: center;">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>
                                        <img class='img-product-review'
                                             src='<%=slide.getSlide_link()%>'
                                             style='height: 100%'>
                                    </div>
                                </div>
                                <%
                                    } %>
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
    $(".input-file").on('change', function (e) {
        const value = $(this).val();
        let name = "";
        if (value.indexOf("\\") != -1)
            name = value.substring(value.lastIndexOf("\\") + 1);
        else
            name = value.substring(value.lastIndexOf("/") + 1);
        uploadFile(name, e)
    });

    function uploadImage() {
        $(".input-file").on('change', function (e) {
            const value = $(this).val();
            let name = "";
            if (value.indexOf("\\") != -1)
                name = value.substring(value.lastIndexOf("\\") + 1);
            else
                name = value.substring(value.lastIndexOf("/") + 1);
            uploadFile(name, e)
        });
    }

    function uploadFile(name, event) {
        event.stopPropagation();
        event.preventDefault();
        const files = event.target.files;
        const data = new FormData();
        $.each(files, function (key, value) {
            data.append(key, value);
        });
        postFilesData(name, data);
    }

    removeFilesData();

    function postFilesData(name, data) {
        $.ajax({
            url: '../UpDownImageAvatarController',
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
                $("#container").prepend("<img class='img-product-review' src='../assets/img/logo/" + name + "' style='height: 100%'>");
                $(".images-container #container").prepend(`<div class="controls">
                                            <a id="removeImg" class="control-btn remove" style="display: flex !important;width: 136px;justify-content: center;align-items: center;">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>`)
                let value = $("#deletedFile").val();
                if (value.indexOf(name) !== -1) {
                    value = value.replace(name + ",", "");
                    $("#deletedFile").val(value);
                }
                removeFilesData()
            }
        });
    }

    function removeFilesData() {
        $("#removeImg").on("click", function (e) {
            e.preventDefault();
            const src = $("#container .img-product-review").attr("src");
            let imageName = "";
            if (src.indexOf("\\") != -1)
                imageName = src.substring(src.lastIndexOf("\\") + 1);
            else
                imageName = src.substring(src.lastIndexOf("/") + 1);
            $("#container").parent().remove();
            const value = $("#deletedFile").val();
            if (value.length > 0)
                $("#deletedFile").val($("#deletedFile").val() + imageName + ",");
            else
                $("#deletedFile").val(imageName + ",");
            console.log($("#deletedFile").val());
            $(".images-container").append(`<div class="image-container">
                                    <div class="image" id="container">
                                        <input type="file" id="image" name="files" class="input-file"/>
                                    </div>
                                </div>`);
            uploadImage();
        });
    }
</script>
<script>
    $("button[type='submit']").click(function (e) {
        e.preventDefault();
        const id = $("#idEdit").val();
        const status = $("#select-status").find(":selected").val();
        const content = CKEDITOR.instances.editor.getData();
        const removed = $("#deletedFile").val();
        const oldImg = removed.substring(0, removed.length - 1);
        const admin = $("#userid").val();
        let nameFile = $(".img-product-review").attr("src");
        if (nameFile.indexOf("\\") != -1)
            nameFile = nameFile.substring(nameFile.lastIndexOf("\\") + 1);
        else
            nameFile = nameFile.substring(nameFile.lastIndexOf("/") + 1);
        $.ajax({
            url: "../EditInsertSlideController",
            type: "GET",
            data: {
                id: id,
                status: status,
                content: content,
                removed: removed,
                oldImg: oldImg,
                nameFile: nameFile,
                admin : admin
            },
            success: function () {
                if (id.length < 1)
                    alert("Thêm danh mục thành công");
                else
                    alert("Cập nhật danh mục thành công");
                window.location.href = "slide-list.jsp"
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