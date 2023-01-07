<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.News" %>
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
        <article class="content items-list-page">
            <div class="title-search-block">
                <div class="title-block">
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="title"> Danh sách tin tức
                                <a href="post-editor.jsp" class="btn btn-primary btn-sm rounded-s"> Thêm tin tức </a>
<%--                                <div class="action dropdown">--%>
<%--                                    <button class="btn  btn-sm rounded-s btn-secondary dropdown-toggle" type="button"--%>
<%--                                            id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"--%>
<%--                                            aria-expanded="false"> Hành động--%>
<%--                                    </button>--%>
<%--                                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">--%>
<%--                                        <a class="dropdown-item hidden-item" href="#">--%>
<%--                                            <i class="fa fa-pencil-square-o icon"></i>Ẩn tin tức</a>--%>
<%--                                        <a class="dropdown-item delete-item" href="#" data-toggle="modal"--%>
<%--                                           data-target="#confirm-modal">--%>
<%--                                            <i class="fa fa-close icon"></i>Xoá tin tức</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </h3>
                        </div>
                    </div>
                </div>
<%--                <div class="items-search">--%>
<%--                    <form class="form-inline">--%>
<%--                        <div class="input-group">--%>
<%--                            <input type="text" class="form-control boxed rounded-s" placeholder="Tìm kiếm...">--%>
<%--                            <span class="input-group-btn">--%>
<%--                                        <button class="btn btn-secondary rounded-s" type="button">--%>
<%--                                            <i class="fa fa-search"></i>--%>
<%--                                        </button>--%>
<%--                                    </span>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
            </div>
            <div class="card items">
                <ul class="item-list striped">
                    <li class="item item-list-header">
                        <div class="item-row">
                            <div class="item-col fixed item-col-check">
                                <label class="item-check" id="select-all-items">
                                    <input type="checkbox" class="checkbox">
                                    <span></span>
                                </label>
                            </div>
                            <div class="item-col item-col-header item-col-title">
                                <div>
                                    <span>Tiêu đề</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales">
                                <div>
                                    <span>Mã bài</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-stats">
                                <div class="no-overflow">
                                    <span>Số lượt xem</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header">
                            </div>
                            <div class="item-col item-col-header item-col-author">
                                <div class="no-overflow">
                                    <span>Người thêm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author"
                                 style="text-align: center;margin: 0 20px;">
                                <div class="no-overflow">
                                    <span>Trạng thái</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-date">
                                <div>
                                    <span>Ngày thêm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header fixed item-col-actions-dropdown"></div>
                        </div>
                    </li>
                    <% int numb = -1;
                        List<News> list = NewsService.getInstance().getListNewsByPage(1);
                        if (list.size() > 6)
                            numb = 6;
                        else numb = list.size();
                    %>
                    <div id="appendItem">
