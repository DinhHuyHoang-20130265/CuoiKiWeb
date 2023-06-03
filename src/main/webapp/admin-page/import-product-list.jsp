<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.import_product.ImportProduct" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ImportProductService" %>
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
            if (role.getTable().equals("import") || role.getTable().equals("admin")) {
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
                            <h3 class="title"> Danh sách nhập hàng
                                <input class="id_admin" value="<%=admin.getId()%>" style="display: none">
                            </h3>
                        </div>
                        <div class="col-md-6">
                            <form class="form-inline float-md-right" style="margin-bottom: 10px">
                                <div class="form-group">
                                    <label for="idProd" style="margin-right: 30px">Mã sản phẩm</label>
                                    <input type="text" class="form-control" id="idProd">
                                </div>
                                <div class="form-group">
                                    <label for="quantity" style="margin-right: 17px;">Số lượng nhập</label>
                                    <input type="text" class="form-control" id="quantity">
                                </div>
                                <button type="submit" class="btn btn-primary import_btn" style="margin: 0 0 40px 20px;">Nhập hàng</button>
                            </form>
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
                            <div class="item-col item-col-header item-col-title" style="max-width: 125px !important;">
                                <div>
                                    <span>Mã nhập hàng</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales" style="text-align: left!important;">
                                <div style="margin-left: 10px">
                                    <span>Mã sản phẩm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-category">
                                <div class="no-overflow">
                                    <span>Tên sản phẩm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-category">
                                <div class="no-overflow">
                                    <span>Số lượng nhập</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author" style="max-width: 196px;">
                                <div class="no-overflow" style="text-align: center">
                                    <span>Người nhập</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author" style="max-width: 115px;">
                                <div class="no-overflow" style="text-align: center">
                                    <span>Ngày nhập</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header fixed item-col-actions-dropdown"></div>
                        </div>
                    </li>
                    <%List<ImportProduct> importProductList = ImportProductService.getInstance().loadImportWithConditionContainsStatus(1, 6);%>
                    <div id="appendItem">
                        <%
                            for (ImportProduct importProduct : importProductList) {
                        %>
                        <li class="item">
                            <div class="item-row">
                                <div class="item-col fixed item-col-check">
                                    <label class="item-check" id="select-all-items">
                                        <input type="checkbox" class="checkbox">
                                        <span></span>
                                    </label>
                                </div>
                                <div class="item-col fixed pull-left item-col-title"
                                     style="max-width: 125px !important;">
                                    <div class="item-heading">Mã nhập hàng</div>
                                    <div>
                                        <a>
                                            <h4 class="item-title"><%=importProduct.getId()%>
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-sales" style="text-align: left!important;">
                                    <div class="item-heading">Mã sản phẩm</div>
                                    <div class="sales" style="text-align: left; padding-left:20px">
                                        <%=importProduct.getId_prod()%>
                                    </div>
                                </div>
                                <div class="item-col item-col-category">
                                    <div class="item-heading">Tên sản phẩm</div>
                                    <div class="sales" style="text-align: left; margin-left: -69px">
                                        <%=importProduct.getProd_name()%>
                                    </div>
                                </div>
                                <div class="item-col item-col-category" style="max-width: 125px; margin-left: -50px">
                                    <div class="item-heading">Số lượng nhập</div>
                                    <div class="sales" style="text-align: left; margin-left: -50px">
                                        <%=importProduct.getQuantity()%>
                                    </div>
                                </div>
                                <div class="item-col item-col-author" style="max-width: 220px;">
                                    <div class="item-heading">Người nhập</div>
                                    <div class="no-overflow" style="text-align: center">
                                        <a>
                                            <%=importProduct.getImport_by()%>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-author" style="max-width: 100px;">
                                    <div class="item-heading">Ngày nhập</div>
                                    <div class="no-overflow" style="text-align: center">
                                        <a>
                                            <%=importProduct.getDate_import()%>
                                        </a>
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
                                                        if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("import") && role.getPermission().equals("delete")) {
                                                %>
                                                <li>
                                                    <a class="remove" id="remove<%=importProduct.getId()%>"
                                                       data-toggle="modal"
                                                       data-target="#confirm-modal" style="cursor: pointer">
                                                        <i class="fa fa-trash-o "></i>
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
                        <p>Bạn có chắc muốn xoá danh mục này ?</p>
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

    function deleteImport() {
        $(".remove").each(function () {
            const id = $(this).attr("id").substring(6);
            const page = parseInt($("#page").text());
            $(this).on("click", function (e) {
                e.preventDefault();
                $("button[type='button'].yes").on("click", function () {
                    $.ajax({
                        url: "../DeleteImportAdminController",
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
    $(".import_btn").click(function (e) {
        e.preventDefault();
        const idProd = $("#idProd").val();
        const quantity = $("#quantity").val();
        const id_admin = $(".id_admin").val();
        if(idProd==="" || quantity === ""){
            alert("Vui lòng điền đầy đủ mã sản phẩm và số lượng nhập");
            return false;
        }else {
            $.ajax({
                type: 'post',
                url: '../AddImportController',
                data: {
                    idProd: idProd,
                    quantity: quantity,
                    id_admin: id_admin
                },
                success: function (data) {
                    alert(data);
                    window.location.href = "/CuoiKiWeb_war/admin-page/import-product-list.jsp"
                }
            })
        }
    })
    deleteImport();
    $(document).ready(function () {
        $("#btn_prev").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) - 1;
            if (page > 0) {
                $.ajax({
                    url: "../LoadImportListAdminProduct",
                    type: "post",
                    data: {
                        page: page,
                    },
                    success: function (data) {
                        $("#appendItem").html(data);
                        $("#page").text(page)
                        deleteImport();
                        reloadScript();
                    }
                })
            }
        })
        $("#btn_next").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) + 1;
            $.ajax({
                url: "../LoadImportListAdminProduct",
                type: "post",
                data: {
                    page: page,
                },
                success: function (data) {
                    console.log(data)
                    if ($.trim(data)) {
                        $("#appendItem").html(data);
                        $("#page").text(page)
                        deleteImport();
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