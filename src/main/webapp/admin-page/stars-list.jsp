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
    <style>
        .item-col-title {
            max-width: 220px;
        }

        .items-list-page .item-list .item-col.item-col-sales {
            text-align: left;
            max-width: 120px;
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

        .items-list-page .item-list .item-col.item-col-sales {
            text-align: left;
            max-width: 120px;
        }

        .item-col-title {
            max-width: 152px !important;
        }

        .my-mfp-zoom-in.mfp-ready .zoom-anim-dialog {
            opacity: 1;
            transform: scale(1);
            z-index: 999;
        }

        .modal--view {
            padding: 20px 0 0 0;
            max-width: 710px;
        }

        .comments__autor {
            display: block;
            position: relative;
            padding-left: 75px;
            margin-bottom: 15px;
        }

        .comments__avatar {
            position: absolute;
            top: 0;
            left: 20px;
            width: 40px;
            border-radius: 6px;
        }

        img {
            vertical-align: middle;
            border-style: none;
        }

        .comments__name {
            display: block;
            font-size: 16px;
            color: black;
            line-height: 20px;
            font-weight: 400;
        }

        .comments__time {
            display: block;
            font-size: 12px;
            color: black;
            line-height: 20px;
            font-weight: 400;
        }

        .comments__text {
            display: block;
            margin: 0 20px;
            color: black;
            font-size: 18px;
            font-weight: 500;
            line-height: 26px;
            padding: 20px 0;
            position: relative;
            border-top: 1px solid #3d3d3d;
            border-bottom: 1px solid #3d3d3d;
        }

        .comments__actions {
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            align-items: center;
            padding: 15px 20px;
            position: relative;
        }

        .comments__rate {
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            align-items: center;
            position: relative;
        }

        .comments__rate span {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            color: black;
            font-size: 14px;
            margin-right: 25px;
            position: relative;
            height: 30px;
        }

        .comments__rate span:first-child i {
            margin-right: 6px;
        }

        .comments__rate span i {
            font-size: 18px;
            opacity: 0.6;
            transition: 0.4s ease;
            padding-right: 5px;
        }

        .home-product-item__star--gold {
            color: yellow;
        }
    </style>
</head>

<body>
<div class="main-wrapper">
    <div class="app" id="app">
        <jsp:include page="Layout/_LayoutAdminHeader.jsp"></jsp:include>
        <jsp:include page="Layout/_LayoutAdminSideBar.jsp"></jsp:include>
        <article class="content items-list-page">
            <div class="title-search-block">
                <div class="title-block">
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="title"> Danh sách đánh giá sản phẩm
                                <div class="action dropdown">
                                    <button class="btn  btn-sm rounded-s btn-secondary dropdown-toggle"
                                            type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"> Hành động
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <a class="dropdown-item hidden-item" href="#">
                                            <i class="fa fa-pencil-square-o icon"></i>Ẩn đánh giá</a>
                                        <a class="dropdown-item delete-item" href="#" data-toggle="modal"
                                           data-target="#confirm-modal">
                                            <i class="fa fa-close icon"></i>Xoá đánh giá</a>
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
                                    <span>Mã sản phẩm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-title">
                                <div>
                                    <span>Người đánh giá</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales">
                                <div>
                                    <span>Mã đánh giá</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-stats">
                                <div class="no-overflow">
                                    <span>Tên sản phẩm</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-category">
                                <div class="no-overflow">
                                    <span>Số sao</span>
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
                            <div class="item-col item-col-header fixed item-col-actions-dropdown"></div>
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
        <div class="modal fade" id="confirm-detailsModal">
            <div class="modal-dialog" role="document" style="max-width: 760px;">
                <div class="modal-content" style="width: 760px;">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <i class="fa fa-info-circle"></i> Chi tiết đánh giá
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="zoom-anim-dialog modal--view" id="modal-view">
                            <div class="comments__autor">
                                <img class="comments__avatar" src="./assets/faces/3.jpg" alt="">
                                <span class="comments__name">User3</span>
                                <span class="comments__time">30.08.2018, 17:53</span>
                            </div>
                            <p class="comments__text">Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                Necessitatibus molestias </p>
                            <div class="comments__actions">
                                <div class="comments__rate" style="text-align: center">
                                        <span style="font-size: 18px">
                                            <i class="home-product-item__star--gold fa fa-star"></i>
                                            <i class="home-product-item__star--gold fa fa-star"></i>
                                            <i class="home-product-item__star--gold fa fa-star"></i>
                                            <i class="home-product-item__star--gold fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            4/5</span>
                                </div>
                            </div>
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

    function getRandomDate() {
        const maxDate = Date.now();
        const timestamp = Math.floor(Math.random() * maxDate);
        var d = new Date(timestamp);
        return d.getDate() + "-" + (d.getMonth() + 1) + "-" + d.getFullYear();
    }

    var object = $.parseJSON(`[
            {
                "id": "SP1",
                "name": "abc",
                "idDG": "DG2",
                "prodname": "Áo len sọc lớn màu",
                "star": "4"
            },
            {
                "id": "SP2",
                "name": "abc22",
                "idDG": "DG1",
                "prodname": "Áo len sọc phối màu",
                "star": "4"
            },
            {
                "id": "SP3",
                "name": "test",
                "idDG": "DG7",
                "prodname": "Áo len traffic",
                "star": "4"
            },
            {
                "id": "SP4",
                "name": "usertest",
                "idDG": "DG5",
                "prodname": "Áo len phối màu",
                "star": "4"
            },
            {
                "id": "SP3",
                "name": "ádasd",
                "idDG": "DG79",
                "prodname": "Áo polo nam - Simple day",
                "star": "4"
            },
            {
                "id": "SP3",
                "name": "pro123",
                "idDG": "DG11",
                "prodname": "Áo polo M1ATP01204BSFSO",
                "star": "4"
            },
            {
                "id": "SP2",
                "name": "upopppp",
                "idDG": "DG23",
                "prodname": "Áo sơmi nam - Open",
                "star": "4"
            },
            {
                "id": "SP8",
                "name": "clever",
                "idDG": "DG66",
                "prodname": "Áo sơmi unisex - Nasa shirt",
                "star": "4"
            }]`);

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

        for (var i = (page - 1) * records_per_page; i < (page * records_per_page) && i < object.length; i++) {
            list.innerHTML += `<li class="item">
                    <div class="item-row">
                        <div class="item-col fixed item-col-check">
                            <label class="item-check" id="select-all-items">
                                <input type="checkbox" class="checkbox">
                                <span></span>
                            </label>
                        </div>
                        <div class="item-col fixed item-col-img md" style="justify-content: center;">
                            <span>#${object[i].id}</span>
                        </div>
                        <div class="item-col fixed pull-left item-col-title">
                            <div class="item-heading">Người bình luận</div>
                            <div>
                                <a>
                                    <h4 class="item-title">${object[i].name}</h4>
                                </a>
                            </div>
                        </div>
                        <div class="item-col item-col-sales">
                            <div class="item-heading">Mã bình luận</div>
                            <div class="sales" style="text-align: center">#${object[i].idDG}</div>
                        </div>
                        <div class="item-col item-col-stats no-overflow">
                            <div class="item-heading">Trả lời bình luận của</div>
                            <div class="no-overflow" style="font-size: 16px"> ${object[i].prodname}
                            </div>
                        </div>
                        <div class="item-col item-col-category no-overflow">
                            <div class="item-heading">Lượt thích</div>
                            <div class="no-overflow">
                                <a>${object[i].star}</a>
                            </div>
                        </div>
                        <div class="item-col item-col-author">
                            <div class="item-heading">Trạng Thái</div>
                            <div class="no-overflow" style="text-align: center">
                                <a>active</a>
                            </div>
                        </div>
                        <div class="item-col item-col-date">
                            <div class="item-heading">Ngày thêm</div>
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
                                            <a class="edit" href="#" data-toggle="modal" data-target="#confirm-detailsModal">
                                                <i class="fa fa-info-circle"></i>
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
        return Math.ceil(object.length / records_per_page);
    }

    window.onload = function () {
        changePage(1);
    };
</script>
</body>

</html>