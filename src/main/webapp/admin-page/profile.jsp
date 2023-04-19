<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.AccountService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.AdminLoginService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %><%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 4/16/2023
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> Thông tin tài khoản </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->
    <link rel="stylesheet" href="css/vendor.css">
    <!-- Theme initialization -->
    <script>
        const themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
            {};
        const themeName = themeSettings.themeName || '';
        if (themeName) {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app-' + themeName + '.css">');
        } else {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app.css">');
        }
    </script>
    <style>
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

        .images-container .image {
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            width: 130px;
            height: 135px;
            line-height: 135px;
            text-align: center;
        }

        .images-container .image-container {
            float: left;
            padding: 3px;
            margin-right: 10px;
            margin-bottom: 35px;
            position: relative;
            border: 1px solid #e6eaee;
            overflow: hidden;
        }

        .images-container .controls {
            position: absolute;
            left: 0;
            right: 0;
            opacity: 0;
            bottom: -35px;
            text-align: center;
            height: 35px;
            font-size: 24px;
            -webkit-transition: bottom 0.2s ease, opacity 0.2s ease;
            transition: bottom 0.2s ease, opacity 0.2s ease;
            background-color: #fff;
        }

        .images-container .controls .control-btn.remove {
            color: #FF4444;
        }

        .images-container .controls .control-btn {
            display: inline-block;
            color: #4f5f6f;
            cursor: pointer;
            width: 35px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            opacity: 0.5;
            -webkit-transition: opacity 0.3s ease;
            transition: opacity 0.3s ease;
        }

        .images-container .controls::after {
            display: block;
            clear: both;
            content: "";
        }
    </style>
</head>

