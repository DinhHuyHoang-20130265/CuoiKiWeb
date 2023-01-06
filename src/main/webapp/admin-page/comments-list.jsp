<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.News" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.NewsComment" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsCommentService" %>
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
    <style>
        .item-col-title {
            max-width: 220px;
        }

        .items-list-page .item-list .item-col.item-col-sales {
            text-align: left;
            max-width: 120px;
        }

        .item-col-author {
            max-width: 100px;
        }

        .items-list-page .item-list .item-col.item-col-date {
            text-align: right;
            max-width: 100px;
        }

        .item-col-stats {
            text-align: left !important;
            font-size: 12px;
        }

        .my-mfp-zoom-in.mfp-ready .zoom-anim-dialog {
            opacity: 1;
            transform: scale(1);
            z-index: 999;
        }

        .modal--view {
            padding: 20px 0 0 0;
            max-width: 710px;
        }

        .comments__autor {
            display: block;
            position: relative;
            padding-left: 75px;
            margin-bottom: 15px;
        }

        .comments__avatar {
            position: absolute;
            top: 0;
            left: 20px;
            width: 40px;
            border-radius: 6px;
        }

        img {
            vertical-align: middle;
            border-style: none;
        }

        .comments__name {
            display: block;
            font-size: 16px;
            color: black;
            line-height: 20px;
            font-weight: 400;
        }

        .comments__time {
            display: block;
            font-size: 12px;
            color: black;
            line-height: 20px;
            font-weight: 400;
        }

        .comments__text {
            display: block;
            margin: 0 20px;
            color: black;
            font-size: 18px;
            font-weight: 500;
            line-height: 26px;
            padding: 20px 0;
            position: relative;
            border-top: 1px solid #3d3d3d;
            border-bottom: 1px solid #3d3d3d;
        }

        .comments__actions {
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            align-items: center;
            padding: 15px 20px;
            position: relative;
        }

        .comments__rate {
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            align-items: center;
            position: relative;
        }

        .comments__rate span {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            color: black;
            font-size: 14px;
            margin-right: 25px;
            position: relative;
            height: 30px;
        }

        .comments__rate span:first-child i {
            margin-right: 6px;
            color: #29b474;
        }

        .comments__rate span i {
            font-size: 18px;
            opacity: 0.6;
            transition: 0.4s ease;
            padding-right: 5px;
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
                            <h3 class="title"> Danh sách bình luận tin tức
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="items-search">
                    <form class="form-inline"></form>
                </div>
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
                            <div class="item-col item-col-header fixed item-col-img md">
                                <div>
                                    <span>Mã tin tức</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-title">
                                <div>
                                    <span>Người bình luận</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales">
                                <div>
                                    <span>Mã bình luận</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-stats">
                                <div class="no-overflow">
                                    <span>Trả lời bình luận của</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-category">
                                <div class="no-overflow">
                                    <span>Lượt thích</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author">
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
                        List<NewsComment> list = NewsCommentService.getInstance().getAllCommentByPage(1);
                        if (list.size() > 6)
                            numb = 6;
                        else numb = list.size();
                    %>
                    <div id="appendItem">
                        <% if (list != null)
                            for (int i = 0; i < numb; i++) {%>
                        <li class="item" id="item<%=list.get(i).getComment_id()%>">
                            <div class="item-row">
                                <div class="item-col fixed item-col-check">
                                    <label class="item-check" id="select-all-items">
                                        <input type="checkbox" class="checkbox">
                                        <span></span>
                                    </label>
                                </div>
                                <div class="item-col fixed item-col-img md" style="justify-content: center;">
                                    <span>#<%=list.get(i).getNews_id()%></span>
                                </div>
                                <div class="item-col fixed pull-left item-col-title">
                                    <div class="item-heading">Người bình luận</div>
                                    <div>
                                        <a>
                                            <h4 class="item-title"><%=list.get(i).getComment_by()%>
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-sales">
                                    <div class="item-heading">Mã bình luận</div>
                                    <div class="sales" style="text-align: center">#<%=list.get(i).getComment_id()%>
                                    </div>
                                </div>
                                <div class="item-col item-col-category no-overflow">
                                    <div class="item-heading">Lượt thích</div>
                                    <div class="no-overflow">
                                        <a>1</a>
                                    </div>
                                </div>
                                <div class="item-col item-col-author">
                                    <div class="item-heading">Trạng Thái</div>
                                    <div class="no-overflow" style="text-align: center">
                                        <%if (list.get(i).getComment_status() == 1) {%>
                                        <a> Hiển thị </a>
                                        <%} else {%>
                                        <a> Đã Ẩn </a>
                                        <%}%>
                                    </div>
                                    <input type="text" id="status" value="<%=list.get(i).getComment_status()%>"
                                           style="display: none">
                                </div>
                                <div class="item-col item-col-date">
                                    <div class="item-heading">Ngày thêm</div>
                                    <div class="no-overflow"><%=list.get(i).getCommented_date()%>
                                    </div>
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
                                                    <a class="remove" id="remove<%=list.get(i).getComment_id()%>"
                                                       data-toggle="modal"
                                                       data-target="#confirm-modal" style="cursor: pointer">
                                                        <i class="fa fa-trash-o "></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="info" id="info<%=list.get(i).getComment_id()%>"
                                                       style="cursor: pointer">
                                                        <i class="fa fa-info-circle"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="toggle" id="toggle<%=list.get(i).getComment_id()%>"
                                                       style="cursor: pointer">
                                                        <%
                                                            if (list.get(i).getComment_status() == 1) { %>
                                                        <i class="fa fa-toggle-off" style="color: #0b3d88"></i>
                                                        <% } else { %>
                                                        <i class="fa fa-toggle-on" style="color: green"></i>
                                                        <%} %>
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
                        <a class="page-link" id="page" href="#" style="text-decoration: none;">1</a>
                    </li>
                    <a class="page-link" id="btn_next" style="text-decoration: none;"> Kế tiếp </a>
                </ul>
            </nav>
        </article>
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
                        <p>Bạn có chắc muốn thực hiện hành động này ?</p>
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
        <div class="modal fade" id="confirm-detailsModal">
            <div class="modal-dialog" role="document" style="max-width: 760px;">
                <div class="modal-content" style="width: 760px;">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <i class="fa fa-info-circle"></i> Thông tin chi tiết
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
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

    function toggle() {
        $(".toggle").each(function () {
            $(this).click(function (e) {
                e.preventDefault();
                const id = $(this).attr("id").substring(6);
                const status = $("#status").val();
                console.log(status);
                $.ajax({
                    url: "/CuoiKiWeb_war/StatusCommentControllerAdmin",
                    type: "post",
                    data: {
                        id: id,
                        status: status
                    },
                    success: function () {
                        if (status === "0") {
                            $("#toggle" + id + " i").remove()
                            $("#toggle" + id).append(`<i class="fa fa-toggle-off" style="color: #0b3d88"></i>`)
                            $("#item" + id + " .item-col-author .no-overflow a").text("Hiển thị");
                            $("#status").val("1");
                        } else {
                            $("#toggle" + id + " i").remove()
                            $("#toggle" + id).append(`<i class="fa fa-toggle-on" style="color: green"></i>`)
                            $("#item" + id + " .item-col-author .no-overflow a").text("Đã Ẩn");
                            $("#status").val("0");
                        }
                        reloadScript();
                    }
                })
            });
        })
    }

    toggle();

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
                    url: "/CuoiKiWeb_war/LoadCommentListAdmin",
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