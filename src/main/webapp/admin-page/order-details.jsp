<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.order.OrderDetail" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.services.*" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode" %>
<%@ page import="vn.edu.hcmuaf.fit.DAO.PromotionCodeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Trang Quản Lý</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
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
        boolean check = false;
        for (AdminRole role : admin.getRole()) {
            if (role.getTable().equals("order") || role.getTable().equals("admin")) {
                if (role.getPermission().equals("update") || role.getPermission().equals("admin"))
                    check = true;
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
                            <h3 class="title">
                                Chi tiết đơn hàng
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
            <%
                Order order = OrderService.getInstance().getOrderById(request.getParameter("id"));
                List<OrderDetail> details = OrderDetailService.getInstance().getListDetailsFromOrdId(request.getParameter("id"));
            %>
            <div>
                <div class="order-detail-header ui-title-bar-container max-width-center">
                    <div class="row align-items-start">
                        <div class="col-lg col-sm-12">
                            <div class="order-detail--list-status">
                                <div class="ui-toolbar-product-info">
                                    <div class="ui-product-body pl-0">Mã</div>
                                    <div class="ui-product-head">
                                        <div class="table-break-word"><strong
                                                class="order-detail--list-status-code">#<%=request.getParameter("id") != null ? request.getParameter("id") : "" %>
                                        </strong></div>
                                    </div>
                                </div>
                                <div class="ui-toolbar-product-info">
                                    <div class="ui-product-body">Trạng thái giao hàng</div>
                                    <div class="ui-product-head">
                                        <div class="table-break-word"><span class="order-detail--list-status-name">
                                                    <div class="status-component" id="header-delivery-status">
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
                                                </span></div>
                                    </div>
                                </div>
                                <div class="ui-toolbar-product-info">
                                    <div class="ui-product-body">Trạng thái thanh toán</div>
                                    <div class="ui-product-head">
                                        <div class="table-break-word"><span class="order-detail--list-status-name">
                                                    <div class="status-component" id="header-payment-status">
                                                        <%if (order.getPayment_status() == 0) { %>
                                                    <span class="circle-status mr-2 circle-status-purchase-4"></span>
                                                    <span class="badges--purchase-order-status-4">Chưa thanh toán</span>
                                                    <% } else { %>
                                                    <span class="circle-status mr-2 circle-status-confirmed"></span>
                                                    <span class="badges--purchase-order-status-3">Đã thanh toán</span>
                                                    <% }%>
                                                    </div>
                                                </span></div>
                                    </div>
                                </div>
                            </div>
                            <div><span><%=order.getOrd_date()%></span></div>
                        </div>
                    </div>
                </div>
                <div class="padding-container">
                    <div class="row">
                        <div class="col-lg-9 col-12">
                            <div class="omni-layout-card card-default">
                                <div class="omni-layout-card--header line-bottom">
                                    <div class="status-component" id="content-delivery-status">
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
                                <div>
                                    <div class="ui-table-normal-container">
                                        <table class="ui-table ui-table-vertical-top">
                                            <thead>
                                            <tr>
                                                <th class="table-header--product">Tên sản phẩm</th>
                                                <th class="text-center table-header--money">Số lượng</th>
                                                <th class="text-right table-header--money">Giá</th>
                                                <th class="text-right table-header--money">Thành tiền</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <% int quantity = 0;
                                                double price = 0;
                                                NumberFormat formatter = NumberFormat.getInstance(new Locale("vn", "VN"));%>
                                            <% for (OrderDetail detail : details) {
                                                quantity += detail.getQuantity();
                                                price += detail.getQuantity() * detail.getPrice();
                                            %>
                                            <tr>
                                                <td class="align-middle text-normal fix-overflow-tooltip">
                                                    <div class="order-block--table">
                                                        <div class="order-block--table-image">
                                                            <div class="table-cell--image"><img
                                                                    class="box-image"
                                                                    src="<%=ProductService.getInstance().getProductHiddenAndDetails(detail.getProd_id()).getMain_img_link()%>">
                                                            </div>
                                                        </div>
                                                        <div class="order-block--table-content"><a
                                                                target="_blank" href="#"><strong
                                                                class="text-primary mb-2 d-inline-block table-break-word"><span
                                                                class=""><%=ProductService.getInstance().getProductHiddenAndDetails(detail.getProd_id()).getProd_name()%> - <%=detail.getProd_size()%> - <%=detail.getProd_color()%>
                                                                            </span></strong></a>
                                                            <div class="mb-2 text-secondary"></div>
                                                            <span
                                                                    class="trigger ">
                                                                        <p
                                                                                class="word-break mb-2 text-secondary omni-text omni-text-line-1">
                                                                            Còn tồn <%=ProductService.getInstance().getProductHiddenAndDetails(detail.getProd_id()).getQuantity()%> trong kho
                                                                        </p>
                                                                    </span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="  align-middle text-center">
                                                    <div class="border-0"><%=detail.getQuantity()%>
                                                    </div>
                                                </td>
                                                <td class=" align-middle text-right">
                                                    <div class="border-0 text-right"><%=formatter.format(detail.getPrice())%>
                                                        ₫
                                                    </div>
                                                </td>
                                                <td class="  text-right align-middle">
                                                    <div class="border-0"><%=formatter.format(detail.getPrice() * detail.getQuantity())%>
                                                        ₫
                                                    </div>
                                                </td>
                                            </tr>
                                            <% } %>
                                            </tbody>
                                        </table>
                                        <div class="omni-layout-card--section">
                                            <div class="text-right">
                                                <select class="form-select" aria-label="Default select example"
                                                        id="deliveryStatus" style="border: 2px solid;
                                                        width: 125px;
                                                        height: 35px;
                                                        border-radius: 5px;
                                                    background: gainsboro;">
                                                    <%if (order.getDelivered() == -1) { %>
                                                    <option value="-1" selected>Chưa giao</option>
                                                    <option value="0">Đang giao</option>
                                                    <option value="1">Đã giao</option>
                                                    <% } else if (order.getDelivered() == 0) { %>
                                                    <option value="-1">Chưa giao</option>
                                                    <option value="0" selected>Đang giao</option>
                                                    <option value="1">Đã giao</option>
                                                    <% } else { %>
                                                    <option value="-1">Chưa giao</option>
                                                    <option value="0">Đang giao</option>
                                                    <option value="1" selected>Đã giao</option>
                                                    <% }%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="omni-layout-card card-default">
                                <div class="omni-layout-card--header line-bottom">
                                    <div class="status-component"
                                         id="content2-payment-status"><%if (order.getPayment_status() == 0) { %>
                                        <span class="circle-status mr-2 circle-status-purchase-4"></span>
                                        <span class="badges--purchase-order-status-4">Chờ xử lý thanh toán</span>
                                        <% } else { %>
                                        <span class="circle-status mr-2 circle-status-confirmed"></span>
                                        <span class="badges--purchase-order-status-3">Đã thanh toán</span>
                                        <% }%>
                                    </div>
                                </div>
                                <div class="omni-layout-card--section">
                                    <div class="row">
                                        <div class="col-sm-6"
                                             style="flex: 0 0 100% !important;max-width: 100% !important;">
                                            <div class="ui-information-body pb-4">
                                                <div class="row">
                                                    <div class="col">Số lượng sản phẩm</div>
                                                    <div class="col-auto text-right"><%=quantity%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ui-information-body pb-4">
                                                <div class="row">
                                                    <div class="col">Tổng tiền hàng</div>
                                                    <div class="col-auto text-right"><%=formatter.format(price)%> ₫
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ui-information-body pb-4">
                                                <div class="row">
                                                    <div class="col">
                                                        <p class="mb-0">Vận chuyển</p>
                                                    </div>
                                                    <div class="col-auto text-right"><%=formatter.format(order.getTransfer_fee())%>
                                                        ₫
                                                    </div>
                                                </div>
                                            </div>
                                            <%
                                                if (order.getCode_id() != null && !order.getCode_id().equals("NoCode")) {
                                                    PromotionCode code = PromotionCodeService.getInstance().getPromotionCodeById(order.getCode_id());
                                                    if (code.getType_code().equals("THOITRANG")) {%>
                                            <div class="ui-information-body pb-4">
                                                <div class="row">
                                                    <div class="col">
                                                        <p class="mb-0">Mã giảm giá thời trang</p>
                                                    </div>
                                                    <div class="col-auto text-right">
                                                        - <%=formatter.format(code.getDiscount_money())%> đ
                                                    </div>
                                                </div>
                                            </div>
                                            <%} else {%>
                                            <div class="ui-information-body pb-4">
                                                <div class="row">
                                                    <div class="col">
                                                        <p class="mb-0">Mã giảm giá vận chuyển</p>
                                                    </div>
                                                    <div class="col-auto text-right">
                                                        - <%=formatter.format(code.getDiscount_money())%> đ
                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>
                                            <%}%>
                                            <div class="ui-information-body pb-4">
                                                <div class="row">
                                                    <div class="col ">
                                                        <p class="mb-1 font-weight-bold">Tổng giá trị đơn hàng</p>
                                                    </div>
                                                    <div class="col-auto text-right font-weight-bold"><%=formatter.format(order.getTotal())%>
                                                        ₫
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ui-information-body pb-4">
                                                <div class="row">
                                                    <div class="col">Đã thanh toán</div>
                                                    <%if (order.getPayment_status() == 0) { %>
                                                    <div class="col-auto text-right">0 ₫</div>
                                                    <% } else { %>
                                                    <div class="col-auto text-right"><%=order.getTotal()%> ₫</div>
                                                    <% }%>
                                                </div>
                                            </div>
                                            <div class="pb-0 text-right">
                                                <div class="d-inline-block">
                                                    <div id="drop"
                                                         class="dropdown droup-popover ui-popover-arrow-right ui-popover-placement-right ">
                                                        <div id="content-payment-status">
                                                            <% if (order.getPayment_status() == 1) { %>
                                                            <span class="btn btn-primary btn"><span
                                                                    class="mr-2">Đã Thanh toán</span>
                                                            </span>
                                                            <% } else { %>
                                                            <button class="btn btn-primary btn" id="paymentStatus"><span
                                                                    class="mr-2">Xác nhận Thanh toán</span>
                                                            </button>
                                                            <% } %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pb-0 text-left">
                                                <div class="pb-0 text-left">
                                                    <a class="btn btn-primary btn" id="invoice"
                                                       href="Invoice?id=<%=order.getOrd_id()%>"><span
                                                            class="mr-2">In hóa đơn</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-12">
                            <div class="omni-layout-card card-default">
                                <div class="omni-layout-card--header line-bottom"><span class="header-title">Xác
                                            Thực Đơn Hàng</span></div>
                                <div class="omni-layout-card--section" id="contentOrderStatus">
                                    <% if (order.getStatus() == 0) { %>
                                    <div class="mb16">Lưu ý: Khi xác thực đơn hàng, bạn sẽ không thể hoàn tác</div>
                                    <a href="#" data-toggle="modal" data-target="#confirm-modal"
                                       class="btn btn-primary w-100" id="orderStatus"><span>Xác Thực Đơn Hàng</span>
                                    </a>
                                    <input type="text" id="order-status" value="<%=order.getStatus()%>"
                                           style="display: none">
                                    <% } else { %>
                                    <div class="mb16" style="color: green"><i class="fa fa-check"></i> Đơn hàng đã xác
                                        thực
                                    </div>
                                    <input type="text" id="order-status" value="<%=order.getStatus()%>"
                                           style="display: none">
                                    <% }%>
                                </div>
                            </div>
                            <div class="omni-layout-card card-default">
                                <div class="omni-layout-card--header">
                                    <div class="row align-items-center">
                                        <div class="col"><span class="header-title">Thông tin giao hàng</span></div>
                                        <div class="col-auto">
                                            <div class="display-none"></div>
                                            <div><span class="editaddress--block cursor-pointer"><svg
                                                    class="svg-next-icon text-secondary cursor-pointer svg-next-icon-size-12"
                                                    width="12" height="12"><svg
                                                    viewBox="0 0 512 512">
                                                                <g>
                                                                    <path
                                                                            d="M432,0c44.182,0,80,35.817,80,80c0,18.01-5.955,34.629-16,48l-32,32L352,48l32-32C397.371,5.955,413.988,0,432,0z M32,368   L0,512l144-32l296-296L328,72L32,368z M357.789,181.789l-224,224l-27.578-27.578l224-224L357.789,181.789z">
                                                                    </path>
                                                                </g>
                                                            </svg></svg></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="omni-layout-card--section">
                                    <div class="omni-layout-card--section-section">
                                        <p class="mb-2 table-break-word"><%=AccountService.getInstance().getAccountById(order.getCustomer_id()) == null ? order.getCustomer_id() : AccountService.getInstance().getAccountById(order.getCustomer_id()).getUsername()%>
                                        </p>
                                        <p class="mb-2"><%=order.getPhone_number()%>
                                        </p>
                                    </div>
                                    <div class="omni-layout-card--section-section">
                                        <p class="header-title">Địa Chỉ Giao Hàng</p>
                                        <p class="mb-0 table-break-word"><%=order.getAddress()%>
                                        </p>
                                    </div>
                                </div>
                                <div class="omni-layout-card--section">
                                    <div class="omni-layout-card--section-section">
                                        <p class="header-title">Ghi chú về khách hàng</p>
                                        <p class="mb-0 table-break-word text-nodata"><%=(order.getNote() == null || order.getNote().length() < 1) ? "Không có ghi chú" : order.getNote()%>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
        <input type="text" id="isCanceled-status" value="<%=order.getIsCanceled()%>"
               style="display: none">
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
                        <p>Bạn có chắc muốn xác nhận đơn hàng này ?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary yes" data-dismiss="modal">
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
<input type="text" id="ordId" value="<%=request.getParameter("id")%>" style="display:none;">
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
    const id = $("#ordId").val();
    $("#orderStatus").click(function (e) {
        e.preventDefault();
        $(".yes").click(function () {
            if (parseInt($("#isCanceled-status").val()) === 0) {
                alert("Đơn hàng hiện đã bị xóa, hãy khôi phục để có thể cập nhật đơn hàng")
            } else {
                $.ajax({
                    url: "../UpdateOrderStatus",
                    type: "post",
                    data: {
                        id: id
                    },
                    success: function () {
                        $("#order-status").val("1")
                        $("#contentOrderStatus").html(`<div class="mb16" style="color: green"><i class="fa fa-check"></i> Đơn hàng đã xác thực</div>`);
                    }
                })
            }
        })
    })
    $("#deliveryStatus").change(function (e) {
        e.preventDefault();
        const status = $(this).find(":selected").val();
        if ($("#order-status").val() === "0") {
            alert("Đơn hàng phải ở trạng thái xác nhận mới có thể thay đổi các trạng thái khác");
        } else if (parseInt($("#isCanceled-status").val()) === 0) {
            alert("Đơn hàng hiện đã bị xóa, hãy khôi phục để có thể cập nhật đơn hàng")
        } else {
            $.ajax({
                url: "../UpdateDeliveryStatus",
                type: "post",
                data: {
                    id: id,
                    status: status
                },
                success: function () {
                    alert("Cập nhật trạng thái đơn hàng thành công");
                    switch (status) {
                        case "-1":
                            $("#header-delivery-status").html(`<span class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                                                            class="badges--shipment-cod-status-2">
                                                                    Chưa giao hàng</span>`);
                            $("#content-delivery-status").html(`<span class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                                                            class="badges--shipment-cod-status-2">
                                                                    Chưa giao hàng</span>`)
                            break;
                        case "0":
                            $("#header-delivery-status").html(`<span class="circle-status mr-2 circle-status-shipment_ontheway"></span><span
                                                            class="badges--order-payment-status-5">
                                                                    Đang giao hàng</span>`);
                            $("#content-delivery-status").html(`<span class="circle-status mr-2 circle-status-shipment_ontheway"></span><span
                                                            class="badges--order-payment-status-5">
                                                                    Đang giao hàng</span>`)
                            break;
                        case "1":
                            $("#header-delivery-status").html(`<span class="circle-status mr-2 circle-status-shipment_done"></span><span
                                                            class="badges--carrier-status-4">
                                                                    Đã giao hàng</span>`);
                            $("#content-delivery-status").html(`<span class="circle-status mr-2 circle-status-shipment_done"></span><span
                                                            class="badges--carrier-status-4">
                                                                    Đã giao hàng</span>`)
                            break;
                    }
                }
            })
        }
    })
    $("#paymentStatus").click(function (e) {
        e.preventDefault();
        if ($("#order-status").val() === "0") {
            alert("Đơn hàng phải ở trạng thái xác nhận mới có thể thay đỏi các trạng thái khác");
        } else if (parseInt($("#isCanceled-status").val()) === 0) {
            alert("Đơn hàng hiện đã bị xóa, hãy khôi phục để có thể cập nhật đơn hàng")
        } else {
            $.ajax({
                url: "../UpdatePaymentStatus",
                type: "post",
                data: {
                    id: id
                },
                success: function () {
                    alert("Cập nhật trạng thái đơn hàng thành công");
                    $("#content-payment-status").html(`<span class="btn btn-primary btn"><span
                                                                    class="mr-2">Đã Thanh toán</span>
                                                            </span>`);
                    $("#content2-payment-status").html(`<span class="circle-status mr-2 circle-status-confirmed"></span>
                                                    <span class="badges--purchase-order-status-3">Đã thanh toán</span>`)
                    $("#header-payment-status").html(`<span class="circle-status mr-2 circle-status-confirmed"></span>
                                                    <span class="badges--purchase-order-status-3">Đã thanh toán</span>`);
                }
            })
        }
    })
</script>
</body>

</html>
<%
        }
    }
%>