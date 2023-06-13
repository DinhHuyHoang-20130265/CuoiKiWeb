<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.News" %>
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
                check = true;
                break;
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
        <article class="content items-list-page">
            <div class="title-search-block">
                <div class="title-block">
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="title"> Danh sách tin tức
                                <a href="post-editor.jsp" class="btn btn-primary btn-sm rounded-s"> Thêm tin tức </a>
                            </h3>
                        </div>
                    </div>
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
                            <div class="item-col item-col-header item-col-title" style="text-align: center">
                                <div>
                                    <span>Tiêu đề</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales" style="text-align: center;">
                                <div>
                                    <span>Mã bài</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-stats" style="text-align: center;">
                                <div class="no-overflow">
                                    <span>Mô tả</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author" style="text-align: center;">
                                <div class="no-overflow">
                                    <span>Người thêm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author"
                                 style="text-align: center;">
                                <div class="no-overflow">
                                    <span>Trạng thái</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-date" style="text-align: center;">
                                <div>
                                    <span>Ngày thêm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header fixed item-col-actions-dropdown"></div>
                        </div>
                    </li>
                    <% int pageNumb = -1;
                        List<News> list = NewsService.getInstance().getListNewsByPage(1);
                        if (list.size() > 4)
                            pageNumb = 4;
                        else pageNumb = list.size();
                    %>
                    <div id="appendItem">
                        <% if (list != null)
                            for (int i = 0; i < pageNumb; i++) {%>
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
                                        <a href="post-editor.jsp?id=<%=list.get(i).getNews_id()%>" class=""
                                           style="margin-left: 30px !important; text-decoration: none">
                                            <h4 class="item-title"><%=list.get(i).getNews_title()%>
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-sales" style="text-align: center;">
                                    <div class="item-heading">Mã bài</div>
                                    <div>#<%=list.get(i).getNews_id()%>
                                    </div>
                                </div>
                                <div class="item-col item-col-stats no-overflow">
                                    <div class="item-heading">Mô tả</div>
                                    <div class="no-overflow">
                                        <%=list.get(i).getDescription()%>
                                    </div>
                                </div>
                                <div class="item-col item-col-author" style="text-align: center;">
                                    <div class="item-heading">Người thêm</div>
                                    <div class="no-overflow">
                                        <a><%=list.get(i).getPosted_by()%>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-author" style="text-align: center;">
                                    <div class="item-heading">Trạng Thái</div>
                                    <div class="no-overflow" style="text-align: center">
                                        <a> Hiển thị </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-date" style="text-align: center;">
                                    <div class="item-heading">Ngày thêm</div>
                                    <div class="no-overflow"><%=list.get(i).getPosted_date()%>
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
                                                <%
                                                    for (AdminRole role : admin.getRole()) {
                                                        if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("product") && role.getPermission().equals("delete")) {
                                                %>
                                                <li>
                                                    <a class="remove" id="remove<%=list.get(i).getNews_id()%>"
                                                       data-toggle="modal"
                                                       data-target="#confirm-modal" style="cursor: pointer">
                                                        <i class="fa fa-trash-o "></i>
                                                    </a>
                                                </li>
                                                <%
                                                    }
                                                    if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("product") && role.getPermission().equals("update")) {
                                                %>
                                                <li>
                                                    <a class="edit" id="edit"
                                                       href="post-editor.jsp?id=<%=list.get(i).getNews_id()%>">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                </li>
                                                <%
                                                        }
                                                    }
                                                %>
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
                        <a class="page-link" id="btn_prev" style="text-decoration: none;"> Trước </a>
                    </li>
                    <li class="page-item active">
                        <a class="page-link" id="pageNumb" href="#" style="text-decoration: none;">1</a>
                    </li>
                    <a class="page-link" id="btn_next" style="text-decoration: none;"> Kế tiếp </a>
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

    function deleteNews() {
        $(".remove").each(function () {
            const id = $(this).attr("id").substring(6);
            const pageNumb = parseInt($("#pageNumb").text());
            $(this).on("click", function (e) {
                e.preventDefault();
                $("#yes").click(function () {
                    console.log("deleted")
                    $.ajax({
                        url: "../DeleteNewsControllerAdmin",
                        type: "post",
                        data: {
                            id: id,
                            pageNumb: pageNumb
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

    deleteNews();

    $(document).ready(function () {
        $("#btn_prev").on("click", function (e) {
            e.preventDefault();
            const pageNumb = parseInt($("#pageNumb").text()) - 1;
            if (pageNumb > 0) {
                $.ajax({
                    url: "../LoadNewsListAdminController",
                    type: "post",
                    data: {
                        pageNumb: pageNumb
                    },
                    success: function (data) {
                        $("#appendItem").html(data);
                        $("#pageNumb").text(pageNumb)
                        deleteNews();
                        reloadScript();
                        // info();
                    }
                })
            }
        })
        $("#btn_next").on("click", function (e) {
            e.preventDefault();
            const pageNumb = parseInt($("#pageNumb").text()) + 1;
            $.ajax({
                url: "../LoadNewsListAdminController",
                type: "post",
                data: {
                    pageNumb: pageNumb
                },
                success: function (data) {
                    if ($.trim(data)) {
                        $("#appendItem").html(data);
                        $("#pageNumb").text(pageNumb)
                        deleteNews();
                        reloadScript();
                    }
                },
                error: function (data) {
                    console.log(data)
                }
            })
        })
    })
</script>
</body>
</html>
<%
        }
    }
%>