<%--                    listNews                        --%>
                    <% if (list != null)
                        for (int i = 0; i < numb; i++) {%>
                    <li class="item" id="item<%=list.get(i).getNews_id()%>">
                        <div class="item-row">
                            <div class="item-col fixed item-col-check">
                                <label class="item-check" id="select-all-items">
                                    <input type="checkbox" class="checkbox">
                                    <span></span>
                                </label>
                            </div>
                            <div class="item-col fixed pull-left item-col-title">
                                <div class="item-heading">Tiêu đề</div>
                                <div>
                                    <a href="item-editor.jsp" class="">
                                        <h4 class="item-title"><%=list.get(i).getNews_title()%> </h4>
                                    </a>
                                </div>
                            </div>
                            <div class="item-col item-col-sales">
                                <div class="item-heading">Mã bài</div>
                                <div>#<%=list.get(i).getNews_id()%> </div>
                            </div>
                            <div class="item-col item-col-stats no-overflow">
                                <div class="item-heading">Số lượt xem</div>
                                <div class="no-overflow">
<%--                                    <div class="item-stats sparkline" data-type="bar">1</div>--%>
                                    1
                                </div>
                            </div>
                            <div class="item-col item-col-category no-overflow">
                            </div>
                            <div class="item-col item-col-author">
                                <div class="item-heading">Người thêm</div>
                                <div class="no-overflow">
                                    <a><%=list.get(i).getPosted_by()%></a>
                                </div>
                            </div>
                            <div class="item-col item-col-author" style="text-align: center;margin: 0 20px;">
                                <div class="item-heading">Trạng Thái</div>
                                <div class="no-overflow" style="text-align: center">
<%--                                    <%if (list.get(i).getComment_status() == 1) {%>--%>
<%--                                    <a> Hiển thị </a>--%>
<%--                                    <%} else {%>--%>
                                    <a> Đã Ẩn </a>
<%--                                    <%}%>--%>
                                </div>
                                <input type="text"
<%--                                       id="status<%=list.get(i).getComment_id()%>"--%>
<%--                                       value="<%=list.get(i).getComment_status()%>"--%>
                                       style="display: none">
                            </div>
                            <div class="item-col item-col-date">
                                <div class="item-heading">Ngày thêm</div>
                                <div class="no-overflow"><%=list.get(i).getPosted_date()%></div>
                            </div>
                            <div class="item-col fixed item-col-actions-dropdown">
                                <div class="item-actions-dropdown">
                                    <a class="item-actions-toggle-btn">
                                        <span class="inactive">
                                            <i class="fa fa-cog"></i>
                                        </span>
                                        <span class="active">
                                            <i class="fa fa-chevron-circle-right"></i>
                                        </span>
                                    </a>
                                    <div class="item-actions-block">
                                        <ul class="item-actions-list">
                                            <li>
                                                <a class="remove" href="#" data-toggle="modal" data-target="#confirm-modal">
                                                    <i class="fa fa-trash-o "></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="edit" href="post-editor.jsp">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <%}%>
                    </div>
                </ul>
            </div>
            <nav class="text-right">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" style="text-decoration: none;" id="btn_prev"> Trước </a>
                    </li>
                    <li class="page-item active">
                        <a class="page-link" id="page" style="text-decoration: none;" href="#"> 1 </a>
                    </li>
                    <a class="page-link" style="text-decoration: none;" id="btn_next"> Kế tiếp </a>
                    </li>
                </ul>
            </nav>
        </article>
        <div class="modal fade" id="confirm-modal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <i class="fa fa-warning"></i> Lưu ý</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có muốn xoá?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="yes" class="btn btn-primary yes" data-dismiss="modal">Có</button>
                        <button type="button" id="no" class="btn btn-secondary no" data-dismiss="modal">Không</button>
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
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
<script>
    function reloadScript() {
        const $itemActions = $(".item-actions-dropdown");
        $(document).on('click', function (e) {
            if (!$(e.target).closest('.item-actions-dropdown').length) {
                $itemActions.removeClass('active');
            }
        });
        $('.item-actions-toggle-btn').on('click', function (e) {
            e.preventDefault();
            const $thisActionList = $(this).closest('.item-actions-dropdown');
            $itemActions.not($thisActionList).removeClass('active');
            $thisActionList.toggleClass('active');
        });
    }
    function deleteComment() {
        $(".remove").each(function () {
            const id = $(this).attr("id").substring(6);
            const page = parseInt($("#page").text());
            $(this).on("click", function (e) {
                e.preventDefault();
                $("#yes").click(function () {
                    console.log("deleted")
                    $.ajax({
                        url: "/CuoiKiWeb_war/DeleteCommentControllerAdmin",
                        type: "post",
                        data: {
                            id: id,
                            page: page,
                        },
                        success: function (data) {
                            $("#appendItem").html(data);
                            reloadScript();
                        }
                    })
                })
            })
        })
    }

    deleteComment();

    function info() {
        $(".info").each(function () {
            $(this).click(function (e) {
                e.preventDefault();
                const id = $(this).attr("id").substring(4);
                $.ajax({
                    url: "/CuoiKiWeb_war/InfoCommentController",
                    type: "post",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        $("#confirm-detailsModal .modal-content").html(data);
                        $("#confirm-detailsModal").modal('toggle');
                    }
                })
            })
        })
    }

    $(".info").each(function () {
        $(this).click(function (e) {
            e.preventDefault();
            const id = $(this).attr("id").substring(4);
            $.ajax({
                url: "/CuoiKiWeb_war/InfoCommentController",
                type: "post",
                data: {
                    id: id
                },
                success: function (data) {
                    $("#confirm-detailsModal .modal-content").html(data);
                    $("#confirm-detailsModal").modal('toggle');
                }
            })
        })
    })
    $(document).ready(function () {
        $("#btn_prev").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) - 1;
            if (page > 0) {
                $.ajax({
                    url: "/CuoiKiWeb_war/LoadNewsListAdmin",
                    type: "post",
                    data: {
                        page: page,
                    },
                    success: function (data) {
                        $("#appendItem").html(data);
                        $("#page").text(page)
                        deleteComment();
                        reloadScript();
                        info();
                        toggle();
                    }
                })
            }
        })
        $("#btn_next").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) + 1;
            $.ajax({
                url: "/CuoiKiWeb_war/LoadCommentListAdmin",
                type: "post",
                data: {
                    page: page,
                },
                success: function (data) {
                    if ($.trim(data)) {
                        $("#appendItem").html(data);
                        $("#page").text(page)
                        deleteComment();
                        reloadScript();
                        info();
                        toggle();
                    }
                }
            })
        })
    })
</script>
</body>
</html>
<%}%>