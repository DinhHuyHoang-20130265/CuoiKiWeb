<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.News" %>
<%@ page import="vn.edu.hcmuaf.fit.DAO.NewsDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
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
    <script src="ckeditor/ckeditor.js"></script>
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
            if (role.getTable().equals("news") || role.getTable().equals("admin")) {
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
                <h3 class="title"> Sửa danh mục
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%} else {%>
                <h3 class="title"> Thêm danh mục
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%}%>
            </div>
            <%
                News news = null;
                if (request.getParameter("id") != null)
                    news = NewsService.getInstance().getNewsById(request.getParameter("id"));
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
                        <label class="col-sm-2 form-control-label text-xs-right"> Tiêu đề: </label>
                        <div class="col-sm-10">
                            <input type="text" id="title" class="form-control boxed" placeholder="Điền tiêu đề vô đây"
                                   value="<%=(news != null)? news.getNews_title(): ""%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Mô tả: </label>
                        <div class="col-sm-10">
                            <input type="text" id="description" class="form-control boxed"
                                   placeholder="Điền mô tả vô đây"
                                   value="<%=(news != null)? news.getDescription(): ""%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Nội dung: </label>
                        <div class="col-sm-10">
                            <textarea id="editor">
                                <%=(news != null) ? news.getContent() : ""%>
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
                                        <img class='news-review'
                                             src='<%=news.getNews_img_link()%>'
                                             style='height: 100%;width: 100%'>
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
<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
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
            url: '../UpDownImageNewsController',
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
                $("#container").prepend("<img class='news-review' src='../assets/imgNews/news/" + name + "' style='height: 100%'>");
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
            const src = $("#container .news-review").attr("src");
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
        const userID = $("#userid").val();
        const id = $("#idEdit").val();
        const title = $("#title").val();
        const description = $("#description").val();
        const content = CKEDITOR.instances.editor.getData();
        const removed = $("#deletedFile").val();
        const oldImg = removed.substring(0, removed.length - 1);
        let nameFile = $(".news-review").attr("src");
        if (nameFile.indexOf("\\") != -1)
            nameFile = nameFile.substring(nameFile.lastIndexOf("\\") + 1);
        else
            nameFile = nameFile.substring(nameFile.lastIndexOf("/") + 1);
        console.log(title);
        $.ajax({
            url: "../EditInsertNewsController",
            type: "GET",
            data: {
                userID: userID,
                id: id,
                title: title,
                description: description,
                content: content,
                removed: removed,
                oldImg: oldImg,
                nameFile: nameFile
            },
            success: function () {
                if (id.length < 1)
                    alert("Thêm tin tức thành công");
                else
                    alert("Cập nhật tin tức thành công");
                window.location.href = "posts-list.jsp"
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