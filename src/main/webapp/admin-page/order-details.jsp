<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Trang Quản Lý</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="apple-touch-icon" href="apple-touch-icon.png" />
    <!-- Place favicon.ico in the root directory -->
    <link rel="stylesheet" href="css/vendor.css" />
    <link rel="stylesheet" href="css/orders-list.css" />
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
    <div class="main-wrapper">
        <div class="app" id="app">
            <header class="header">
                <div class="header-block header-block-collapse d-lg-none d-xl-none">
                    <button class="collapse-btn" id="sidebar-collapse-btn">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <div class="header-block header-block-search">
                    <form role="search">
                        <div class="input-container">
                            <i class="fa fa-search"></i>
                            <input type="search" placeholder="Tìm..." />
                            <div class="underline"></div>
                        </div>
                    </form>
                </div>
                <div class="header-block header-block-nav">
                    <ul class="nav-profile">
                        <li class="notifications new">
                            <a href="" data-toggle="dropdown">
                                <i class="fa fa-bell-o"></i>
                                <sup>
                                    <span class="counter">8</span>
                                </sup>
                            </a>
                            <div class="dropdown-menu notifications-dropdown-menu">
                                <ul class="notifications-container">
                                    <li>
                                        <a href="" class="notification-item">
                                            <div class="img-col">
                                                <div class="img" style="background-image: url('assets/faces/3.jpg')">
                                                </div>
                                            </div>
                                            <div class="body-col">
                                                <p>
                                                    <span class="accent">User2</span> Thêm sản phẩm:
                                                    <span class="accent">Áo vippro123 được làm từ tinh bột</span>.
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="notification-item">
                                            <div class="img-col">
                                                <div class="img" style="background-image: url('assets/faces/5.jpg')">
                                                </div>
                                            </div>
                                            <div class="body-col">
                                                <p>
                                                    <span class="accent">User1</span> Sửa thông tin sản
                                                    phẩm:
                                                    <span class="accent">Áo vippro123 được làm từ tinh bột</span>.
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="notification-item">
                                            <div class="img-col">
                                                <div class="img" style="background-image: url('assets/faces/8.jpg')">
                                                </div>
                                            </div>
                                            <div class="body-col">
                                                <p>
                                                    <span class="accent">User3</span> Xoá sản phẩm:
                                                    <span class="accent">Áo vippro123 được làm từ tinh bột</span>.
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                                <footer>
                                    <ul>
                                        <li>
                                            <a href=""> Xem tất cả </a>
                                        </li>
                                    </ul>
                                </footer>
                            </div>
                        </li>
                        <li class="profile dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <div class="img" style="
                      background-image: url('https://avatars3.githubusercontent.com/u/3959008?v=3&s=40');
                    "></div>
                                <span class="name"> Admin </span>
                            </a>
                            <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                                <a class="dropdown-item" href="#">
                                    <i class="fa fa-user icon"></i> Tài khoản
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fa fa-bell icon"></i> Thông báo
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fa fa-gear icon"></i> Cài đặt
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="login.jsp">
                                    <i class="fa fa-power-off icon"></i> Đăng xuất
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </header>
            <aside class="sidebar">
                <div class="sidebar-container">
                    <div class="sidebar-header">
                        <div class="brand">
                            <div class="logo">
                                <span class="l l1"></span>
                                <span class="l l2"></span>
                                <span class="l l3"></span>
                                <span class="l l4"></span>
                                <span class="l l5"></span>
                            </div> Quản Lý
                        </div>
                    </div>
                    <nav class="menu">
                        <ul class="sidebar-menu metismenu" id="sidebar-menu">
                            <li class="active">
                                <a href="index.jsp">
                                    <i class="fa fa-home"></i> Tổng quan </a>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa fa-th-large"></i> Quản Lý Đối Tượng
                                    <i class="fa arrow"></i>
                                </a>
                                <ul class="sidebar-nav">
                                    <li>
                                        <a href="#"> Sản phẩm<i class="fa arrow"></i></a>
                                        <ul class="sidebar-nav">
                                            <li>
                                                <a href="items-list.jsp"> Danh sách sản phẩm </a>
                                            </li>
                                            <li>
                                                <a href="item-editor.jsp"> Chỉnh sửa sản phẩm </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#"> Bài báo <i class="fa arrow"></i></a>
                                        <ul class="sidebar-nav">
                                            <li>
                                                <a href="posts-list.jsp"> Danh sách bài báo </a>
                                            </li>
                                            <li>
                                                <a href="post-editor.jsp"> Chỉnh sửa bài báo</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#"> Đơn hàng <i class="fa arrow"></i></a>
                                        <ul class="sidebar-nav">
                                            <li>
                                                <a href="orders-list.jsp"> Danh sách đơn hàng </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">  Người dùng <i class="fa arrow"></i></a>
                                        <ul class="sidebar-nav">
                                            <li>
                                                <a href="users-list.jsp"> Danh sách người dùng </a>
                                            </li>
                                            <li>
                                                <a href="user-editor.jsp"> Chỉnh sửa thông tin người dùng</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">  Bình luận/Đánh giá <i class="fa arrow"></i></a>
                                        <ul class="sidebar-nav">
                                            <li>
                                                <a href="comments-list.jsp"> Danh sách Bình luận tin tức </a>
                                            </li>
                                            <li>
                                                <a href="stars-list.jsp"> Danh sách đánh giá sản phẩm</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa fa-area-chart"></i> Thống kê
                                    <i class="fa arrow"></i>
                                </a>
                                <ul class="sidebar-nav">
                                    <li>
                                        <a href="charts-morris.jsp"> Biểu đồ </a>
                                    </li>
                                    <li>
                                        <a href="static-tables.jsp"> Bảng </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <footer class="sidebar-footer">
                    <ul class="sidebar-menu metismenu" id="customize-menu">
                        <li>
                            <ul>
                                <li class="customize">
                                    <div class="customize-item">
                                        <div class="row customize-header">
                                            <div class="col-4"> </div>
                                            <div class="col-4">
                                                <label class="title">Cố dịnh</label>
                                            </div>
                                            <div class="col-4">
                                                <label class="title">Linh hoạt</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <label class="title">Thanh công cụ:</label>
                                            </div>
                                            <div class="col-4">
                                                <label>
                                                    <input class="radio" type="radio" name="sidebarPosition"
                                                        value="sidebar-fixed">
                                                    <span></span>
                                                </label>
                                            </div>
                                            <div class="col-4">
                                                <label>
                                                    <input class="radio" type="radio" name="sidebarPosition" value="">
                                                    <span></span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <label class="title">Tiêu đề:</label>
                                            </div>
                                            <div class="col-4">
                                                <label>
                                                    <input class="radio" type="radio" name="headerPosition"
                                                        value="header-fixed">
                                                    <span></span>
                                                </label>
                                            </div>
                                            <div class="col-4">
                                                <label>
                                                    <input class="radio" type="radio" name="headerPosition" value="">
                                                    <span></span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="customize-item">
                                        <ul class="customize-colors">
                                            <li>
                                                <span class="color-item color-red" data-theme="red"></span>
                                            </li>
                                            <li>
                                                <span class="color-item color-orange" data-theme="orange"></span>
                                            </li>
                                            <li>
                                                <span class="color-item color-green active" data-theme=""></span>
                                            </li>
                                            <li>
                                                <span class="color-item color-seagreen" data-theme="seagreen"></span>
                                            </li>
                                            <li>
                                                <span class="color-item color-blue" data-theme="blue"></span>
                                            </li>
                                            <li>
                                                <span class="color-item color-purple" data-theme="purple"></span>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                            <a href="">
                                <i class="fa fa-cog"></i> Sửa đổi giao diện </a>
                        </li>
                    </ul>
                </footer>
            </aside>
            <div class="sidebar-overlay" id="sidebar-overlay"></div>
            <div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
            <div class="mobile-menu-handle"></div>
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
                <div>
                    <div class="order-detail-header ui-title-bar-container max-width-center">
                        <div class="row align-items-start">
                            <div class="col-lg col-sm-12">
                                <div class="order-detail--list-status">
                                    <div class="ui-toolbar-product-info">
                                        <div class="ui-product-body pl-0">Mã</div>
                                        <div class="ui-product-head">
                                            <div class="table-break-word"><strong
                                                    class="order-detail--list-status-code">#110417</strong></div>
                                        </div>
                                    </div>
                                    <div class="ui-toolbar-product-info">
                                        <div class="ui-product-body">Trạng thái giao hàng</div>
                                        <div class="ui-product-head">
                                            <div class="table-break-word"><span class="order-detail--list-status-name">
                                                    <div class="status-component"><span
                                                            class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                                                            class="badges--carrier-status-7"> Chưa giao hàng</span>
                                                    </div>
                                                </span></div>
                                        </div>
                                    </div>
                                    <div class="ui-toolbar-product-info">
                                        <div class="ui-product-body">Trạng thái thanh toán</div>
                                        <div class="ui-product-head">
                                            <div class="table-break-word"><span class="order-detail--list-status-name">
                                                    <div class="status-component"><span
                                                            class="circle-status mr-2 circle-status-5"></span><span
                                                            class="badges--order-payment-status-5"> Chờ xử lý</span>
                                                    </div>
                                                </span></div>
                                        </div>
                                    </div>
                                </div>
                                <div><span>Hôm nay 07:51 SA</span>, Kênh bán hàng&nbsp;<strong>web</strong></div>
                            </div>
                        </div>
                    </div>
                    <div class="padding-container">
                        <div class="row">
                            <div class="col-lg-9 col-12">
                                <div class="omni-layout-card card-default">
                                    <div class="omni-layout-card--header line-bottom">
                                        <div class="status-component"><span
                                                class="circle-status mr-2 circle-status-fulfill_not"></span><span
                                                class="badges--fulfill-status-2"> Chưa giao hàng</span></div>
                                    </div>
                                    <div>
                                        <div class="ui-table-normal-container">
                                            <table class="ui-table ui-table-vertical-top">
                                                <thead>
                                                    <tr>
                                                        <th class="table-header--product"></th>
                                                        <th class="text-center table-header--money">Số lượng</th>
                                                        <th class="text-right table-header--money">Giá</th>
                                                        <th class="text-right table-header--money">Thành tiền</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <div class="display-none"></div>
                                                    <tr>
                                                        <td class="  align-middle text-normal fix-overflow-tooltip">
                                                            <div class="order-block--table">
                                                                <div class="order-block--table-image">
                                                                    <div class="table-cell--image"><img
                                                                            class="box-image"
                                                                            src="../assets/imgProduct/images/men/1.jpg">
                                                                    </div>
                                                                </div>
                                                                <div class="order-block--table-content"><a
                                                                        target="_blank" href="#"><strong
                                                                            class="text-primary mb-2 d-inline-block table-break-word"><span
                                                                                class="">Áo len sọc lớn màu
                                                                            </span></strong></a>
                                                                    <div class="mb-2 text-secondary "></div><span
                                                                        class="trigger ">
                                                                        <p
                                                                            class="word-break mb-2 text-secondary omni-text omni-text-line-1">
                                                                            Còn tồn 1,374 trong kho
                                                                        </p>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="  align-middle text-center">
                                                            <div class="border-0">5</div>
                                                        </td>
                                                        <td class=" align-middle text-right">
                                                            <div class="border-0 text-right">60,000 ₫</div>
                                                        </td>
                                                        <td class="  text-right align-middle">
                                                            <div class="border-0">300,000 ₫</div>
                                                        </td>
                                                    </tr>
                                                    <div class="display-none"></div>
                                                    <tr>
                                                        <td class="  align-middle text-normal fix-overflow-tooltip">
                                                            <div class="order-block--table">
                                                                <div class="order-block--table-image">
                                                                    <div class="table-cell--image"><img
                                                                            class="box-image"
                                                                            src="../assets/imgProduct/images/men/1.jpg">
                                                                    </div>
                                                                </div>
                                                                <div class="order-block--table-content"><a
                                                                        target="_blank" href="#"><strong
                                                                            class="text-primary mb-2 d-inline-block table-break-word"><span
                                                                                class="">Áo len sọc lớn màu
                                                                            </span></strong></a>
                                                                    <div class="mb-2 text-secondary "></div><span
                                                                        class="trigger ">
                                                                        <p
                                                                            class="word-break mb-2 text-secondary omni-text omni-text-line-1">
                                                                            Còn tồn 1,374 trong kho
                                                                        </p>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="  align-middle text-center">
                                                            <div class="border-0">5</div>
                                                        </td>
                                                        <td class=" align-middle text-right">
                                                            <div class="border-0 text-right">60,000 ₫</div>
                                                        </td>
                                                        <td class="  text-right align-middle">
                                                            <div class="border-0">300,000 ₫</div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="omni-layout-card--section">
                                        <div class="text-right"><button class="btn btn-primary"><span>Giao
                                                    hàng</span></button></div>
                                    </div>
                                </div>
                                <div class="omni-layout-card card-default">
                                    <div class="omni-layout-card--header line-bottom">
                                        <div class="status-component"><span
                                                class="circle-status mr-2 circle-status-5"></span><span
                                                class="badges--order-payment-status-5"> Thanh toán chờ xử lý</span>
                                        </div>
                                    </div>
                                    <div class="omni-layout-card--section">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="mb15"><label class="title-level--sub">Ghi Chú Đơn
                                                        Hàng</label><textarea placeholder="Thêm ghi chú cho đơn hàng"
                                                        rows="1" class="hrv-ui-textarea"
                                                        style="overflow: hidden; overflow-wrap: break-word; height: 40px;">ĐÃ LÊN ĐƠN</textarea>
                                                </div>
                                                <div class="mb15 text-right"><button class="btn btn-default"><span>Cập
                                                            nhật</span></button></div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="ui-information-body pb-4">
                                                    <div class="row">
                                                        <div class="col">Số lượng sản phẩm</div>
                                                        <div class="col-auto text-right">18</div>
                                                    </div>
                                                </div>
                                                <div class="ui-information-body pb-4">
                                                    <div class="row">
                                                        <div class="col">Tổng tiền hàng</div>
                                                        <div class="col-auto text-right">1,014,500 ₫</div>
                                                    </div>
                                                </div>
                                                <div class="ui-information-body pb-4">
                                                    <div class="row">
                                                        <div class="col">
                                                            <p class="mb-0">Giảm giá</p>
                                                        </div>
                                                        <div class="col-auto text-right">0 ₫</div>
                                                    </div>
                                                </div>
                                                <div class="ui-information-body pb-4">
                                                    <div class="row">
                                                        <div class="col">
                                                            <p class="mb-0">Vận chuyển</p>
                                                            <p
                                                                class="table-break-word text-secondary mb-0 max-width-300px">
                                                                Giao hàng 6h</p>
                                                            <p class="text-secondary mb-0">5.3 kg</p>
                                                        </div>
                                                        <div class="col-auto text-right">0 ₫</div>
                                                    </div>
                                                </div>
                                                <div class="ui-information-body pb-4">
                                                    <div class="row">
                                                        <div class="col ">
                                                            <p class="mb-1 font-weight-bold">Tổng giá trị đơn hàng</p>
                                                            <p class="text-secondary mb-0">Thanh toán khi giao hàng
                                                                (COD)</p>
                                                        </div>
                                                        <div class="col-auto text-right font-weight-bold">1,014,500 ₫
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="ui-information-body pb-4">
                                                    <div class="row">
                                                        <div class="col">Đã thanh toán</div>
                                                        <div class="col-auto text-right">0 ₫</div>
                                                    </div>
                                                </div>
                                                <div class="ui-information-body pb-4">
                                                    <div class="row">
                                                        <div class="col">Đã hoàn trả</div>
                                                        <div class="col-auto text-right">0 ₫</div>
                                                    </div>
                                                </div>
                                                <div class="ui-information-body pb-4">
                                                    <div class="row">
                                                        <div class="col">Thực nhận</div>
                                                        <div class="col-auto text-right">0 ₫</div>
                                                    </div>
                                                </div>
                                                <div class="pb-0 text-right">
                                                    <div class="d-inline-block">
                                                        <div id="drop"
                                                            class="dropdown droup-popover ui-popover-arrow-right ui-popover-placement-right ">
                                                            <div><button class="btn btn-primary btn"><span
                                                                        class="mr-2">Thanh toán</span><svg
                                                                        class="svg-next-icon svg-next-icon-size-10 svg-next-icon-rotate-90"
                                                                        width="10" height="10"><svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            viewBox="0 0 451.846 451.847">
                                                                            <g>
                                                                                <path
                                                                                    d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744   L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284   c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z">
                                                                                </path>
                                                                            </g>
                                                                        </svg></svg></button></div>
                                                            <div class="ui-popover">
                                                                <div class="ui-popover__tooltip"></div>
                                                                <div class="ui-popover__content-wrapper">
                                                                    <div class="ui-popover__content"
                                                                        style="width: 161px;">
                                                                        <div class="ui-popover__pane">
                                                                            <div class="my-2">
                                                                                <p
                                                                                    class="ellipsis-item ellipsis-item-disabled">
                                                                                    Gửi email hóa đơn</p>
                                                                                <p
                                                                                    class="ellipsis-item ellipsis-item-disabled">
                                                                                    Copy link thanh toán</p>
                                                                                <p class="ellipsis-item">Xác nhận thanh
                                                                                    toán
                                                                                <div class="display-none"></div>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="omni-layout-card card-default ghosty">
                                    <p class="order-history--title">Lịch sử</p>
                                    <div class="activity-log ">
                                        <div class="timeline-emojipicker border-top-0 p-0">
                                            <div class="emoji-container">
                                                <div class="img-rounded"><svg
                                                        class="svg-next-icon svg-next-icon-size-40" width="40"
                                                        height="40"><svg xmlns="http://www.w3.org/2000/svg"
                                                            viewBox="0 0 64 64">
                                                            <g id="Layer_2" data-name="Layer 2">
                                                                <g id="Layer_1-2" data-name="Layer 1">
                                                                    <path xmlns="http://www.w3.org/2000/svg"
                                                                        fill="#3c94d1"
                                                                        d="M32,63.5A31.5,31.5,0,1,1,63.5,32,31.54,31.54,0,0,1,32,63.5Z">
                                                                    </path>
                                                                    <path xmlns="http://www.w3.org/2000/svg" fill="#fff"
                                                                        d="M32,1A31,31,0,1,1,1,32,31,31,0,0,1,32,1m0-1A32,32,0,1,0,64,32,32,32,0,0,0,32,0Z">
                                                                    </path>
                                                                    <path xmlns="http://www.w3.org/2000/svg" fill="#fff"
                                                                        d="M32,7.8A11.94,11.94,0,1,1,20.06,19.75,11.93,11.93,0,0,1,32,7.8Z">
                                                                    </path>
                                                                    <path xmlns="http://www.w3.org/2000/svg" fill="#fff"
                                                                        d="M32,59.34A28.67,28.67,0,0,1,8.11,46.52C8.23,38.59,24,34.25,32,34.25s23.77,4.34,23.89,12.26A28.67,28.67,0,0,1,32,59.34Z">
                                                                    </path>
                                                                </g>
                                                            </g>
                                                        </svg></svg></div>
                                                <div class="emoji-action">
                                                    <div class="emoji-input">
                                                        <div class="next-input--stylized"><input autocomplete="on"
                                                                type="text" class="next-input next-input--invisible"
                                                                placeholder="Thêm nội dung ghi chú" step="1" value="">
                                                            <div
                                                                class="next-input-add-on next-input__add-on--after pl-3">
                                                                <div class="hrv-emoji-picker"><svg
                                                                        class="hrv-svg-inline-block" width="24px"
                                                                        height="24px" viewBox="0 0 295.996 295.996">
                                                                        <g>
                                                                            <path
                                                                                d="M147.998,0C66.392,0,0,66.392,0,147.998s66.392,147.998,147.998,147.998s147.998-66.392,147.998-147.998   S229.605,0,147.998,0z M147.998,279.996c-36.256,0-69.143-14.696-93.022-38.44c-9.536-9.482-17.631-20.41-23.934-32.42   C21.442,190.847,16,170.047,16,147.998C16,75.214,75.214,16,147.998,16c34.523,0,65.987,13.328,89.533,35.102   c12.208,11.288,22.289,24.844,29.558,39.996c8.27,17.239,12.907,36.538,12.907,56.9   C279.996,220.782,220.782,279.996,147.998,279.996z">
                                                                            </path>
                                                                            <circle cx="99.666" cy="114.998" r="16">
                                                                            </circle>
                                                                            <circle cx="198.666" cy="114.998" r="16">
                                                                            </circle>
                                                                            <path
                                                                                d="M147.715,229.995c30.954,0,60.619-15.83,77.604-42.113l-13.439-8.684c-15.597,24.135-44.126,37.604-72.693,34.308   c-22.262-2.567-42.849-15.393-55.072-34.308l-13.438,8.684c14.79,22.889,39.716,38.409,66.676,41.519   C140.814,229.8,144.27,229.995,147.715,229.995z">
                                                                            </path>
                                                                        </g>
                                                                    </svg></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="emoji-action__button"><button disabled="" type="button"
                                                            class="hrv-btn hrv-btn-primary ml-4 "><span><svg
                                                                    class="svg-next-icon svg-next-icon-size-16"
                                                                    width="16" height="16"><svg width="16" height="16"
                                                                        viewBox="0 0 16 16"
                                                                        xmlns="http://www.w3.org/2000/svg">
                                                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                                                            d="M1 6.66667L1.00667 2L15 8L1.00667 14L1 9.33333L11 8L1 6.66667ZM2.34 4.02L7.34667 6.16667L2.33333 5.5L2.34 4.02ZM7.34 9.83333L2.33333 11.98V10.5L7.34 9.83333Z"
                                                                            fill="white"></path>
                                                                    </svg></svg></span></button></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="timeline-date-event timline-date-event--margin mt-0">
                                                <div class="timeline-date-time text-uppercase timeline-tilte">
                                                    <span>10/11/2022</span>
                                                </div>
                                                <div class="timeline-event-content ">
                                                    <div class="timeline-item">
                                                        <div class="timeline-body">
                                                            <div class="timeline__message-container">
                                                                <div class="timeline__inner-message">
                                                                    <p class="mb-2">Đã nhận đơn hàng mới
                                                                        <span>#110417</span><span> từ nguyenhien</span>
                                                                    </p>
                                                                </div>
                                                            </div><time class="timeline__time"><span>07:52
                                                                    SA</span></time>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="timeline-event-content active">
                                                    <div class="timeline-item">
                                                        <div class="timeline-body">
                                                            <div class="timeline__message-container">
                                                                <div class="timeline__inner-message">
                                                                    <p class="mb-2">Đơn hàng đã được đặt từ thanh toán
                                                                        <span>#1000018276</span>
                                                                    </p>
                                                                </div>
                                                            </div><time class="timeline__time"><span>07:52
                                                                    SA</span></time>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="timeline-event-content ">
                                                    <div class="timeline-item">
                                                        <div class="timeline-body">
                                                            <div class="timeline__message-container">
                                                                <div
                                                                    class="timeline__wrapper__inner-message table-updown-historylog timeline-inner--message--textcolor" style="cursor: pointer;">
                                                                    <div class="timeline__inner-message">
                                                                        <div
                                                                            class="text-no-bold show-timeline-dropdown hover-underline">
                                                                            <strong
                                                                                class="text-primary cursor-pointer mb-2 d-inline-block"><span
                                                                                    class="mr-3">Thanh toán
                                                                                    <span>1,014,500 ₫</span> đang chờ xử
                                                                                    lý</span><svg
                                                                                    class="svg-next-icon ml-2 svg-next-icon-size-8"
                                                                                    width="8" height="8"><svg
                                                                                        viewBox="0 0 451.846 451.847">
                                                                                        <g>
                                                                                            <path
                                                                                                d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744   L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284   c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z">
                                                                                            </path>
                                                                                        </g>
                                                                                    </svg></svg></strong>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div><time class="timeline__time"><span>07:51
                                                                    SA</span></time>
                                                        </div>
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
                                    <div class="omni-layout-card--section">
                                        <div class="mb16">Vui lòng xác thực đơn hàng</div><button
                                            class="btn btn-primary w-100"><span>Xác Thực Đơn Hàng</span>
                                            <div class="display-none"></div>
                                        </button>
                                    </div>
                                </div>
                                <div class="omni-layout-card card-default">
                                    <div class="omni-layout-card--header line-bottom"><span class="header-title">Thông
                                            Tin Người Mua</span></div>
                                    <div class="omni-layout-card--section"><a class="d-block" target="_blank"
                                            href="/admin/customers/1019145491">nguyen hien</a>
                                        <div class="mt-2 color-black table-break-word d-flex justify-content-between">
                                            <span class="mr-1">• <span class="label-hover-description cursor-pointer">Đã
                                                    đặt</span></span><b>14 Đơn hàng</b>
                                        </div>
                                        <div class="mt-2 color-black table-break-word d-flex justify-content-between">
                                            <span class="mr-1">• <span
                                                    class="label-hover-description cursor-pointer">Doanh thu tích
                                                    lũy</span></span><span class="text-nowrap font-weight-bold">0
                                                ₫</span>
                                        </div>
                                    </div>
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
                                            <p class="mb-2 table-break-word">nguyenhien</p>
                                            <p class="mb-2 color-gray-solid table-break-word"><span
                                                    class="text-nodata">Không có thông tin công ty</span></p>
                                            <p class="mb-2">0938293384</p>
                                        </div>
                                        <div class="omni-layout-card--section-section">
                                            <p class="header-title">Địa Chỉ Giao Hàng</p>
                                            <p class="mb-0 table-break-word">51ngo quang huy, Thành phố Thủ Đức, Hồ Chí
                                                Minh, Vietnam</p>
                                        </div>
                                    </div>
                                    <div class="omni-layout-card--section">
                                        <div class="omni-layout-card--section-section">
                                            <p class="header-title">Ghi chú về khách hàng</p>
                                            <p class="mb-0 table-break-word text-nodata">Không có ghi chú</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="order-delete--block">
                            <div class="row">
                                <div class="col-lg-9 col-12">
                                    <div class=""><button class="btn btn-danger mr-0"><span>Xóa đơn hàng</span>
                                            <div class="display-none"></div>
                                        </button></div>
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
    <script>
        $(".ui-popover-placement-right").click(function () {
            $(this).toggleClass('ui-popover__container--contains-active-popover');
            if ($(this).hasClass("ui-popover__container--contains-active-popover")) {
                $(".ui-popover").css({ 'visibility': 'visible' });
            } else $(".ui-popover").css({ 'visibility': 'hidden' });
        });
        $(".table-updown-historylog").click(function () {
            if ($(".table-updown-historylog").find('div.ui-table-updown').length !== 0) {
                $(".ui-table-updown").remove();
            }
            else
                $(".table-updown-historylog").append(`<div class="ui-table-updown table-responsive table-updown-historylog">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <td><a>#110417</a></td>
                        </tr>
                        <tr>
                            <th>Thông tin</th>
                            <td>Trì hoãn Thanh toán khi giao
                                hàng (COD) từ người mua</td>
                        </tr>
                        <tr>
                            <th>Giá trị</th>
                            <td><span>1,014,500 ₫</span></td>
                        </tr>
                        <tr>
                            <th>Cổng thanh toán</th>
                            <td><span>Thanh toán khi giao hàng
                                    (COD)</span></td>
                        </tr>
                        <tr>
                            <th>Tình trạng</th>
                            <td><span>Chờ xử lý</span></td>
                        </tr>
                        <tr>
                            <th>Loại</th>
                            <td><span>Chờ xử lý</span></td>
                        </tr>
                        <tr>
                            <th>Ngày tạo</th>
                            <td><span>Hôm nay 07:51 SA</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>`);
        });
    </script>
</body>

</html>