<body>
<%

    //----------------------Kiểm tra thử đăng nhập hay chưa--------------------//
    if (request.getSession().getAttribute("userAdmin") == null) {
        // Sendredirect tới login
        response.sendRedirect("login.jsp");
    } else {
        AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
        UserInformation infor = UserInformationService.getInstance().getUserInfo(admin.getId());
%>
<div class="main-wrapper">
    <div class="app" id="app">
        <jsp:include page="Layout/_LayoutAdminHeader.jsp"></jsp:include>
        <jsp:include page="Layout/_LayoutAdminSideBar.jsp"></jsp:include>
        <article class="content item-editor-page">
            <div class="title-block">
                <h3 class="title"> Sửa thông tin tài khoản
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
            </div>
            <form name="item">
                <input type="text" id="userId" name="userId"
                       value="<%=infor.getId()%>"
                       style="display: none">
                <div class="card card-block">
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Tên người dùng: </label>
                        <div class="col-sm-10">
                            <input type="text"
                                   value="<%=infor.getFull_name()%>"
                                   id="name" name="name" class="form-control boxed" placeholder="Nhập tên">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Email: </label>
                        <div class="col-sm-10">
                            <input type="email"
                                   value="<%=infor.getEmail() == null ? "" : infor.getEmail()%>"
                                   id="email" name="email" class="form-control boxed"
                                   placeholder="Nhập email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Tên đăng nhập: </label>
                        <div class="col-sm-10">
                            <input value="<%=admin.getUsername()%>"
                                   type="text" name="username" id=username style="width:200px"
                                   class="form-control boxed"
                                   contenteditable="false"
                                   disabled>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Password: </label>
                        <div class="col-sm-10">
                            <input
                                    type="password" name="password" id="password" style="width:200px"
                                    class="form-control boxed"
                                    placeholder="Nhập password">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Địa chỉ: </label>
                        <div class="col-sm-10">
                            <input
                                    value="<%=infor.getAddress()== null ? "" : infor.getAddress()%>"
                                    type="text" name="address" id="address" class="form-control boxed"
                                    placeholder="Nhập...">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> SDT: </label>
                        <div class="col-sm-10">
                            <input
                                    value="<%=infor.getPhone_number()== null ? "" : infor.getPhone_number()%>"
                                    type="text" name="phone" id="phone" class="form-control boxed"
                                    placeholder="Nhập...">
                        </div>
                    </div>
                    <div class="form-group row"
                         style="display: <%=( AccountService.getInstance().getAccountRole(admin.getId()) == 1) ? "flex" : "none"%>">
                        <label class="col-sm-2 form-control-label text-xs-right"> Vai trò: </label>
                        <div class="col-sm-10" style="display: block">
                            <%
                                if (AdminLoginService.getInstance().getListRole(admin.getId()) != null) {
                                    for (AdminRole role : AdminLoginService.getInstance().getListRole(admin.getId())) {
                                        String table = role.getTable();
                                        String permission = role.getPermission();
                            %>
                            <div class="role-select" style="display: flex">
                                <select class="c-select form-control" disabled>
                                    <option value="null">Không có
                                    </option>
                                    <option value="user" <%=table.equals("user") ? "selected" : ""%>>Tài khoản
                                    </option>
                                    <option value="product" <%=table.equals("product") ? "selected" : ""%>> Sản phẩm
                                    </option>
                                    <option value="comment" <%=table.equals("comment") ? "selected" : ""%>>Bình
                                        luận/Đánh giá
                                    </option>
                                    <option value="news" <%=table.equals("news") ? "selected" : ""%>>Tin tức
                                    </option>
                                    <option value="order" <%=table.equals("order") ? "selected" : ""%>>Đơn hàng
                                    </option>
                                    <option value="category" <%=table.equals("category") ? "selected" : ""%>>Danh mục
                                    </option>
                                    <option value="slider" <%=table.equals("slider") ? "selected" : ""%>>Banner
                                    </option>
                                    <option value="sales" <%=table.equals("sales") ? "selected" : ""%>>Giảm giá
                                    </option>
                                    <option value="admin" <%=table.equals("admin") ? "selected" : ""%>>Admin
                                    </option>
                                </select>
                                <select class="c-select form-control" disabled>
                                    <option value="null">Không
                                    </option>
                                    <option value="insert" <%=permission.equals("insert") ? "selected" : ""%>>Thêm
                                    </option>
                                    <option value="update" <%=permission.equals("update") ? "selected" : ""%>>Sửa
                                    </option>
                                    <option value="delete" <%=permission.equals("delete") ? "selected" : ""%>>Xóa
                                    </option>
                                    <option value="admin" <%=permission.equals("admin") ? "selected" : ""%>>Xóa
                                    </option>
                                </select>
                            </div>
                            <%
                                    }
                                } %>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Ảnh đại diện: </label>
                        <div class="col-sm-10">
                            <div class="images-container">
                                <% if (infor.getAvatar_link() == null || infor.getAvatar_link().equals("")) { %>
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
                                             src='<%=infor.getAvatar_link()%>'
                                             style='height: 100%' alt="">
                                    </div>
                                </div>
                                <% }%>
                            </div>
                        </div>
                    </div>
                    <input type="text" id="deletedFile" value="" style="display: none">
                    <div class="form-group row">
                        <div class="col-sm-10 col-sm-offset-2">
                            <button id="sendform" class="btn btn-primary"> Lưu</button>
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
    $(".input-file").on('change', function (e) {
        const value = $(this).val();
        let name = "";
        if (value.indexOf("\\") !== -1)
            name = value.substring(value.lastIndexOf("\\") + 1);
        else
            name = value.substring(value.lastIndexOf("/") + 1);
        uploadFile(name, e)
    });

    function uploadImage() {
        $(".input-file").on('change', function (e) {
            const value = $(this).val();
            let name = "";
            if (value.indexOf("\\") !== -1)
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
                $("#container").prepend("<img class='img-product-review' src='../assets/img/logo/" + name + "' style='height: 100%' alt=''>");
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
            if (src.indexOf("\\") !== -1)
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
    $("#sendform").click(function (e) {
        e.preventDefault();
        const name = $("#name").val();
        const email = $("#email").val();
        const password = $("#password").val();
        const address = $("#address").val();
        const phone = $("#phone").val();
        const removed = $("#deletedFile").val();
        const oldImg = removed.substring(0, removed.length - 1);
        let nameFile = $(".img-product-review").attr("src");
        if (nameFile != null) {
            if (nameFile.indexOf("\\") !== -1)
                nameFile = nameFile.substring(nameFile.lastIndexOf("\\") + 1);
            else
                nameFile = nameFile.substring(nameFile.lastIndexOf("/") + 1);
        }
        $.ajax({
            url: "../UpdateAdminController",
            type: "get",
            data: {
                fullname: name,
                email: email,
                password: password,
                address: address,
                phone: phone,
                oldImg: oldImg,
                nameFile: nameFile
            },
            success: function () {
                alert("Cập nhật tài khoản thành công");
                window.location.href = "users-list.jsp"
            }
        });
    });
</script>
</body>

</html>
<%
    }
%>
