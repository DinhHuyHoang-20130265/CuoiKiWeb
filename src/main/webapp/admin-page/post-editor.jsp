<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.News" %>
<%@ page import="vn.edu.hcmuaf.fit.DAO.NewsDAO" %>
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
%>
<div class="main-wrapper">
    <div class="app" id="app">
        <jsp:include page="Layout/_LayoutAdminHeader.jsp"></jsp:include>
        <jsp:include page="Layout/_LayoutAdminSideBar.jsp"></jsp:include>
        <article class="content item-editor-page">
            <div class="title-block">
                <h3 class="title"> Thêm/sửa tin tức
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
            </div>
            <form name="item">
                <div class="card card-block">
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right">
                        Tiêu đề:
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" placeholder="Điền tiêu đề vô đây"
                                   value="<%=NewsService.getInstance().getNewsById(request.getParameter("id")).getNews_id() != null ? NewsService.getInstance().getNewsById(request.getParameter("id")).getNews_title() : "" %>"> </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Nội dung: </label>
                        <div class="col-sm-10">
                            <div class="wyswyg">
                                <div class="toolbar">
                                    <select class="ql-size">
                                        <option value="small"></option>
                                        <option selected></option>
                                        <option value="large"></option>
                                        <option value="huge"></option>
                                    </select>
                                    <button class="ql-bold"></button>
                                    <button class="ql-italic"></button>
                                    <button class="ql-underline"></button>
                                    <button class="ql-strike"></button>
                                    <select title="Text Color" class="ql-color">
                                        <option value="rgb(0, 0, 0)" label="rgb(0, 0, 0)" selected></option>
                                        <option value="rgb(230, 0, 0)" label="rgb(230, 0, 0)"></option>
                                        <option value="rgb(255, 153, 0)" label="rgb(255, 153, 0)"></option>
                                        <option value="rgb(255, 255, 0)" label="rgb(255, 255, 0)"></option>
                                        <option value="rgb(0, 138, 0)" label="rgb(0, 138, 0)"></option>
                                        <option value="rgb(0, 102, 204)" label="rgb(0, 102, 204)"></option>
                                        <option value="rgb(153, 51, 255)" label="rgb(153, 51, 255)"></option>
                                        <option value="rgb(255, 255, 255)" label="rgb(255, 255, 255)"></option>
                                        <option value="rgb(250, 204, 204)" label="rgb(250, 204, 204)"></option>
                                        <option value="rgb(255, 235, 204)" label="rgb(255, 235, 204)"></option>
                                        <option value="rgb(255, 255, 204)" label="rgb(255, 255, 204)"></option>
                                        <option value="rgb(204, 232, 204)" label="rgb(204, 232, 204)"></option>
                                        <option value="rgb(204, 224, 245)" label="rgb(204, 224, 245)"></option>
                                        <option value="rgb(235, 214, 255)" label="rgb(235, 214, 255)"></option>
                                        <option value="rgb(187, 187, 187)" label="rgb(187, 187, 187)"></option>
                                        <option value="rgb(240, 102, 102)" label="rgb(240, 102, 102)"></option>
                                        <option value="rgb(255, 194, 102)" label="rgb(255, 194, 102)"></option>
                                        <option value="rgb(255, 255, 102)" label="rgb(255, 255, 102)"></option>
                                        <option value="rgb(102, 185, 102)" label="rgb(102, 185, 102)"></option>
                                        <option value="rgb(102, 163, 224)" label="rgb(102, 163, 224)"></option>
                                        <option value="rgb(194, 133, 255)" label="rgb(194, 133, 255)"></option>
                                        <option value="rgb(136, 136, 136)" label="rgb(136, 136, 136)"></option>
                                        <option value="rgb(161, 0, 0)" label="rgb(161, 0, 0)"></option>
                                        <option value="rgb(178, 107, 0)" label="rgb(178, 107, 0)"></option>
                                        <option value="rgb(178, 178, 0)" label="rgb(178, 178, 0)"></option>
                                        <option value="rgb(0, 97, 0)" label="rgb(0, 97, 0)"></option>
                                        <option value="rgb(0, 71, 178)" label="rgb(0, 71, 178)"></option>
                                        <option value="rgb(107, 36, 178)" label="rgb(107, 36, 178)"></option>
                                        <option value="rgb(68, 68, 68)" label="rgb(68, 68, 68)"></option>
                                        <option value="rgb(92, 0, 0)" label="rgb(92, 0, 0)"></option>
                                        <option value="rgb(102, 61, 0)" label="rgb(102, 61, 0)"></option>
                                        <option value="rgb(102, 102, 0)" label="rgb(102, 102, 0)"></option>
                                        <option value="rgb(0, 55, 0)" label="rgb(0, 55, 0)"></option>
                                        <option value="rgb(0, 41, 102)" label="rgb(0, 41, 102)"></option>
                                        <option value="rgb(61, 20, 102)" label="rgb(61, 20, 102)"></option>
                                    </select>
                                    <select title="Background Color" class="ql-background">
                                        <option value="rgb(0, 0, 0)" label="rgb(0, 0, 0)"></option>
                                        <option value="rgb(230, 0, 0)" label="rgb(230, 0, 0)"></option>
                                        <option value="rgb(255, 153, 0)" label="rgb(255, 153, 0)"></option>
                                        <option value="rgb(255, 255, 0)" label="rgb(255, 255, 0)"></option>
                                        <option value="rgb(0, 138, 0)" label="rgb(0, 138, 0)"></option>
                                        <option value="rgb(0, 102, 204)" label="rgb(0, 102, 204)"></option>
                                        <option value="rgb(153, 51, 255)" label="rgb(153, 51, 255)"></option>
                                        <option value="rgb(255, 255, 255)" label="rgb(255, 255, 255)" selected></option>
                                        <option value="rgb(250, 204, 204)" label="rgb(250, 204, 204)"></option>
                                        <option value="rgb(255, 235, 204)" label="rgb(255, 235, 204)"></option>
                                        <option value="rgb(255, 255, 204)" label="rgb(255, 255, 204)"></option>
                                        <option value="rgb(204, 232, 204)" label="rgb(204, 232, 204)"></option>
                                        <option value="rgb(204, 224, 245)" label="rgb(204, 224, 245)"></option>
                                        <option value="rgb(235, 214, 255)" label="rgb(235, 214, 255)"></option>
                                        <option value="rgb(187, 187, 187)" label="rgb(187, 187, 187)"></option>
                                        <option value="rgb(240, 102, 102)" label="rgb(240, 102, 102)"></option>
                                        <option value="rgb(255, 194, 102)" label="rgb(255, 194, 102)"></option>
                                        <option value="rgb(255, 255, 102)" label="rgb(255, 255, 102)"></option>
                                        <option value="rgb(102, 185, 102)" label="rgb(102, 185, 102)"></option>
                                        <option value="rgb(102, 163, 224)" label="rgb(102, 163, 224)"></option>
                                        <option value="rgb(194, 133, 255)" label="rgb(194, 133, 255)"></option>
                                        <option value="rgb(136, 136, 136)" label="rgb(136, 136, 136)"></option>
                                        <option value="rgb(161, 0, 0)" label="rgb(161, 0, 0)"></option>
                                        <option value="rgb(178, 107, 0)" label="rgb(178, 107, 0)"></option>
                                        <option value="rgb(178, 178, 0)" label="rgb(178, 178, 0)"></option>
                                        <option value="rgb(0, 97, 0)" label="rgb(0, 97, 0)"></option>
                                        <option value="rgb(0, 71, 178)" label="rgb(0, 71, 178)"></option>
                                        <option value="rgb(107, 36, 178)" label="rgb(107, 36, 178)"></option>
                                        <option value="rgb(68, 68, 68)" label="rgb(68, 68, 68)"></option>
                                        <option value="rgb(92, 0, 0)" label="rgb(92, 0, 0)"></option>
                                        <option value="rgb(102, 61, 0)" label="rgb(102, 61, 0)"></option>
                                        <option value="rgb(102, 102, 0)" label="rgb(102, 102, 0)"></option>
                                        <option value="rgb(0, 55, 0)" label="rgb(0, 55, 0)"></option>
                                        <option value="rgb(0, 41, 102)" label="rgb(0, 41, 102)"></option>
                                        <option value="rgb(61, 20, 102)" label="rgb(61, 20, 102)"></option>
                                    </select>
                                    <button class="ql-list" value="ordered"></button>
                                    <button class="ql-list" value="bullet"></button>
                                    <select title="Text Alignment" class="ql-align">
                                        <option selected></option>
                                        <option value="center" label="Center"></option>
                                        <option value="right" label="Right"></option>
                                        <option value="justify" label="Justify"></option>
                                    </select>
                                    <button class="ql-link"></button>
                                    <button style="width: auto;" type="button" title="Image"
                                            class="btn btn-secondary btn-sm" data-toggle="modal"
                                            data-target="#modal-media">
                                        <i class="fa fa-image"></i> Media
                                    </button>
                                </div>
                                <div class="editor">
                                <%=NewsService.getInstance().getNewsById(request.getParameter("id")).getNews_id() != null ? NewsService.getInstance().getNewsById(request.getParameter("id")).getDescription() : "Điền content ở đây" %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Hình ảnh: </label>
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
                                         style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')">
                                        Ảnh chính
                                    </div>
                                </div>
                                <div class="image-container">
                                    <div class="controls">
                                        <a href="" class="control-btn move">
                                            <i class="fa fa-arrows"></i>
                                        </a>
                                        <!--
                        -->
                                        <a href="" class="control-btn star">
                                            <i class="fa"></i>
                                        </a>
                                        <!--
                        -->
                                        <a href="#" class="control-btn remove" data-toggle="modal"
                                           data-target="#confirm-modal">
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </div>
                                    <div class="image"
                                         style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg')"></div>
                                </div>
                                <div class="image-container">
                                    <div class="controls">
                                        <a href="" class="control-btn move">
                                            <i class="fa fa-arrows"></i>
                                        </a>
                                        <!--
                        -->
                                        <a href="" class="control-btn star">
                                            <i class="fa"></i>
                                        </a>
                                        <!--
                        -->
                                        <a href="#" class="control-btn remove" data-toggle="modal"
                                           data-target="#confirm-modal">
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </div>
                                    <div class="image"
                                         style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/eduardo_olv/128.jpg')"></div>
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
                        <h4 class="modal-title">Media Library</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
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
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/eduardo_olv/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/eduardo_olv/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/eduardo_olv/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg')"></div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-md-4 col-lg-3">
                                            <div class="image-container">
                                                <div class="image"
                                                     style="background-image:url('https://s3.amazonaws.com/uifaces/faces/twitter/eduardo_olv/128.jpg')"></div>
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
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-primary">Lưu</button>
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
                            <i class="fa fa-warning"></i>Lưu ý</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc muốn thực hiện hành động này ??</p>
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
</body>
</html>
<%}%>