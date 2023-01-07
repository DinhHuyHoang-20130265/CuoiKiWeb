<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.OrderService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.AccountService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Trang Quản Lý</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
    <!-- Place favicon.ico in the root directory -->
    <link rel="stylesheet" href="css/vendor.css"/>
    <link rel="stylesheet" href="css/orders-list.css"/>
    <style>
        .input-group-btn {
            display: flex;
        }
    </style>
    <!-- Theme initialization -->
    <script>
        var themeSettings = localStorage.getItem("themeSettings")
            ? JSON.parse(localStorage.getItem("themeSettings"))
            : {};
        var themeName = themeSettings.themeName || "";
        if (themeName) {
            document.write(
                '<link rel="stylesheet" id="theme-style" href="css/app-' +
                themeName +
                '.css">'
            );
        } else {
            document.write(
                '<link rel="stylesheet" id="theme-style" href="css/app.css">'
            );
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
                            <h3 class="title">
                                Danh sách đơn hàng
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="omni-tabs-wrapper">
                    <ul role="tablist" class="omni-tabs false">
                        <li class="omni-tab-container">
                            <a class="omni-tab omni-tab-selected"><span class="text-black">Tất cả đơn
                                        hàng</span></a>
                        </li>
                    </ul>
                    <div class="p-4">
                        <div class="row no-gutters">
                            <div class="col">
                                <div class="">
                                    <div class="row no-gutters">
                                        <div class="col-auto pr-3">
                                            <div class="filter-options__childrent__dropdown__menu">
                                                <select class="form-select" aria-label="Default select example"
                                                        style="border: none;" id="filter">
                                                    <option value="0" selected>Sắp xếp theo: Ngày tạo gần nhất</option>
                                                    <option value="1">Ngày tạo cũ nhất</option>
                                                    <option value="2">Giá trị nhỏ dần</option>
                                                    <option value="3">Giá trị lớn dần</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="next-input--stylized">
                                                <div class="next-input-add-on next-input__add-on--before">
                                                    <svg class="svg-next-icon svg-next-icon-size-18" width="18"
                                                         height="18">
                                                        <svg viewBox="0 0 12 12">
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                  d="M7.92082 7.44942C7.95668 7.484 8.00454 7.50332 8.05435 7.50332H8.23644C8.40734 7.50332 8.57122 7.57129 8.69194 7.69226L11.3339 10.3395C11.608 10.6141 11.6078 11.0589 11.3334 11.3333C11.059 11.6077 10.6142 11.6079 10.3395 11.3338L7.69232 8.69188C7.57135 8.57116 7.50338 8.40728 7.50338 8.23638V8.05429C7.50338 8.00448 7.48406 7.95661 7.44948 7.92076C7.3787 7.84736 7.26321 7.84232 7.18318 7.90552C6.44385 8.48941 5.51187 8.83665 4.50338 8.83665C2.11004 8.83665 0.170044 6.89665 0.170044 4.50332C0.170044 2.10998 2.11004 0.169983 4.50338 0.169983C6.89671 0.169983 8.83671 2.10998 8.83671 4.50332C8.83671 5.51181 8.48947 6.44378 7.90558 7.18312C7.84238 7.26315 7.84742 7.37864 7.92082 7.44942ZM1.50338 4.50332C1.50338 6.16332 2.84338 7.50332 4.50338 7.50332C6.16338 7.50332 7.50338 6.16332 7.50338 4.50332C7.50338 2.84332 6.16338 1.50332 4.50338 1.50332C2.84338 1.50332 1.50338 2.84332 1.50338 4.50332Z">
                                                            </path>
                                                        </svg>
                                                    </svg>
                                                </div>
                                                <input autocomplete="on" type="text" id="searchUser"
                                                       class="next-input next-input--invisible" placeholder="Tìm kiếm"
                                                       step="1" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="display-none"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="position-relative">
                            <div class="order-list--table table-list--config">
                                <div class="ui-table-listing-container">
                                    <table class="ui-table" id="appendItem">
                                        <thead>
                                        <tr>
                                            <th class="table-header--check">
                                                <div class="hrv-next-input-checkbox z-index-20">
                                                    <label
                                                            class="hrv-next-label--switch hrv-next-label--empty"></label>
                                                </div>
                                            </th>
                                            <th class="table-header--id"><span>Mã</span></th>
                                            <th class="table-header--datetime">
                                                <span>Ngày tạo</span>
                                            </th>
                                            <th class="table-header--name">
                                                <span>Tài khoản</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span id="cspot-orders-trangthaithanhtoan">Thanh toán</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span id="cspot-orders-trangthaigiaohang">Giao hàng</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span id="cspot-orders-trangthaidonhang">Trạng thái</span>
                                            </th>
                                            <th class="table-header--money">
                                                <span>Tổng tiền</span>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            List<Order> orders = OrderService.getInstance().getOrderListCondition("1", "0", null);
                                            NumberFormat formatter = NumberFormat.getInstance(new Locale("vn", "VN"));
                                            if (orders != null) {
                                                for (Order order : orders) {
                                                    SiteUser siteUser = AccountService.getInstance().getAccountById(order.getCustomer_id()); %>
                                        <tr class="order" id="order<%=order.getOrd_id()%>">
                                            <td class="cursor-pointer">
                                                <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
                                                     width="20" height="20">
                                                </svg>
                                            </td>
                                            <td class="no-wrap pl-0">
                                                <a href="order-details.jsp?id=<%=order.getOrd_id()%>">#<%=order.getOrd_id()%>
                                                </a>
                                                <div class="d-inline-block">
                                                    <span class="ml-1">
                                                        <svg class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                                                             width="14" height="14">
                                                                    <svg
                                                                            viewBox="0 0 20 20">
                                                                        <path
                                                                                d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                                                                        </path>
                                                                    </svg></svg>
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="order-date"><%=order.getOrd_date()%>
                                            </td>
                                            <td class="max-width-200px">
                                                <div class="trigger">
                                                    <span>
                                                        <div class="order_list_customer">
                                                            <p class="mb-0 px-2 align-items-center word-break">
                                                                <span class="omni-shorten-text"
                                                                      title="<%=(siteUser == null || siteUser.getUsername() == null) ? order.getCustomer_id() : siteUser.getUsername()%>"><%=(siteUser == null || siteUser.getUsername() == null) ? order.getCustomer_id() : siteUser.getUsername()%></span>
                                                            </p>
                                                        </div>
                                                    </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="status-component">
                                                    <%if (order.getPayment_status() == 0) { %>
                                                    <span class="circle-status mr-2 circle-status-purchase-4"></span>
                                                    <span class="badges--purchase-order-status-4">Chưa thanh toán</span>
                                                    <% } else { %>
                                                    <span class="circle-status mr-2 circle-status-confirmed"></span>
                                                    <span class="badges--purchase-order-status-3">Đã thanh toán</span>
                                                    <% }%>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="status-component">
                                                        <%if (order.getDelivered() == -1) { %>
                                                        <span class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                                                            class="badges--shipment-cod-status-2">
                                                                    Chưa giao hàng</span>
                                                        <% } else if (order.getDelivered() == 0) { %>
                                                        <span class="circle-status mr-2 circle-status-shipment_ontheway"></span><span
                                                            class="badges--order-payment-status-5">
                                                                    Đang giao hàng</span>
                                                        <% } else { %>
                                                        <span class="circle-status mr-2 circle-status-shipment_done"></span><span
                                                            class="badges--carrier-status-4">
                                                                    Đã giao hàng</span>
                                                        <% }%>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="status-component">
                                                        <%if (order.getStatus() == 0) { %>
                                                        <span
                                                                class="circle-status mr-2 circle-status-cancel"></span><span
                                                            class="badges--order-status-cancel">
                                                                    Chưa xác nhận</span>
                                                        <% } else { %>
                                                        <span
                                                                class="circle-status mr-2 circle-status-complete"></span><span
                                                            class="badges--carrier-status-4">
                                                                    Đã xác nhận</span>
                                                        <% }%>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-right"><%=formatter.format(order.getTotal())%>
                                            </td>
                                            <td>
                                                <a style="cursor: pointer" class="remove" href="#" data-toggle="modal"
                                                   data-target="#confirm-modal"
                                                   id="remove<%=order.getOrd_id()%>">
                                                    <i class="fa fa-trash-o"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <% }
                                        }%>
                                        </tbody>
                                    </table>
                                </div>
                                <nav class="text-right">
                                    <ul class="pagination">
                                        <li class="page-item">
                                            <a class="page-link" style="text-decoration: none;" id="btn_prev">
                                                Trước </a>
                                        </li>
                                        <li class="page-item active">
                                            <a class="page-link" id="page" style="text-decoration: none;">1</a>
                                        </li>
                                        <a class="page-link" id="btn_next" style="text-decoration: none;"> Kế tiếp </a>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
        <div class="modal fade" id="confirm-modal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fa fa-warning"></i> Lưu ý</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc muốn xoá đơn hàng này ?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="yesButton" class="btn btn-primary" data-dismiss="modal">
                            Có
                        </button>
                        <button type="button" class="btn btn-secondary no" data-dismiss="modal">
                            Không
                        </button>
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
        i["GoogleAnalyticsObject"] = r;
        (i[r] =
            i[r] ||
            function () {
                (i[r].q = i[r].q || []).push(arguments);
            }),
            (i[r].l = 1 * new Date());
        (a = s.createElement(o)), (m = s.getElementsByTagName(o)[0]);
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m);
    })(
        window,
        document,
        "script",
        "https://www.google-analytics.com/analytics.js",
        "ga"
    );
    ga("create", "UA-80463319-4", "auto");
    ga("send", "pageview");
