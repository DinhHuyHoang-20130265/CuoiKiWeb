<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.AccountService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
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
            if (role.getTable().equals("user") || role.getTable().equals("admin")) {
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
                            <h3 class="title"> Danh sách người dùng
                                <a href="user-editor.jsp" class="btn btn-primary btn-sm rounded-s"> Thêm người
                                    dùng</a>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="items-search">
                    <form class="form-inline">
                        <div class="input-group">
                            <input type="text" id="searchUser" class="form-control boxed rounded-s"
                                   placeholder="Tìm người dùng...">
                            <span class="input-group-btn">
                                    <button class="btn btn-secondary rounded-s" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                        </div>
                    </form>
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
                                    <span>Ảnh</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-title">
                                <div>
                                    <span>Tên người dùng</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales">
                                <div>
                                    <span>Mã người dùng</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-stats">
                                <div class="no-overflow">
                                    <span>Email</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-category">
                                <div class="no-overflow">
                                    <span>Địa chỉ</span>
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
                    <div id="appendItem">
                        <% List<SiteUser> accounts = AccountService.getInstance().loadAccountWithConditions(1, 6, null);%>
                        <% for (SiteUser user : accounts) {
                            if (!user.getId().equals(admin.getId()) && AccountService.getInstance().getAccountRole(user.getId()) == 0) {
                                UserInformation info = UserInformationService.getInstance().getUserInfo(user.getId());
                        %>
                        <li class="item">
                            <div class="item-row">
                                <div class="item-col fixed item-col-check">
                                    <label class="item-check" id="select-all-items">
                                        <input type="checkbox" class="checkbox">
                                        <span></span>
                                    </label>
                                </div>
                                <div class="item-col fixed item-col-img md">
                                    <a>
                                        <div class="item-img rounded"
                                             style="background-image: url(<%=(info.getAvatar_link() != null) ? info.getAvatar_link() : "https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg"%>)"></div>
                                    </a>
                                </div>
                                <div class="item-col fixed pull-left item-col-title">
                                    <div class="item-heading">Tên người dùng</div>
                                    <div>
                                        <a style="text-decoration: none">
                                            <h4 class="item-title"><%=info.getFull_name()%>
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-sales">
                                    <div class="item-heading">Mã nguời dùng</div>
                                    <div><%=user.getId()%>
                                    </div>
                                </div>
                                <div class="item-col item-col-stats no-overflow">
                                    <div class="item-heading">Email</div>
                                    <div class="no-overflow">
                                        <%=info.getEmail() != null ? info.getEmail() : ""%>
                                    </div>
                                </div>
                                <div class="item-col item-col-category no-overflow">
                                    <div class="item-heading">Địa chỉ</div>
                                    <div class="no-overflow">
                                        <a style="text-decoration: none"><%=info.getAddress() != null ? info.getAddress() : ""%>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-author">
                                    <div class="item-heading">Trạng thái</div>
                                    <div class="no-overflow">
                                        <a><%=user.getAccount_status() == 1 ? "Hoạt động" : "Tạm dừng"%>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-date">
                                    <div class="item-heading">Ngày thêm</div>
                                    <div class="no-overflow"><%=info.getCreated_date() != null ? info.getCreated_date() : ""%>
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
                                                        if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("user") && role.getPermission().equals("delete")) {
                                                %>
                                                <li>
                                                    <a style="cursor:pointer;" class="remove"
                                                       id="remove<%=user.getId()%>" data-toggle="modal"
                                                       data-target="#confirm-modal">
                                                        <i class="fa fa-trash-o "></i>
                                                    </a>
                                                </li>
                                                <%
                                                    }
                                                    if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("user") && role.getPermission().equals("update")) {
                                                %>
                                                <li>
                                                    <a class="edit" href="user-editor.jsp?id=<%=user.getId()%>">
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
                        <% }
                        } %>
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
                        <button type="button" class="btn btn-primary yes" data-dismiss="modal">Có</button>
                        <button type="button" class="btn btn-secondary no" data-dismiss="modal">Không</button>
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

    function deleteUser() {
        $(".remove").each(function () {
            const id = $(this).attr("id").substring(6);
            const search = $("#searchUser").val();
            const page = parseInt($("#page").text());
            $(this).on("click", function (e) {
                e.preventDefault();
                $("button[type='button'].yes").on("click", function () {
                    $.ajax({
                        url: "/CuoiKiWeb_war/DeleteAccountController",
                        type: "post",
                        data: {
                            id: id,
                            search: search,
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

    $(document).ready(function () {
        $("#filter").change(function (e) {
            deleteUser();
        })
        $("#searchUser").on("input", function (e) {
            e.preventDefault();
            const search = this.value
            const page = 1;
            $.ajax({
                url: "/CuoiKiWeb_war/LoadUserListAdmin",
                type: "post",
                data: {
                    page: page,
                    search: search
                },
                success: function (data) {
                    $("#appendItem").html(data);
                    $("#page").text(page)
                    deleteUser();
                    reloadScript();
                }
            })
        })
        $("#btn_prev").on("click", function (e) {
            e.preventDefault();
            const search = $("#searchUser").val();
            const page = parseInt($("#page").text()) - 1;
            if (page > 0) {
                $.ajax({
                    url: "/CuoiKiWeb_war/LoadUserListAdmin",
                    type: "post",
                    data: {
                        page: page,
                        search: search
                    },
                    success: function (data) {
                        $("#appendItem").html(data);
                        $("#page").text(page)
                        deleteUser();
                        reloadScript();
                    }
                })
            }
        })
        $("#btn_next").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) + 1;
            const search = $("#searchUser").val();
            $.ajax({
                url: "/CuoiKiWeb_war/LoadUserListAdmin",
                type: "post",
                data: {
                    page: page,
                    search: search
                },
                success: function (data) {
                    if ($.trim(data)) {
                        $("#appendItem").html(data);
                        $("#page").text(page)
                        deleteUser();
                        reloadScript();
                    }
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