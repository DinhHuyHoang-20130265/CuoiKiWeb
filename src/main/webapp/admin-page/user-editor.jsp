<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
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
                <h3 class="title"> Thêm/sửa thông tin người dùng
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
            </div>
            <form name="item">
                <div class="card card-block">
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Tên người dùng: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" placeholder="Nhập tên">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Email: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" placeholder="Nhập email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Tên đăng nhập: </label>
                        <div class="col-sm-10">
                            <input type="text" style="width:200px" class="form-control boxed"
                                   placeholder="Nhập username">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Password: </label>
                        <div class="col-sm-10">
                            <input type="password" style="width:200px" class="form-control boxed"
                                   placeholder="Nhập password">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Địa chỉ: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" placeholder="Nhập...">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Ảnh đại diện: </label>
                        <div class="col-sm-10">
                            <div class="images-container">
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
                                         style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')"></div>
                                </div>
                                <a href="#" class="add-image" data-toggle="modal" data-target="#modal-media">
                                    <div class="image-container new">
                                        <div class="image">
                                            <i class="fa fa-plus"></i>
                                        </div>
                                    </div>
                                </a>
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
        <div class="modal fade" id="modal-media">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Thư viện ảnh</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Đóng</span>
                        </button>
                    </div>
                    <div class="modal-body modal-tab-container">
                        <ul class="nav nav-tabs modal-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" href="#gallery" data-toggle="tab" role="tab">Gallery</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#upload" data-toggle="tab" role="tab">Upload</a>
                            </li>
                        </ul>
                        <div class="tab-content modal-tab-content">
                            <div class="tab-pane fade" id="gallery" role="tabpanel">
                                <div class="images-container">
                                    <div class="row">
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/eduardo_olv/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/eduardo_olv/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/eduardo_olv/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/eduardo_olv/128.jpg')">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade active in" id="upload" role="tabpanel">
                                <div class="upload-container">
                                    <div id="dropzone">
                                        <form action="/" method="POST" enctype="multipart/form-data"
                                              class="dropzone needsclick dz-clickable" id="demo-upload">
                                            <div class="dz-message-block">
                                                <div class="dz-message needsclick"> Drop files here or click to
                                                    upload.
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Insert Selected</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <div class="modal fade" id="confirm-modal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <i class="fa fa-warning"></i> Lưu ý
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có muốn thực hiện hành động này?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Có</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
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
</body>

</html>
<%
        }
    }
%>