</script>
<script src="./js/jquery-3.6.1.min.js"></script>
<script src="./js/vendor.js"></script>
<script src="./js/app.js"></script>
<script>
    function deleteOrder() {
        $(".remove").each(function () {
            const id = $(this).attr("id").substring(6);
            const search = $("#searchUser").val();
            const page = parseInt($("#page").text());
            const order = $("#filter").find(':selected').val();
            $(this).on("click", function (e) {
                e.preventDefault();
                console.log("gonna delete")
                $("#yesButton").click(function () {
                    console.log("deleted")
                    $.ajax({
                        url: "/CuoiKiWeb_war/DeleteOrderController",
                        type: "post",
                        data: {
                            id: id,
                            search: search,
                            page: page,
                            order: order
                        },
                        success: function (data) {
                            $("#appendItem").html(data);
                            deleteOrder();
                        }
                    })
                })
            })
        })
    }

    function filterAdmin(e) {
        e.preventDefault();
        const page = 1;
        const order = $("#filter").find(':selected').val();
        const search = $("#searchUser").val();
        $.ajax({
            url: "/CuoiKiWeb_war/LoadOrderListAdmin",
            type: "post",
            data: {
                page: page,
                order: order,
                search: search
            },
            success: function (data) {
                $("#appendItem tbody").html(data);
                deleteOrder();
            }
        })
    }

    $(document).ready(function () {
        deleteOrder();
        $("#filter").change(function (e) {
            filterAdmin(e);
            deleteOrder();
        })
        $("#searchUser").on("input", function (e) {
            e.preventDefault();
            const search = this.value;
            const order = $("#filter").find(':selected').val();
            const page = 1;
            $.ajax({
                url: "/CuoiKiWeb_war/LoadOrderListAdmin",
                type: "post",
                data: {
                    page: page,
                    order: order,
                    search: search
                },
                success: function (data) {
                    $("#appendItem tbody").html(data);
                    $("#page").text(page)
                    deleteOrder();
                }
            })
        })
        $("#btn_prev").on("click", function (e) {
            e.preventDefault();
            const search = $("#searchUser").val();
            const page = parseInt($("#page").text()) - 1;
            const order = $("#filter").find(':selected').val();
            if (page > 0) {
                $.ajax({
                    url: "/CuoiKiWeb_war/LoadOrderListAdmin",
                    type: "post",
                    data: {
                        page: page,
                        search: search,
                        order: order
                    },
                    success: function (data) {
                        $("#appendItem tbody").html(data);
                        $("#page").text(page)
                        deleteOrder();
                    }
                })
            }
        })
        $("#btn_next").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) + 1;
            const search = $("#searchUser").val();
            const order = $("#filter").find(':selected').val();
            $.ajax({
                url: "/CuoiKiWeb_war/LoadOrderListAdmin",
                type: "post",
                data: {
                    page: page,
                    search: search,
                    order: order
                },
                success: function (data) {
                    if ($.trim(data)) {
                        $("#appendItem tbody").html(data);
                        $("#page").text(page)
                        deleteOrder();
                    }
                }
            })
        })
    })
</script>
</body>

</html>
<%}%>