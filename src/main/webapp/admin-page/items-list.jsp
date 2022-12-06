<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
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
                                    <button class="btn  btn-sm rounded-s btn-secondary dropdown-toggle"
                                            type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"> Hành động
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <a class="dropdown-item hidden-item" href="#">
                                            <i class="fa fa-pencil-square-o icon"></i>Ẩn sản phẩm</a>
                                        <a class="dropdown-item delete-item" href="#" data-toggle="modal"
                                           data-target="#confirm-modal">
                                            <i class="fa fa-close icon"></i>Xoá sản phẩm</a>
                                    </div>
                                </div>
                                <div class="action dropdown">
                                    <button class="btn  btn-sm rounded-s btn-secondary dropdown-toggle"
                                            type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"> Thêm điều kiện lọc
                                    </button>
                                    <div class="p-4 dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <div class="mb-2">Hiển thị tất cả sản phẩm theo:</div>
                                        <div class="trigger omni-selection"><span>
                                                    <div class=" selection-content ">
                                                        <p class="selection-value">
                                                            <span class="omni-text omni-text-line-1"
                                                                  title="Tình trạng hiển thị">Tình trạng hiển thị</span>
                                                        </p>
                                                        <p class="selection-icon">
                                                            <span class="omni-svg-create svg-next-icon svg-color-gray-solid svg-next-icon-size-12">
                                                                <svg width="12" height="12">
                                                                </svg>
                                                            </span>
                                                        </p>
                                                    </div>
                                                </span>
                                        </div>
                                        <div class="mt-3">Là</div>
                                        <div class="trigger omni-selection mt-2 select-menu-outer_min_width"><span>
                                                    <div class=" selection-content ">
                                                        <p class="selection-value"><span
                                                                class="omni-text  omni-text-line-1"
                                                                title="Hiển thị">Hiển thị</span></p>
                                                        <p class="selection-icon"><span
                                                                class="omni-svg-create svg-next-icon svg-color-gray-solid svg-next-icon-size-12"><svg
                                                                width="12" height="12"></svg></span></p>
                                                    </div>
                                                </span></div>
                                        <div class="group-filter-button d-flex">
                                            <div class="group-filter-button__delete mr-3">
                                                <button
                                                        class="btn btn-default mt-3 btn-hover-oapcity"><span>Hủy</span>
                                                </button>
                                            </div>
                                            <div
                                                    class="group-filter-button__add flex-grow-1 d-flex justify-content-end">
                                                <button class="btn btn-primary mt-3"><span>Thêm điều kiện
                                                            lọc</span></button>
                                            </div>
                                        </div>
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
    var current_page = 1;
    var records_per_page = 6;

    var objJson = $.parseJSON(`[
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
            list.innerHTML += ` <li class="item">
                    <div class="item-row">
                        <div class="item-col fixed item-col-check">
                            <label class="item-check" id="select-all-items">
                                <input type="checkbox" class="checkbox">
                                <span></span>
                            </label>
                        </div>
                        <div class="item-col fixed item-col-img md">
                            <a href="">
                                <img src="../assets/imgProduct/images/${objJson[i].imglink}" width=40px height=40px></img>
                            </a>
                        </div>
                        <div class="item-col fixed pull-left item-col-title">
                            <div class="item-heading">Tên sản phẩm</div>
                            <div>
                                <a>
                                    <h4 class="item-title">${objJson[i].name}</h4>
                                </a>
                            </div>
                        </div>
                        <div class="item-col item-col-sales">
                            <div class="item-heading">Mã sản phẩm</div>
                            <div class="sales" style="text-align: center"> ${objJson[i].id} </div>
                        </div>
                        <div class="item-col item-col-stats no-overflow">
                            <div class="item-heading">Đã bán</div>
                            <div class="no-overflow"> ${Math.floor(Math.random() * 10000)}
                            </div>
                        </div>
                        <div class="item-col item-col-category no-overflow">
                            <div class="item-heading">Loại sản Phẩm</div>
                            <div class="no-overflow">
                                <a>${objJson[i].categories.substring(0, objJson[i].categories.indexOf(','))}</a>
                            </div>
                        </div>
                        <div class="item-col item-col-author">
                            <div class="item-heading">Trạng Thái</div>
                            <div class="no-overflow" style="text-align: center">
                                <a>${Math.floor(Math.random() * 2) == 1 ? "active" : "hidden"}</a>
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
                                            <a class="edit" href="item-editor.jsp">
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
<%}%>