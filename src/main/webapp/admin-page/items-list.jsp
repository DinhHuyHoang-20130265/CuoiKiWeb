<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.category.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
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
            if (role.getTable().equals("product") || role.getTable().equals("admin")) {
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
                            <h3 class="title"> Danh sách sản phẩm
                                <a href="item-editor.jsp" class="btn btn-primary btn-sm rounded-s"> Thêm sản phẩm
                                </a>
                                <div class="action dropdown">
                                    <select class="form-select" id="filter" aria-label="Default select example"
                                            style="font-size: 15px; border-color: #d7dde4;">
                                        <option selected value="0">Sắp xếp theo: Sản phẩm nổi bật</option>
                                        <option value="3">Tên A->Z</option>
                                        <option value="4">Tên Z->A</option>
                                        <option value="5">Cũ nhất</option>
                                        <option value="6">Mới nhất</option>
                                        <option value="7">Bán chạy nhất</option>
                                    </select>
                                </div>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="items-search">
                    <form class="form-inline">
                        <div class="input-group">
                            <input type="text" id="searchProduct" class="form-control boxed rounded-s"
                                   placeholder="Tìm kiếm...">
                            <span class="input-group-btn">
                                    <button class="btn btn-secondary rounded-s" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                        </div>
                    </form>
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
                            <div class="item-col item-col-header fixed item-col-img md">
                                <div>
                                    <span>Ảnh</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-title">
                                <div>
                                    <span>Tên sản phẩm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales">
                                <div>
                                    <span>Mã sản phẩm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-stats">
                                <div class="no-overflow">
                                    <span>Đã bán</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-category">
                                <div class="no-overflow">
                                    <span>Loại sản phẩm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author">
                                <div class="no-overflow" style="text-align: center">
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
                   <%List<Product> products = ProductService.getInstance().loadProductWithConditionContainsStatus(1, 6, "0", "all", null, null, null, null);%>
                    <div id="appendItem">
                        <%for (Product p : products) {%>
                        <li class="item">
                            <div class="item-row">
                                <div class="item-col fixed item-col-check">
                                    <label class="item-check" id="select-all-items">
                                        <input type="checkbox" class="checkbox">
                                        <span></span>
                                    </label>
                                </div>
                                <div class="item-col fixed item-col-img md">
                                    <a href="">
                                        <img src="<%=p.getMain_img_link()%>" width=40px
                                             height=40px alt="">
                                    </a>
                                </div>
                                <div class="item-col fixed pull-left item-col-title">
                                    <div class="item-heading">Tên sản phẩm</div>
                                    <div>
                                        <a>
                                            <h4 class="item-title"><%=p.getProd_name()%>
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-sales">
                                    <div class="item-heading">Mã sản phẩm</div>
                                    <div class="sales" style="text-align: center"><%=p.getId()%>
                                    </div>
                                </div>
                                <div class="item-col item-col-stats no-overflow">
                                    <div class="item-heading">Đã bán</div>
                                    <div class="no-overflow"><%=ProductService.getInstance().getProductSaled(p.getId())%>
                                    </div>
                                </div>
                                <div class="item-col item-col-category no-overflow">
                                    <div class="item-heading">Loại sản Phẩm</div>
                                    <div class="no-overflow">
                                        <% String cate = "";
                                            List<Category> category = CategoryService.getInstance().getCateWithProductID(p.getId());
                                            for (Category c : category) {
                                                cate += c.getCate_name() + ", ";
                                            }%>
                                        <a><%=cate.substring(0, cate.length() - 2)%>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-author">
                                    <div class="item-heading">Trạng Thái</div>
                                    <div class="no-overflow" style="text-align: center">
                                        <a><%=p.getProd_status() == 1 ? "Hiển thị" : "Đã ẩn"%>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-date">
                                    <div class="item-heading">Ngày thêm</div>
                                    <div class="no-overflow"><%=p.getReleased_date()%>
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
                                                            if (ProductService.getInstance().isProductInOrder(p.getId()) == 0) { %>
                                                <li>
                                                    <a class="remove" href="#" data-toggle="modal"
                                                       data-target="#confirm-modal" id="delete<%=p.getId()%>">
                                                        <i class="fa fa-trash-o"></i>
                                                    </a>
                                                </li>
                                                <%
                                                        }
                                                    }
                                                    if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("product") && role.getPermission().equals("update")) {
                                                %>
                                                <li>
                                                    <a class="edit" href="item-editor.jsp?id=<%=p.getId()%>">
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

    function deleteProduct() {
        $(".remove").each(function () {
            const id = $(this).attr("id").substring(6);
            const search = $("#searchProduct").val();
            const page = parseInt($("#page").text());
            const orderby = $("#filter").find(':selected').val();
            $(this).on("click", function (e) {
                e.preventDefault();
                $("button[type='button'].yes").on("click", function () {
                    $.ajax({
                        url: "../DeleteProductAdminController",
                        type: "post",
                        data: {
                            id: id,
                            search: search,
                            page: page,
                            orderby: orderby
                        },
                        success: function (data) {
                            $("#appendItem").html(data);
                            reloadScript()
                        }
                    })
                })
            })
        })
    }

    function filterAdmin(e) {
        e.preventDefault();
        const page = 1;
        const orderby = $("#filter").find(':selected').val();
        const search = $("#searchProduct").val();
        $.ajax({
            url: "../LoadProductListAdminProduct",
            type: "post",
            data: {
                page: page,
                orderby: orderby,
                search: search
            },
            success: function (data) {
                $("#appendItem").html(data);
                deleteProduct();
                reloadScript();
            }
        })
    }

    $(document).ready(function () {
        deleteProduct();
        $("#filter").change(function (e) {
            filterAdmin(e);
            deleteProduct();
        })
        $("#searchProduct").on("input", function (e) {
            e.preventDefault();
            const search = this.value
            const page = 1;
            const orderby = $("#filter").find(':selected').val();
            $.ajax({
                url: "../LoadProductListAdminProduct",
                type: "post",
                data: {
                    page: page,
                    orderby: orderby,
                    search: search
                },
                success: function (data) {
                    $("#appendItem").html(data);
                    $("#page").text(page)
                    deleteProduct();
                    reloadScript();
                }
            })
        })
        $("#btn_prev").on("click", function (e) {
            e.preventDefault();
            const search = $("#searchProduct").val();
            const page = parseInt($("#page").text()) - 1;
            const orderby = $("#filter").find(':selected').val();
            if (page > 0) {
                $.ajax({
                    url: "../LoadProductListAdminProduct",
                    type: "post",
                    data: {
                        page: page,
                        orderby: orderby,
                        search: search
                    },
                    success: function (data) {
                        $("#appendItem").html(data);
                        $("#page").text(page)
                        deleteProduct();
                        reloadScript();
                    }
                })
            }
        })
        $("#btn_next").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) + 1;
            const orderby = $("#filter").find(':selected').val();
            const search = $("#searchProduct").val();
            $.ajax({
                url: "../LoadProductListAdminProduct",
                type: "post",
                data: {
                    page: page,
                    orderby: orderby,
                    search: search
                },
                success: function (data) {
                    if ($.trim(data)) {
                        $("#appendItem").html(data);
                        $("#page").text(page)
                        deleteProduct();
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