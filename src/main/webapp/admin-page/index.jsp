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
    <link rel="stylesheet" href="./css/vendor.css">
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
            <article class="content dashboard-page">
                <section class="section">
                    <div class="row sameheight-container">
                        <div class="col col-12 col-sm-12 col-md-6 col-xl-5 stats-col">
                            <div class="card sameheight-item stats" data-exclude="xs">
                                <div class="card-block">
                                    <div class="title-block">
                                        <h4 class="title"> Số liệu thống kê </h4>
                                    </div>
                                    <div class="row row-sm stats-container">
                                        <div class="col-12 col-sm-6 stat-col">
                                            <div class="stat-icon">
                                                <i class="fa fa-rocket"></i>
                                            </div>
                                            <div class="stat">
                                                <div class="value"> 5407 </div>
                                                <div class="name"> Sản phẩm hoạt động </div>
                                            </div>
                                            <div class="progress stat-progress">
                                                <div class="progress-bar" style="width: 75%;"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 stat-col">
                                            <div class="stat-icon">
                                                <i class="fa fa-shopping-cart"></i>
                                            </div>
                                            <div class="stat">
                                                <div class="value"> 78464 </div>
                                                <div class="name"> Sản phẩm đã bán</div>
                                            </div>
                                            <div class="progress stat-progress">
                                                <div class="progress-bar" style="width: 25%;"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6  stat-col">
                                            <div class="stat-icon">
                                                <i class="fa fa-line-chart"></i>
                                            </div>
                                            <div class="stat">
                                                <div class="value"> $80.560 </div>
                                                <div class="name"> Doanh thu tháng này</div>
                                            </div>
                                            <div class="progress stat-progress">
                                                <div class="progress-bar" style="width: 60%;"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6  stat-col">
                                            <div class="stat-icon">
                                                <i class="fa fa-users"></i>
                                            </div>
                                            <div class="stat">
                                                <div class="value"> 359 </div>
                                                <div class="name"> Tài khoản người dùng </div>
                                            </div>
                                            <div class="progress stat-progress">
                                                <div class="progress-bar" style="width: 34%;"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6  stat-col">
                                            <div class="stat-icon">
                                                <i class="fa fa-list-alt"></i>
                                            </div>
                                            <div class="stat">
                                                <div class="value"> 20 </div>
                                                <div class="name"> Bài báo tin tức </div>
                                            </div>
                                            <div class="progress stat-progress">
                                                <div class="progress-bar" style="width: 49%;"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 stat-col">
                                            <div class="stat-icon">
                                                <i class="fa fa-dollar"></i>
                                            </div>
                                            <div class="stat">
                                                <div class="value"> $780.064 </div>
                                                <div class="name"> Tổng doanh thu </div>
                                            </div>
                                            <div class="progress stat-progress">
                                                <div class="progress-bar" style="width: 15%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col col-12 col-sm-12 col-md-6 col-xl-7 history-col">
                            <div class="card sameheight-item" data-exclude="xs" id="dashboard-history">
                                <div class="card-header card-header-sm bordered">
                                    <div class="header-block">
                                        <h3 class="title">Lịch sử ghé thăm</h3>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active fade show" id="visits">
                                            <p class="title-description"> Trung bình số người dùng ghé thăm trang web trong vòng 30 ngày </p>
                                            <div id="dashboard-visits-chart"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="section">
                    <div class="row sameheight-container">
                        <div class="col-xl-8">
                            <div class="card sameheight-item items" data-exclude="xs,sm,lg">
                                <div class="card-header bordered">
                                    <div class="header-block">
                                        <h3 class="title"> Sản phẩm bán chạy </h3>
                                        <a href="item-editor.jsp" class="btn btn-primary btn-sm"> Thêm sản phẩm</a>
                                    </div>
                                    <div class="header-block pull-right">
                                        <label class="search">
                                            <input class="search-input" placeholder="Tìm...">
                                            <i class="fa fa-search search-icon"></i>
                                        </label>
                                        <div class="pagination">
                                            <div class="loadmore" id="loadMore">
                                                <a style="cursor: pointer;" class="btn btn-primary btn-sm loadmore-btn">
                                                    <i class="fa fa-angle-down"></i></a>
                                            </div>
                                            <div class="loadmore" id="loadLess">
                                                <a style="cursor: pointer;" class="btn btn-primary btn-sm loadmore-btn">
                                                    <i class="fa fa-angle-up"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <ul class="item-list striped" id="items">
                                    <li class="item item-list-header">
                                        <div class="item-row">
                                            <div class="item-col item-col-header fixed item-col-img xs"></div>
                                            <div class="item-col item-col-header item-col-title">
                                                <div>
                                                    <span>Tên</span>
                                                </div>
                                            </div>
                                            <div class="item-col item-col-header item-col-sales">
                                                <div>
                                                    <span>Đã bán</span>
                                                </div>
                                            </div>
                                            <div class="item-col item-col-header">
                                                <div>
                                                    <span>Tồn kho</span>
                                                </div>
                                            </div>
                                            <div class="item-col item-col-header item-col-date">
                                                <div>
                                                    <span>Ngày thêm</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="card sameheight-item sales-breakdown" data-exclude="xs,sm,lg">
                                <div class="card-header">
                                    <div class="header-block">
                                        <h3 class="title">Phương thức thanh toán</h3>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="dashboard-sales-breakdown-chart" id="dashboard-sales-breakdown-chart">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </article>
            <!-- /.modal -->
            <div class="modal fade" id="confirm-modal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                                <i class="fa fa-warning"></i> Alert
                            </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure want to do this?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Yes</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
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
        function getRandomDate() {
            const maxDate = Date.now();
            const timestamp = Math.floor(Math.random() * maxDate);
            var d = new Date(timestamp);
            return d.getDate()  + "-" + (d.getMonth()+1) + "-" + d.getFullYear();
        }
        $(document).ready(function() {
            var object = $.parseJSON(`[
            {
                "id": "1",
                "name": "Áo len sọc lớn màu",
                "price": "420000",
                "categories": "đồ nam, áo thun nam, áo thun tay dài nam",
                "imglink": "men/1.jpg",
                "colors": "black, green, orange",
                "subimglink": "men/1-a.jpg, men/1-b.jpg, men/1-c.jpg",
                "size": "M, L, XL"
            },
            {
                "id": "2",
                "name": "Áo len sọc phối màu",
                "price": "420000",
                "categories": "đồ nam, áo thun nam, áo thun tay dài nam",
                "imglink": "men/2.jpg",
                "colors": "brown, orange",
                "subimglink": "men/2-a.jpg, men/2-b.jpg",
                "size": "M, L, XL"
            },
            {
                "id": "3",
                "name": "Áo len traffic",
                "price": "420000",
                "categories": "đồ nam, áo thun nam, áo thun tay dài nam",
                "imglink": "men/3.jpg",
                "colors": "brown, green, brown cream",
                "subimglink": "men/3-a.jpg, men/3-b.jpg, men/3-c.jpg",
                "size": "M, L, XL"
            },
            {
                "id": "4",
                "name": "Áo len nhiều màu",
                "price": "420000",
                "categories": "đồ nam, áo thun nam, áo thun tay dài nam",
                "imglink": "men/4.jpg",
                "colors": "black, grey, blue, brown, white",
                "subimglink": "men/4-a.jpg, men/4-b.jpg, men/4-c.jpg, men/4-d.jpg, men/4-e.jpg  ",
                "size": "M, L, XL"
            },
            {
                "id": "5",
                "name": "Áo len phối màu",
                "price": "420000",
                "categories": "đồ nam, áo thun nam, áo thun tay dài nam",
                "imglink": "men/5.jpg",
                "colors": "black, brown",
                "subimglink": "men/5-a.jpg, men/5-b.jpg",
                "size": "M, L, XL"
            },
            {
                "id": "6",
                "name": "Áo sweate nam",
                "price": "450000",
                "categories": "đồ nam, áo thun nam, áo thun tay dài nam",
                "imglink": "men/6.jpg",
                "colors": "cream, black ,blue, yellow",
                "subimglink": "men/6-a.jpg, men/6-b.jpg, men/6-c.jpg, men/6-d.jpg ",
                "size": "M, L, XL"
            },
            {
                "id": "7",
                "name": "Áo polo nam - Up to you",
                "price": "365000",
                "categories": "đồ nam, áo thun nam, áo thun polo nam",
                "imglink": "men/7.jpg",
                "colors": "black, blue, green",
                "subimglink": "men/7-a.jpg, men/7-b.jpg, men/7-c.jpg",
                "size": "M, L, XL"
            },
            {
                "id": "8",
                "name": "Áo polo nam - Simple day",
                "price": "345000",
                "categories": "đồ nam, áo thun nam, áo thun polo nam",
                "imglink": "men/8.jpg",
                "colors": "black, blue, pink, yellow",
                "subimglink": "men/8-a.jpg, men/8-b.jpg, men/8-c.jpg, men/8-d.jpg ",
                "size": "M, L, XL"
            },
            {
                "id": "9",
                "name": "Áo polo M1ATP01205BSFSO",
                "price": "295000",
                "categories": "đồ nam, áo thun nam, áo thun polo nam",
                "imglink": "men/9.jpg",
                "colors": "black, blue, yellow, red",
                "subimglink": "men/9-a.jpg, men/9-b.jpg, men/9-c.jpg, men/9-d.jpg ",
                "size": "L, XL, 2XL"
            },
            {
                "id": "10",
                "name": "Áo polo M1ATP01204BSFSO",
                "price": "295000",
                "categories": "đồ nam, áo thun nam, áo thun polo nam",
                "imglink": "men/10.jpg",
                "colors": "black, grey, green",
                "subimglink": "men/10-a.jpg, men/10-b.jpg, men/10-c.jpg",
                "size": "L, XL"
            }]`);
            function initRender() {
                var listProducts = object.map(function(element) {
                        return `<li class="item blogBox moreBox" style="display:none">
                        <div class="item-row">
                            <div class="item-col fixed item-col-img xs">
                                <a href="">
                                    <div class="item-img xs rounded">
                                        <img src="../assets/imgProduct/images/${element.imglink}" width=30px height=30px></img>
                                    </div>
                                </a>
                            </div>
                            <div class="item-col item-col-title no-overflow">
                                <div>
                                    <h4 class="item-title no-wrap"> ${element.name} </h4>
                                </div>
                            </div>
                            <div class="item-col item-col-sales">
                                <div class="item-heading">Đã bán</div>
                                <div> ${Math.floor(Math.random() * 10000)} </div>
                            </div>
                            <div class="item-col item-col-stats">
                                <div class="item-heading">Tồn kho</div>
                                <div class="no-overflow">
                                    <div class="item-stats" data-type="bar"> ${Math.floor(Math.random() * 100)}</div>
                                </div>
                            </div>
                            <div class="item-col item-col-date">
                                <div class="item-heading">Ngày thêm</div>
                                <div> ${getRandomDate()} </div>
                            </div>
                        </div>
                    </li>`
                })
                var renderList = listProducts.join('');
                $('#items').html(renderList);
            }
            initRender();
            function defaultLoadmore() {
                $(".moreBox").slice(0, 6).show();
                $("#loadMore").click(function (e) {
                  e.preventDefault();
                  $(".moreBox:hidden").slice(0, 6).show();
                  $(".col-xl-8").css({"overflow":"auto"})
                });
            }
            defaultLoadmore();
            $("#loadLess").click(function() {
                initRender();
                defaultLoadmore();
            });
        });
    </script>
</body>

</html>