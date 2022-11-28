<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
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
                                <div class="action dropdown">
                                    <button class="btn btn-sm rounded-s btn-secondary dropdown-toggle" type="button"
                                            id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                        Hành động
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <a class="dropdown-item hidden-item" href="#">
                                            <i class="fa fa-pencil-square-o icon"></i>Ẩn đơn
                                            hàng</a>
                                        <a class="dropdown-item delete-item" href="#" data-toggle="modal"
                                           data-target="#confirm-modal">
                                            <i class="fa fa-close icon"></i>Xoá đơn hàng</a>
                                    </div>
                                </div>
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
                        <li class="omni-tab-container">
                            <a class="omni-tab false"><span class="text-black">Đơn hàng mới</span></a>
                        </li>
                        <li class="omni-tab-container">
                            <a class="omni-tab false"><span class="text-black">Chưa giao hàng</span></a>
                        </li>
                        <li class="omni-tab-container">
                            <a class="omni-tab false"><span class="text-black">Chưa thanh toán</span></a>
                        </li>
                    </ul>
                    <div class="p-4">
                        <div class="row no-gutters">
                            <div class="col">
                                <div class="">
                                    <div class="row no-gutters">
                                        <div class="col-auto pr-3">
                                            <div class="filter-options__childrent__dropdown__menu">
                                                <svg class="svg-next-icon svg-next-icon-size-14" width="14"
                                                     height="14">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 459 459">
                                                        <g>
                                                            <path
                                                                    d="M178.5,382.5h102v-51h-102V382.5z M0,76.5v51h459v-51H0z M76.5,255h306v-51h-306V255z">
                                                            </path>
                                                        </g>
                                                    </svg>
                                                </svg>
                                                <span class="ml-3 d-none d-sm-inline-block">Thêm
                                                        điều kiện lọc</span>
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
                                                <input autocomplete="on" type="text"
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
                                    <table class="ui-table">
                                        <thead>
                                        <tr>
                                            <th class="table-header--check">
                                                <div class="hrv-next-input-checkbox z-index-20">
                                                    <label
                                                            class="hrv-next-label--switch hrv-next-label--empty"></label>
                                                </div>
                                            </th>
                                            <th class="has-bulk-actions table-header--check">
                                                <div class="hrv-next-input-checkbox z-index-20">
                                                    <label class="hrv-next-label--switch hrv-next-label--empty"
                                                           for="check-all"></label><input id="check-all"
                                                                                          type="checkbox"
                                                                                          class="hrv-next-checkbox"/><span
                                                        class="hrv-next-checkbox--styled"><span
                                                        class="hrv-svg-next-icon hrv-checkmark"><svg
                                                        class="hrv-svg-inline-block" width="10px"
                                                        height="10px" viewBox="0 0 26 26">
                                                                        <path
                                                                                d="m.3,14c-0.2-0.2-0.3-0.5-0.3-0.7s0.1-0.5 0.3-0.7l1.4-1.4c0.4-0.4 1-0.4 1.4,0l.1,.1 5.5,5.9c0.2,0.2 0.5,0.2 0.7,0l13.4-13.9h0.1v-8.88178e-16c0.4-0.4 1-0.4 1.4,0l1.4,1.4c0.4,0.4 0.4,1 0,1.4l0,0-16,16.6c-0.2,0.2-0.4,0.3-0.7,0.3-0.3,0-0.5-0.1-0.7-0.3l-7.8-8.4-.2-.3z">
                                                                        </path>
                                                                    </svg></span></span>
                                                </div>
                                            </th>
                                            <th class="table-header--id"><span>Mã</span></th>
                                            <th class="table-header--datetime">
                                                <span>Ngày tạo</span>
                                            </th>
                                            <th class="table-header--name">
                                                <span>Khách hàng</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span id="cspot-orders-trangthaithanhtoan">Thanh toán</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span id="cspot-orders-trangthaigiaohang">Giao hàng</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span>Thanh toán</span>
                                            </th>
                                            <th class="table-header--money">
                                                <span>Tổng tiền</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span>Kênh</span>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="">
                                            <td class="cursor-pointer">
                                                <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
                                                     width="20" height="20">
                                                </svg>
                                            </td>
                                            <td class="checkbox-select">
                                                <div class="hrv-next-input-checkbox">
                                                    <label class="hrv-next-label--switch hrv-next-label--empty"
                                                           for="1357340153"></label><input id="1357340153"
                                                                                           type="checkbox"
                                                                                           class="hrv-next-checkbox"/><span
                                                        class="hrv-next-checkbox--styled"><span
                                                        class="hrv-svg-next-icon hrv-checkmark"></span></span>
                                                </div>
                                            </td>
                                            <td class="no-wrap pl-0">
                                                <a class="" href="order-details.jsp">#110417</a>
                                                <div class="d-inline-block">
                                                            <span class="ml-1"><svg
                                                                    class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                                                                    width="14" height="14">
                                                                    <svg
                                                                            viewBox="0 0 20 20">
                                                                        <path
                                                                                d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                                                                        </path>
                                                                    </svg></svg></span>
                                                </div>
                                            </td>
                                            <td class=" ">Hôm nay 07:51 SA</td>
                                            <td class="max-width-200px">
                                                <div class="trigger">
                                                            <span>
                                                                <div class="order_list_customer">
                                                                    <p class="mb-0 px-2 align-items-center word-break">
                                                                        <span class="omni-shorten-text"
                                                                              title="nguyenhien">nguyenhien</span>
                                                                    </p>
                                                                </div>
                                                            </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="status-component">
                                                            <span
                                                                    class="circle-status mr-2 circle-status-2"></span><span
                                                        class="badges--order-payment-status-2">
                                                                Đã thanh toán</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="status-component">
                                                                <span
                                                                        class="circle-status mr-2 circle-status-shipment_done"></span><span
                                                            class="badges--carrier-status-4">
                                                                    Đã giao hàng</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <td class="text-right">1,014,500 ₫</td>
                                            <td class=" ">Web</td>
                                        </tr>
                                        <tr>
                                            <td colspan="10" class="py-0"></td>
                                        </tr>
                                        <tr class="">
                                            <td class="cursor-pointer">
                                                <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
                                                     width="20" height="20">
                                                </svg>
                                            </td>
                                            <td class="checkbox-select">
                                                <div class="hrv-next-input-checkbox">
                                                    <label class="hrv-next-label--switch hrv-next-label--empty"
                                                           for="1357340153"></label><input id="1357340153"
                                                                                           type="checkbox"
                                                                                           class="hrv-next-checkbox"/><span
                                                        class="hrv-next-checkbox--styled"><span
                                                        class="hrv-svg-next-icon hrv-checkmark"></span></span>
                                                </div>
                                            </td>
                                            <td class="no-wrap pl-0">
                                                <a class="" href="order-details.jsp">#110417</a>
                                                <div class="d-inline-block">
                                                            <span class="ml-1"><svg
                                                                    class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                                                                    width="14" height="14">
                                                                    <svg
                                                                            viewBox="0 0 20 20">
                                                                        <path
                                                                                d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                                                                        </path>
                                                                    </svg></svg></span>
                                                </div>
                                            </td>
                                            <td class=" ">Hôm nay 07:51 SA</td>
                                            <td class="max-width-200px">
                                                <div class="trigger">
                                                            <span>
                                                                <div class="order_list_customer">
                                                                    <p class="mb-0 px-2 align-items-center word-break">
                                                                        <span class="omni-shorten-text"
                                                                              title="nguyenhien">nguyenhien</span>
                                                                    </p>
                                                                </div>
                                                            </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="status-component">
                                                            <span
                                                                    class="circle-status mr-2 circle-status-1"></span><span
                                                        class="badges--order-payment-status-5">
                                                                Chờ xử lý</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="status-component">
                                                                <span
                                                                        class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                                                            class="badges--carrier-status-7">
                                                                    Chưa giao hàng</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <td class="text-right">1,014,500 ₫</td>
                                            <td class=" ">Web</td>
                                        </tr>
                                        <tr>
                                            <td colspan="10" class="py-0"></td>
                                        </tr>
                                        <tr class="">
                                            <td class="cursor-pointer">
                                                <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
                                                     width="20" height="20">
                                                </svg>
                                            </td>
                                            <td class="checkbox-select">
                                                <div class="hrv-next-input-checkbox">
                                                    <label class="hrv-next-label--switch hrv-next-label--empty"
                                                           for="1357340153"></label><input id="1357340153"
                                                                                           type="checkbox"
                                                                                           class="hrv-next-checkbox"/><span
                                                        class="hrv-next-checkbox--styled"><span
                                                        class="hrv-svg-next-icon hrv-checkmark"></span></span>
                                                </div>
                                            </td>
                                            <td class="no-wrap pl-0">
                                                <a class="" href="order-details.jsp">#110417</a>
                                                <div class="d-inline-block">
                                                            <span class="ml-1"><svg
                                                                    class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                                                                    width="14" height="14">
                                                                    <svg
                                                                            viewBox="0 0 20 20">
                                                                        <path
                                                                                d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                                                                        </path>
                                                                    </svg></svg></span>
                                                </div>
                                            </td>
                                            <td class=" ">Hôm nay 07:51 SA</td>
                                            <td class="max-width-200px">
                                                <div class="trigger">
                                                            <span>
                                                                <div class="order_list_customer">
                                                                    <p class="mb-0 px-2 align-items-center word-break">
                                                                        <span class="omni-shorten-text"
                                                                              title="nguyenhien">nguyenhien</span>
                                                                    </p>
                                                                </div>
                                                            </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="status-component">
                                                            <span
                                                                    class="circle-status mr-2 circle-status-1"></span><span
                                                        class="badges--order-payment-status-5">
                                                                Chờ xử lý</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="status-component">
                                                                <span
                                                                        class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                                                            class="badges--carrier-status-7">
                                                                    Chưa giao hàng</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <td class="text-right">1,014,500 ₫</td>
                                            <td class=" ">Web</td>
                                        </tr>
                                        <tr>
                                            <td colspan="10" class="py-0"></td>
                                        </tr>
                                        <tr class="">
                                            <td class="cursor-pointer">
                                                <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
                                                     width="20" height="20">
                                                </svg>
                                            </td>
                                            <td class="checkbox-select">
                                                <div class="hrv-next-input-checkbox">
                                                    <label class="hrv-next-label--switch hrv-next-label--empty"
                                                           for="1357340153"></label><input id="1357340153"
                                                                                           type="checkbox"
                                                                                           class="hrv-next-checkbox"/><span
                                                        class="hrv-next-checkbox--styled"><span
                                                        class="hrv-svg-next-icon hrv-checkmark"></span></span>
                                                </div>
                                            </td>
                                            <td class="no-wrap pl-0">
                                                <a class="" href="order-details.jsp">#110417</a>
                                                <div class="d-inline-block">
                                                            <span class="ml-1"><svg
                                                                    class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                                                                    width="14" height="14">
                                                                    <svg
                                                                            viewBox="0 0 20 20">
                                                                        <path
                                                                                d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                                                                        </path>
                                                                    </svg></svg></span>
                                                </div>
                                            </td>
                                            <td class=" ">Hôm nay 07:51 SA</td>
                                            <td class="max-width-200px">
                                                <div class="trigger">
                                                            <span>
                                                                <div class="order_list_customer">
                                                                    <p class="mb-0 px-2 align-items-center word-break">
                                                                        <span class="omni-shorten-text"
                                                                              title="nguyenhien">nguyenhien</span>
                                                                    </p>
                                                                </div>
                                                            </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="status-component">
                                                            <span
                                                                    class="circle-status mr-2 circle-status-1"></span><span
                                                        class="badges--order-payment-status-5">
                                                                Chờ xử lý</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="status-component">
                                                                <span
                                                                        class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                                                            class="badges--carrier-status-7">
                                                                    Chưa giao hàng</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <td class="text-right">1,014,500 ₫</td>
                                            <td class=" ">Web</td>
                                        </tr>
                                        <tr>
                                            <td colspan="10" class="py-0"></td>
                                        </tr>
                                        <tr class="">
                                            <td class="cursor-pointer">
                                                <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
                                                     width="20" height="20">
                                                </svg>
                                            </td>
                                            <td class="checkbox-select">
                                                <div class="hrv-next-input-checkbox">
                                                    <label class="hrv-next-label--switch hrv-next-label--empty"
                                                           for="1357340153"></label><input id="1357340153"
                                                                                           type="checkbox"
                                                                                           class="hrv-next-checkbox"/><span
                                                        class="hrv-next-checkbox--styled"><span
                                                        class="hrv-svg-next-icon hrv-checkmark"></span></span>
                                                </div>
                                            </td>
                                            <td class="no-wrap pl-0">
                                                <a class="" href="order-details.jsp">#110417</a>
                                                <div class="d-inline-block">
                                                            <span class="ml-1"><svg
                                                                    class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                                                                    width="14" height="14">
                                                                    <svg
                                                                            viewBox="0 0 20 20">
                                                                        <path
                                                                                d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                                                                        </path>
                                                                    </svg></svg></span>
                                                </div>
                                            </td>
                                            <td class=" ">Hôm nay 07:51 SA</td>
                                            <td class="max-width-200px">
                                                <div class="trigger">
                                                            <span>
                                                                <div class="order_list_customer">
                                                                    <p class="mb-0 px-2 align-items-center word-break">
                                                                        <span class="omni-shorten-text"
                                                                              title="nguyenhien">nguyenhien</span>
                                                                    </p>
                                                                </div>
                                                            </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="status-component">
                                                            <span
                                                                    class="circle-status mr-2 circle-status-1"></span><span
                                                        class="badges--order-payment-status-5">
                                                                Chờ xử lý</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="status-component">
                                                                <span
                                                                        class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                                                            class="badges--carrier-status-7">
                                                                    Chưa giao hàng</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <td class="text-right">1,014,500 ₫</td>
                                            <td class=" ">Web</td>
                                        </tr>
                                        <tr>
                                            <td colspan="10" class="py-0"></td>
                                        </tr>
                                        <tr class="">
                                            <td class="cursor-pointer">
                                                <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
                                                     width="20" height="20">
                                                </svg>
                                            </td>
                                            <td class="checkbox-select">
                                                <div class="hrv-next-input-checkbox">
                                                    <label class="hrv-next-label--switch hrv-next-label--empty"
                                                           for="1357340153"></label><input id="1357340153"
                                                                                           type="checkbox"
                                                                                           class="hrv-next-checkbox"/><span
                                                        class="hrv-next-checkbox--styled"><span
                                                        class="hrv-svg-next-icon hrv-checkmark"></span></span>
                                                </div>
                                            </td>
                                            <td class="no-wrap pl-0">
                                                <a class="" href="order-details.jsp">#110417</a>
                                                <div class="d-inline-block">
                                                            <span class="ml-1"><svg
                                                                    class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                                                                    width="14" height="14">
                                                                    <svg
                                                                            viewBox="0 0 20 20">
                                                                        <path
                                                                                d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                                                                        </path>
                                                                    </svg></svg></span>
                                                </div>
                                            </td>
                                            <td class=" ">Hôm nay 07:51 SA</td>
                                            <td class="max-width-200px">
                                                <div class="trigger">
                                                            <span>
                                                                <div class="order_list_customer">
                                                                    <p class="mb-0 px-2 align-items-center word-break">
                                                                        <span class="omni-shorten-text"
                                                                              title="nguyenhien">nguyenhien</span>
                                                                    </p>
                                                                </div>
                                                            </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="status-component">
                                                            <span
                                                                    class="circle-status mr-2 circle-status-1"></span><span
                                                        class="badges--order-payment-status-5">
                                                                Chờ xử lý</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="status-component">
                                                                <span
                                                                        class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                                                            class="badges--carrier-status-7">
                                                                    Chưa giao hàng</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <td class="text-right">1,014,500 ₫</td>
                                            <td class=" ">Web</td>
                                        </tr>
                                        <tr>
                                            <td colspan="10" class="py-0"></td>
                                        </tr>
                                        <tr class="">
                                            <td class="cursor-pointer">
                                                <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
                                                     width="20" height="20">
                                                </svg>
                                            </td>
                                            <td class="checkbox-select">
                                                <div class="hrv-next-input-checkbox">
                                                    <label class="hrv-next-label--switch hrv-next-label--empty"
                                                           for="1357340153"></label><input id="1357340153"
                                                                                           type="checkbox"
                                                                                           class="hrv-next-checkbox"/><span
                                                        class="hrv-next-checkbox--styled"><span
                                                        class="hrv-svg-next-icon hrv-checkmark"></span></span>
                                                </div>
                                            </td>
                                            <td class="no-wrap pl-0">
                                                <a class="" href="order-details.jsp">#110417</a>
                                                <div class="d-inline-block">
                                                            <span class="ml-1"><svg
                                                                    class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                                                                    width="14" height="14">
                                                                    <svg
                                                                            viewBox="0 0 20 20">
                                                                        <path
                                                                                d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                                                                        </path>
                                                                    </svg></svg></span>
                                                </div>
                                            </td>
                                            <td class=" ">Hôm nay 07:51 SA</td>
                                            <td class="max-width-200px">
                                                <div class="trigger">
                                                            <span>
                                                                <div class="order_list_customer">
                                                                    <p class="mb-0 px-2 align-items-center word-break">
                                                                        <span class="omni-shorten-text"
                                                                              title="nguyenhien">nguyenhien</span>
                                                                    </p>
                                                                </div>
                                                            </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="status-component">
                                                            <span
                                                                    class="circle-status mr-2 circle-status-1"></span><span
                                                        class="badges--order-payment-status-5">
                                                                Chờ xử lý</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="status-component">
                                                                <span
                                                                        class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                                                            class="badges--carrier-status-7">
                                                                    Chưa giao hàng</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <td class="text-right">1,014,500 ₫</td>
                                            <td class=" ">Web</td>
                                        </tr>
                                        <tr>
                                            <td colspan="10" class="py-0"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <nav class="text-right" style="margin-top:10px;margin-right: 10px;">
                                    <ul class="pagination">
                                        <li class="page-item">
                                            <a class="page-link" href="javascript:prevPage()" id="btn_prev"> Trước </a>
                                        </li>
                                        <li class="page-item active">
                                            <a class="page-link" id="page" href="#"> 1 </a>
                                        </li>
                                        <a class="page-link" href="javascript:nextPage()" id="btn_next"> Kế tiếp </a>
                                        </li>
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
</body>

</html>
<%}%>