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
    <link rel="stylesheet" href="DataTables-1.13.4/css/dataTables.dataTables.min.css">
    <link rel="stylesheet" href="DataTables-1.13.4/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="DataTables-1.13.4/css/dataTables.bootstrap.min.css">
    <%--    <link rel="stylesheet" href="DataTables-1.13.4/css/dataTables.bootstrap4.min.css">--%>
    <%--    <link rel="stylesheet" href="DataTables-1.13.4/css/dataTables.bootstrap5.min.css">--%>
    <link rel="stylesheet" href="DataTables-1.13.4/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="DataTables-1.13.4/css/dataTables.bulma.min.css">
    <link rel="stylesheet" href="DataTables-1.13.4/css/dataTables.jqueryui.min.css">
    <link rel="stylesheet" href="DataTables-1.13.4/css/dataTables.semanticui.min.css">
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
                                <button type="submit" class="btn btn-primary import_btn" style="margin: 0 0 40px 20px;">
                                    Nhập hàng
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card item">
                <table id="myTable">
                    <thead>
                    <tr>
                        <th>
                            Mã nhập hàng
                        </th>
                        <th>
                            Mã sản phẩm
                        </th>
                        <th>
                            Tên sản phẩm
                        </th>
                        <th>
                            Số lượng nhập
                        </th>
                        <th>
                            Người nhập
                        </th>
                        <th>
                            Ngày nhập
                        </th>
                        <th>
                            Thao tác
                        </th>
                    </tr>
                    </thead>
                    <tbody class="appendItem">
                    <% List<ImportProduct> importProductList = ImportProductService.getInstance().getListImport();
                        for (ImportProduct importProduct : importProductList) { %>
                    <tr class="item">
                        <td>
                            <%= importProduct.getId() %>
                        </td>
                        <td>
                            <%= importProduct.getId_prod() %>
                        </td>
                        <td>
                            <%= importProduct.getProd_name() %>
                        </td>
                        <td>
                            <%= importProduct.getQuantity() %>
                        </td>
                        <td>
                            <%= importProduct.getImport_by() %>
                        </td>
                        <td>
                            <%= importProduct.getDate_import() %>
                        </td>
                        <td>
                            <div class="item-actions-dropdown">
                                <div class="item-actions-block">
                                    <ul class="item-actions-list">
                                        <% for (AdminRole role : admin.getRole()) {
                                            if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("import") && role.getPermission().equals("delete")) { %>
                                        <li style="list-style: none">
                                            <a class="remove" id="remove<%= importProduct.getId() %>"
                                               data-toggle="modal"
                                               data-target="#confirm-modal" style="cursor: pointer">
                                                <i class="fa fa-trash-o" style="color: red"></i>
                                            </a>
                                        </li>
                                        <% }
                                        } %>
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
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
<script src="./DataTables-1.13.4/js/jquery.dataTables.min.js"></script>
<script>
    let table = new DataTable('#myTable');
</script>
<script src="./js/datatables.min.js"></script>
<script src="./DataTables-1.13.4/js/dataTables.bootstrap.min.js"></script>
<%--<script src="./DataTables-1.13.4/js/dataTables.bootstrap4.min.js"></script>--%>
<%--<script src="./DataTables-1.13.4/js/dataTables.bootstrap5.min.js"></script>--%>

<script src="./DataTables-1.13.4/js/dataTables.jqueryui.min.js"></script>
<script src="./DataTables-1.13.4/js/dataTables.bulma.min.js"></script>
<script src="./DataTables-1.13.4/js/dataTables.dataTables.min.js"></script>
<script src="./DataTables-1.13.4/js/dataTables.foundation.min.js"></script>
<script src="./DataTables-1.13.4/js/dataTables.semanticui.min.js"></script>

<script src="./js/vendor.js"></script>
<script src="./js/app.js"></script>

<script>
    $(document).ready(function () {
        deleteImport();
    })
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
            console.log(id)
            $(this).on("click", function (e) {
                e.preventDefault();
                $("button[type='button'].yes").on("click", function () {
                    $.ajax({
                        url: "../DeleteImportAdminController",
                        type: "post",
                        data: {
                            id: id
                        },
                        success: function (data) {
                            window.location.href = "/CuoiKiWeb_war/admin-page/import-product-list.jsp"
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
        if (idProd === "" || quantity === "") {
            alert("Vui lòng điền đầy đủ mã sản phẩm và số lượng nhập");
            return false;
        } else {
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
</script>
</body>

</html>
<%
        }
    }
%>