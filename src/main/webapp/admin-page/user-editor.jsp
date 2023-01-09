<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.AccountService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.AdminLoginService" %>
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
        boolean check = false;
        for (AdminRole role : admin.getRole()) {
            if (role.getTable().equals("user")) {
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
                <input type="text" id="userId" name="userId"
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
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Trạng thái </label>
                        <div class="col-sm-10" style="">
                            <select class="c-select form-control" name="status" id="status"
                                    onfocus='this.size=2;' onblur='this.size=1;'
                                    onchange='this.size=1; this.blur();'>
                                <% if (request.getParameter("id") != null) {
                                    if (AccountService.getInstance().getAccountById(request.getParameter("id")).getAccount_status() == 1) { %>
                                <option value="0">Vô hiệu hóa
                                </option>
                                <option value="1" selected>Hoạt động
                                </option>
                                <% } else if (AccountService.getInstance().getAccountById(request.getParameter("id")).getAccount_status() == 0) { %>
                                <option value="0" selected>Vô hiệu hóa
                                </option>
                                <option value="1">Hoạt động
                                </option>
                                <%
                                    }
                                } else {
                                %>
                                <option value="0">Vô hiệu hóa
                                </option>
                                <option value="1">Hoạt động
                                </option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row" id="role"
                         style="display: <%=(request.getParameter("id") != null && AccountService.getInstance().getAccountRole(request.getParameter("id")) == 1) ? "flex" : "none"%>">
                        <label class="col-sm-2 form-control-label text-xs-right"> Vai trò: </label>
                        <div class="col-sm-10" style="display: block">
                            <% if (request.getParameter("id") != null) {
                                if (AccountService.getInstance().getAccountRole(request.getParameter("id")) == 1) {
                                    if (AdminLoginService.getInstance().getListRole(request.getParameter("id")) != null) {
                                        int i = 0;
                                        for (AdminRole role : AdminLoginService.getInstance().getListRole(request.getParameter("id"))) {
                                            String table = role.getTable();
                                            String permission = role.getPermission();
                            %>
                            <div class="role-select" id="role-select<%=i%>" style="display: flex">
                                <select class="c-select form-control" id="select-role<%=i%>">
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
                                </select>
                                <select class="c-select form-control"
                                        id="select-permission<%=i%>">
                                    <option value="null">Không
                                    </option>
                                    <option value="insert" <%=permission.equals("insert") ? "selected" : ""%>>Thêm
                                    </option>
                                    <option value="update" <%=permission.equals("update") ? "selected" : ""%>>Sửa
                                    </option>
                                    <option value="delete" <%=permission.equals("delete") ? "selected" : ""%>>Xóa
                                    </option>
                                </select>
                                <button type="button" value="remove<%=i%>" onclick="remove(this.value)" class="remove">
                                    <i
                                            class="fa fa-times"></i>
                                </button>
                            </div>
                            <% i++;
                            } %>
                            <button type="button" value="plus<%=i%>" id="plus"><i class="fa fa-plus"></i>
                            </button>
                            <% } else { %>
                            <button type="button" value="plus0" id="plus"><i class="fa fa-plus"></i>
                            </button>
                            <% }
                            } else { %>
                            <button type="button" value="plus0" id="plus"><i class="fa fa-plus"></i>
                            </button>
                            <% }
                            } else { %>
                            <button type="button" value="plus0" id="plus"><i class="fa fa-plus"></i>
                            </button>
                            <% } %>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Ảnh đại diện: </label>
                        <div class="col-sm-10">
                            <div class="images-container">
                                <% if (request.getParameter("id") == null) { %>
                                <div class="image-container">
                                    <div class="image" id="container">
                                        <input type="file" id="image" name="files" class="input-file"/>
                                    </div>
                                </div>
                                <% } else {
                                    if (UserInformationService.getInstance().getUserInfo(request.getParameter("id")).getAvatar_link() == null) { %>
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
                                             src='<%=UserInformationService.getInstance().getUserInfo(request.getParameter("id")).getAvatar_link()%>'
                                             style='height: 100%'>
                                    </div>
                                </div>
                                <% }
                                } %>
                            </div>
                        </div>
                    </div>
                    <input type="text" id="deletedFile" value="" style="display: none">
                    <div class="form-group row">
                        <div class="col-sm-10 col-sm-offset-2">
                            <%if (request.getParameter("id") != null) {%>
                            <button id="sendform" class="btn btn-primary"> Lưu</button>
                            <% } else { %>
                            <button id="sendform" class="btn btn-primary"> Thêm</button>
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
    function remove(value) {
        const count = value.substring(6);
        const old = $("#plus").val().substring(4);
        console.log(count + "-" + old);
        if (parseInt(old) === (parseInt(count) + 1)) {
            $("#role-select" + count).remove();
            $("#plus").val("plus" + (parseInt(old) - 1));
        } else {
            alert("Bạn phải xóa role theo thứ tự từ dưới lên");
        }
    }

    $("#plus").click(function (e) {
        e.preventDefault();
        const count = $(this).val().substring(4);
        if (parseInt(count) === 0) {
            $(this).val("plus" + (parseInt(count) + 1));
            $(`<div class="role-select" id="role-select` + count + `" style="display: flex">
                                <select class="c-select form-control" id="select-role` + count + `">
                                    <option value="null" selected>Không có
                                    </option>
                                    <option value="user">Tài khoản
                                    </option>
                                    <option value="product"> Sản phẩm
                                    </option>
                                    <option value="comment" >Bình
                                        luận/Đánh giá
                                    </option>
                                    <option value="news">Tin tức
                                    </option>
                                    <option value="orders">Đơn hàng
                                    </option>
                                    <option value="category">Danh mục
                                    </option>
                                    <option value="slider">Banner
                                    </option>
                                </select>
                                <select class="c-select form-control"
                                        id="select-permission` + count + `">
                                    <option value="null" selected>Không
                                    </option>
                                    <option value="insert">Thêm
                                    </option>
                                    <option value="update">Sửa
                                    </option>
                                    <option value="delete">Xóa
                                    </option>
                                </select>
                                <button type="button" class="remove" onclick="remove(this.value)" value="remove` + count + `"><i class="fa fa-times"></i>
                                </button>
                            </div>`).insertBefore("#plus");
        } else {
            let check = true;
            $(".role-select").each(function () {
                const id = $(this).attr("id").substring(11);
                const roleselect = $("#select-role" + id).find(":selected").val();
                const permissionselect = $("#select-permission" + id).find(":selected").val();
                console.log(id + "-" + roleselect + "-" + permissionselect);
                if (roleselect === "null" || permissionselect === "null") {
                    check = false;
                    return false;
                }
            })
            if (check) {
                $(this).val("plus" + (parseInt(count) + 1));
                $(`<div class="role-select" id="role-select` + count + `" style="display: flex">
                                <select class="c-select form-control" id="select-role` + count + `">
                                    <option value="null" selected>Không có
                                    </option>
                                    <option value="user">Tài khoản
                                    </option>
                                    <option value="product"> Sản phẩm
                                    </option>
                                    <option value="comment" >Bình
                                        luận/Đánh giá
                                    </option>
                                    <option value="news">Tin tức
                                    </option>
                                    <option value="orders">Đơn hàng
                                    </option>
                                    <option value="category">Danh mục
                                    </option>
                                    <option value="slider">Banner
                                    </option>
                                </select>
                                <select class="c-select form-control"
                                        id="select-permission` + count + `">
                                    <option value="null" selected>Không
                                    </option>
                                    <option value="insert">Thêm
                                    </option>
                                    <option value="update">Sửa
                                    </option>
                                    <option value="delete">Xóa
                                    </option>
                                </select>
                                <button type="button" class="remove" onclick="remove(this.value)" value="remove` + count + `"><i class="fa fa-times"></i>
                                </button>
                            </div>`).insertBefore("#plus");
            } else {
                alert("Phải điền đầy đủ role của admin")
            }
        }
    })
    $("#select-cate").on('change', function () {
        if ($(this).find(":selected").val() === "0") {
            $("#role").css("display", "none");
        } else {
            $("#role").css("display", "flex");
        }
    })
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
            url: '/CuoiKiWeb_war/UpDownImageAvatarController',
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
                $("#container").prepend("<img class='img-product-review' src='http://localhost:8080/CuoiKiWeb_war/assets/img/logo/" + name + "' style='height: 100%'>");
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
    $("#sendform").click(function (e) {
        e.preventDefault();
        const userId = $("#userId").val();
        const name = $("#name").val();
        const email = $("#email").val();
        const username = $("#username").val();
        const password = $("#password").val();
        const address = $("#address").val();
        const status = $("#status").find(":selected").val();
        const role = $("#select-cate").find(":selected").val();
        let permission = "";
        $(".role-select").each(function () {
            const id = $(this).attr("id").substring(11);
            const roleselect = $("#select-role" + id).find(":selected").val();
            const permissionselect = $("#select-permission" + id).find(":selected").val();
            permission += roleselect + "-" + permissionselect + ",";
        })
        const removed = $("#deletedFile").val();
        const oldImg = removed.substring(0, removed.length - 1);
        let nameFile = $(".img-product-review").attr("src");
        if (nameFile.indexOf("\\") != -1)
            nameFile = nameFile.substring(nameFile.lastIndexOf("\\") + 1);
        else
            nameFile = nameFile.substring(nameFile.lastIndexOf("/") + 1);
        $.ajax({
            url: "/CuoiKiWeb_war/EditInsertAccountController",
            type: "get",
            data: {
                userId: userId,
                fullname: name,
                email: email,
                username: username,
                password: password,
                address: address,
                status: status,
                role: role,
                permission: permission,
                oldImg: oldImg,
                nameFile: nameFile
            },
            success: function () {
                if (userId.length < 1)
                    alert("Thêm tài khoản thành công");
                else
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
    }
%>