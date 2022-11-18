<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> Trang Quản Lý </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <!-- Place favicon.ico in the root directory -->
    <link rel="stylesheet" href="css/vendor.css">
    <!-- Theme initialization -->
    <script>
        var themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
            {};
        var themeName = themeSettings.themeName || '';
        if (themeName) {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app-' + themeName + '.css">');
        }
        else {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app.css">');
        }
    </script>
    <style>
        .item-col-title {
            max-width: 220px;
        }

        .items-list-page .item-list .item-col.item-col-sales {
            text-align: left;
            max-width:120px;
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
                            <input type="search" placeholder="Tìm...">
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
                                                    <span class="accent">User1</span> Sửa thông tin sản phẩm:
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
                                <div class="img"
                                    style="background-image: url('https://avatars3.githubusercontent.com/u/3959008?v=3&s=40')">
                                </div>
                                <span class="name"> Admin </span>
                            </a>
                            <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                                <a class="dropdown-item" href="#">
                                    <i class="fa fa-user icon"></i> Tài khoản </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fa fa-bell icon"></i> Thông báo </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fa fa-gear icon"></i> Cài đặt </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="login.jsp">
                                    <i class="fa fa-power-off icon"></i> Đăng xuất </a>
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
                                                <a href="./users-list.html"> Danh sách người dùng </a>
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
                                <h3 class="title"> Danh sách người dùng
                                    <a href="item-editor.jsp" class="btn btn-primary btn-sm rounded-s"> Thêm người
                                        dùng</a>
                                    <div class="action dropdown">
                                        <button class="btn  btn-sm rounded-s btn-secondary dropdown-toggle"
                                            type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"> Hành động </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                            <a class="dropdown-item hidden-item" href="#">
                                                <i class="fa fa-pencil-square-o icon"></i>Ẩn Người dùng</a>
                                            <a class="dropdown-item delete-item" href="#" data-toggle="modal"
                                                data-target="#confirm-modal">
                                                <i class="fa fa-close icon"></i>Xoá người dùng</a>
                                        </div>
                                    </div>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="items-search">
                        <form class="form-inline">
                            <div class="input-group">
                                <input type="text" class="form-control boxed rounded-s" placeholder="Tìm kiếm...">
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
                                <div class="item-col item-col-header fixed item-col-actions-dropdown"> </div>
                            </div>
                        </li>
                        <div id="appendItem">
                        </div>
                    </ul>
                </div>
                <nav class="text-right">
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
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Có</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
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
        var current_page = 1;
        var records_per_page = 6;

        var objJson = $.parseJSON(`[
            {
                "name": "Hồ Phước Hậu",
                "id": "user1",
                "email": "hau3899@gmail.com",
                "address": "Quận 2, Tp.HCM"
            },
            {
                "name": "Nguyễn Văn Hà",
                "id": "user2",
                "email": "havan20919@gmail.com",
                "address": "Thủ Đức, Tp.HCM"
            },
            {
                "name": "Hồ Huỳnh Huyền Trang",
                "id": "user3",
                "email": "trangho2112@gmail.com",
                "address": "Quận 9, Tp.HCM"
            },
            {
                "name": "Nguyễn Huy Hoàng",
                "id": "user4",
                "email": "hoanghuy1512@gmail.com",
                "address": "Q12, Tp.HCM"
            },
            {
                "name": "Nguyễn Chí Phú",
                "id": "user5",
                "email": "phuracingboi@gmail.com",
                "address": "Q1, Tp.HCM"
            },
            {
                "name": "Hoàng Thị Thùy Linh",
                "id": "user6",
                "email": "linhthuy1909@gmail.com",
                "address": "Dĩ An, Bình Dương"
            },
            {
                "name": "Đặng Quang Liêm",
                "id": "user7",
                "email": "meisliem22@gmail.com",
                "address": "Biên Hòa, Đồng Nai"
            },
            {
                "name": "Nguyễn Sơn Tùng",
                "id": "user8",
                "email": "mtpentertainment@gmail.com",
                "address": "Quận 4, Tp.HCM"
            },
            {
                "name": "Trần Trọng Nhân",
                "id": "user9",
                "email": "nhantran9821@gmail.com",
                "address": "Long Thành, Đồng Nai"
            },
            {
                "name": "Lê Thị Huyền Vy",
                "id": "user10",
                "email": "vynguyenuel@gmail.com",
                "address": "Quận 8, Tp.HCM"
            }
        ]`);

        function prevPage() {
            if (current_page > 1) {
                current_page--;
                changePage(current_page);
            }
        }

        function nextPage() {
            if (current_page < numPages()) {
                current_page++;
                changePage(current_page);
            }
        }
        function init() {
            var $itemActions = $(".item-actions-dropdown");

            $(document).on('click', function (e) {
                if (!$(e.target).closest('.item-actions-dropdown').length) {
                    $itemActions.removeClass('active');
                }
            });

            $('.item-actions-toggle-btn').on('click', function (e) {
                e.preventDefault();
                var $thisActionList = $(this).closest('.item-actions-dropdown');
                $itemActions.not($thisActionList).removeClass('active');
                $thisActionList.toggleClass('active');
            });
        }
        function changePage(page) {
            var btn_next = document.getElementById("btn_next");
            var btn_prev = document.getElementById("btn_prev");
            var list = document.getElementById("appendItem");
            var page_span = document.getElementById("page");
            if (page < 1) page = 1;
            if (page > numPages()) page = numPages();

            list.innerHTML = "";

            for (var i = (page - 1) * records_per_page; i < (page * records_per_page) && i < objJson.length; i++) {
                list.innerHTML += `<li class="item">
                        <div class="item-row">
                            <div class="item-col fixed item-col-check">
                                <label class="item-check" id="select-all-items">
                                    <input type="checkbox" class="checkbox">
                                    <span></span>
                                </label>
                            </div>
                            <div class="item-col fixed item-col-img md">
                                <a href="item-editor.jsp">
                                    <div class="item-img rounded" style="background-image: url(https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg)"></div>
                                </a>
                            </div>
                            <div class="item-col fixed pull-left item-col-title">
                                <div class="item-heading">Tên người dùng</div>
                                <div>
                                    <a href="item-editor.jsp" class="">
                                        <h4 class="item-title"> ${objJson[i].name} </h4>
                                    </a>
                                </div>
                            </div>
                            <div class="item-col item-col-sales">
                                <div class="item-heading">Mã nguời dùng</div>
                                <div> ${objJson[i].id} </div>
                            </div>
                            <div class="item-col item-col-stats no-overflow">
                                <div class="item-heading">Email</div>
                                <div class="no-overflow">
                                    ${objJson[i].email}
                                </div>
                            </div>
                            <div class="item-col item-col-category no-overflow">
                                <div class="item-heading">Địa chỉ</div>
                                <div class="no-overflow">
                                    <a href="">${objJson[i].address}</a>
                                </div>
                            </div>
                            <div class="item-col item-col-author">
                                <div class="item-heading">Trạng thái</div>
                                <div class="no-overflow">
                                    <a href="">${Math.floor(Math.random() * 2) == 1 ? "active" : "hidden"}</a>
                                </div>
                            </div>
                            <div class="item-col item-col-date">
                                <div class="item-heading">Published</div>
                                <div class="no-overflow"> ${getRandomDate()} </div>
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
                                            <li>
                                                <a class="remove" href="#" data-toggle="modal" data-target="#confirm-modal">
                                                    <i class="fa fa-trash-o "></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="edit" href="user-editor.jsp">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>`
                init()
            }
            page_span.innerHTML = page;

            if (page == 1) {
                btn_prev.style.visibility = "hidden";
            } else {
                btn_prev.style.visibility = "visible";
            }

            if (page == numPages()) {
                btn_next.style.visibility = "hidden";
            } else {
                btn_next.style.visibility = "visible";
            }
        }

        function numPages() {
            return Math.ceil(objJson.length / records_per_page);
        }

        window.onload = function () {
            changePage(1);
        };

        function getRandomDate() {
            const maxDate = Date.now();
            const timestamp = Math.floor(Math.random() * maxDate);
            var d = new Date(timestamp);
            return d.getDate() + "-" + (d.getMonth() + 1) + "-" + d.getFullYear();
        }
    </script>
</body>

</html>