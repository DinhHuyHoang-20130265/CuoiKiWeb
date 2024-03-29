<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.promotion.Promotion" %>
<%@ page import="vn.edu.hcmuaf.fit.services.PromotionService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode" %>
<%@ page import="vn.edu.hcmuaf.fit.DAO.PromotionCodeDAO" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 4/21/2023
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .input-group-btn {
            display: flex;
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
            if (role.getTable().equals("sales") || role.getTable().equals("admin")) {
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
                            <h3 class="title"> Danh sách mã khuyến mãi
                                <a href="code-editor.jsp" class="btn btn-primary btn-sm rounded-s"> Thêm mã khuyến mãi
                                </a>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card item">
                <ul class="item-list striped" id="items">
                    <li class="item item-list-header" id="first-child">
                        <div class="item-row">
                            <div class="item-col fixed item-col-check">
                                <label class="item-check" id="select-all-items">
                                    <input type="checkbox" class="checkbox">
                                    <span></span>
                                </label>
                            </div>
                            <div class="item-col item-col-header item-col-sales" style="text-align: left">
                                <div>
                                    <span>ID mã KM</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales" style="text-align: left; margin-left: 20px">
                                <div>
                                    <span>Tên mã KM</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-category" style="margin-left: 10px">
                                <div class="no-overflow">
                                    <span>Mô tả mã KM</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-category" style="margin-left: 40px">
                                <div class="no-overflow">
                                    <span>Loại mã</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-stats">
                                <div class="no-overflow">
                                    <span>Giảm giá</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author">
                                <div class="no-overflow" style="text-align: center">
                                    <span>Trạng thái</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-date">
                                <div>
                                    <span>Ngày bắt đầu</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-date" style="text-align: center!important;">
                                <div>
                                    <span>Ngày kết thúc</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header fixed item-col-actions-dropdown"></div>
                        </div>
                    </li>
                    <%List<PromotionCode> codes = new PromotionCodeDAO().loadPromotionWithConditionContainsStatus(1, 6);
                        NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
                    %>
                    <div id="appendItem">
                        <%for (PromotionCode code: codes) {%>
                        <li class="item">
                            <div class="item-row">
                                <div class="item-col fixed item-col-check">
                                    <label class="item-check" id="select-all-items">
                                        <input type="checkbox" class="checkbox">
                                        <span></span>
                                    </label>
                                </div>
                                <div class="item-col fixed item-col-sales" style="text-align: left; max-width: 130px;min-width: 130px;">
                                    <div class="item-heading">ID mã KM</div>
                                    <div>
                                        <a>
                                            <h4 class="item-title"><%=code.getCode_id()%>
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col fixed item-col-sales"
                                     style="min-width:100px; text-align: center; max-width: 100px">
                                    <div class="item-heading">Tên mã KM</div>
                                    <div>
                                        <a>
                                            <h4 class="item-title"><%=code.getName_code()%>
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col fixed pull-left item-col-category"
                                     style="min-width: 130px; max-width: 130px; margin-left: 40px;">
                                    <div class="item-heading">Mô tả mã KM</div>
                                    <div>
                                        <a>
                                            <h4 class="item-title"><%=code.getDesc_code()%>
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col fixed pull-left item-col-category"
                                     style="min-width: 150px; max-width: 150px; margin-left: 20px">
                                    <div class="item-heading">Loại mã</div>
                                    <div>
                                        <a>
                                            <h4 class="item-title"><%=code.getType_code()%>
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-stats" style="margin-left: -10px">
                                    <div class="item-heading">Giảm giá</div>
                                    <div class="sales" style="text-align: center"><%=format.format(code.getDiscount_money())%>đ
                                    </div>
                                </div>
                                <div class="item-col item-col-author" style="text-align: center">
                                    <div class="item-heading">Trạng thái</div>
                                    <div class="no-overflow">
                                        <a><%=code.getStatus() == 1 ? "Hiển thị" : "Đã ẩn"%>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-date no-overflow">
                                    <div class="item-heading">Ngày bắt đầu</div>
                                    <div class="no-overflow"><%=code.getStart_date()%>
                                    </div>
                                </div>
                                <div class="item-col item-col-date">
                                    <div class="item-heading">Ngày kết thúc</div>
                                    <div class="no-overflow" style="text-align: center">
                                        <%=code.getEnd_date()%>
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
                                                        if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("sales") && role.getPermission().equals("delete")) {
                                                %>
                                                <li>
                                                    <a class="remove" href="#" data-toggle="modal"
                                                       data-target="#confirm-modal" id="delete<%=code.getCode_id()%>">
                                                        <i class="fa fa-trash-o"></i>
                                                    </a>
                                                </li>
                                                <%
                                                    }
                                                    if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("sales") && role.getPermission().equals("update")) {
                                                %>
                                                <li>
                                                    <a class="edit" href="code-editor.jsp?id=<%=code.getCode_id()%>">
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
                        <p>Bạn có chắc muốn xoá sản phẩm này ?</p>
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
<script src="./js/jquery-3.6.1.min.js"></script>
<script src="./js/vendor.js"></script>
<script src="./js/app.js"></script>
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

    function deletePromotionCode() {
        $(".remove").each(function () {
            const id = $(this).attr("id").substring(6);
            const page = parseInt($("#page").text());
            $(this).on("click", function (e) {
                e.preventDefault();
                $("button[type='button'].yes").on("click", function () {
                    $.ajax({
                        url: "../DeletePromotionCodeAdminController",
                        type: "post",
                        data: {
                            id: id,
                            page: page
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

    deletePromotionCode();
    $(document).ready(function () {
        $("#btn_prev").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) - 1;
            console.log(page)
            if (page > 0) {
                $.ajax({
                    url: "../LoadPromotionCodeListAdmin",
                    type: "post",
                    data: {
                        page: page
                    },
                    success: function (data) {
                        $("#appendItem").html(data);
                        $("#page").text(page)
                        deletePromotionCode();
                        reloadScript();
                    }
                })
            }
        })
        $("#btn_next").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) + 1;
            console.log(page)
            $.ajax({
                url: "../LoadPromotionCodeListAdmin",
                type: "post",
                data: {
                    page: page
                },
                success: function (data) {
                    console.log(data)
                    if ($.trim(data)) {
                        $("#appendItem").html(data);
                        $("#page").text(page)
                        deletePromotionCode();
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
