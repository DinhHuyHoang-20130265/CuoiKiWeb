<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.AccountService" %>
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
    <link rel="stylesheet" href="./css/vendor.css">
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
                                        <%List<Product> product = ProductService.getInstance().getListProduct();%>
                                        <div class="stat">
                                            <div class="value"><%=product != null ? product.size() : 0%>
                                            </div>
                                            <div class="name"> Sản phẩm hoạt động</div>
                                        </div>
                                        <div class="progress stat-progress">
                                            <div class="progress-bar" style="width: 75%;"></div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-6 stat-col">
                                        <div class="stat-icon">
                                            <i class="fa fa-shopping-cart"></i>
                                        </div>
                                        <%
                                            int count = 0;
                                            if (product != null)
                                                for (Product p : product) {
                                                    count += p.getView_count();
                                                }
                                        %>
                                        <div class="stat">
                                            <div class="value"><%=count%></div>
                                            <div class="name"> Lượt xem sản phẩm</div>
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
                                            <div class="value"> $80.560</div>
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
                                        <%List<SiteUser> users = AccountService.getInstance().getAllUserServer();%>
                                        <div class="stat">
                                            <div class="value"><%=users != null ? users.size() : 0%>
                                            </div>
                                            <div class="name"> Tài khoản người dùng</div>
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
                                            <div class="value"> 20</div>
                                            <div class="name"> Bài báo tin tức</div>
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
                                            <div class="value"> $780.064</div>
                                            <div class="name"> Tổng doanh thu</div>
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
                                    <h3 class="title">Số sản phẩm bán đuược</h3>
                                </div>
                            </div>
                            <div class="card-block">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active fade show" id="visits">
                                        <p class="title-description"> Tổng số sản phẩm bán được 6 tháng gần nhất </p>
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
                                    <h3 class="title"> Sản phẩm nổi bật </h3>
                                    <a href="item-editor.jsp" class="btn btn-primary btn-sm"> Thêm sản phẩm</a>
                                </div>
                                <div class="header-block pull-right">
                                    <div class="pagination">
                                        <div class="loadmore" id="loadMore">
                                            <a style="cursor: pointer;" class="btn btn-primary btn-sm loadmore-btn">
                                                <i class="fa fa-angle-down"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                List<Product> list = ProductService.getInstance().loadProductWithConditionContainsStatus(1, 6, "7", "all", null, null, null, null);
                            %>
                            <ul class="item-list striped" id="items" style="overflow-x: scroll;">
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
                                                <span>Lượt xem</span>
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
                                <%for (Product p : list) {%>
                                <li class="item">
                                    <div class="item-row">
                                        <div class="item-col fixed item-col-img xs">
                                            <a href="">
                                                <div class="item-img xs rounded">
                                                    <img src="<%=p.getMain_img_link()%>" width=30px height=30px alt=""></img>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="item-col item-col-title no-overflow">
                                            <div>
                                                <h4 class="item-title no-wrap"><%=p.getProd_name()%>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="item-col item-col-sales">
                                            <div class="item-heading"></div>
                                            <div><%=p.getView_count()%>
                                            </div>
                                        </div>
                                        <div class="item-col item-col-stats">
                                            <div class="item-heading">Tồn kho</div>
                                            <div class="no-overflow">
                                                <div class="item-stats" data-type="bar"><%=p.getQuantity()%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item-col item-col-date">
                                            <div class="item-heading">Ngày thêm</div>
                                            <div><%=p.getReleased_date()%>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <%}%>
                                <input type="text" id="pageValue" value="2" style="display: none">
                            </ul>
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

<jsp:include page="chart/chart_index.jsp"></jsp:include>
<script>
    $("#loadMore").click(function (e) {
        e.preventDefault();
        const page = $("#pageValue").val();
        console.log(page);
        $.ajax({
            url: "/CuoiKiWeb_war/LoadMoreIndexAdminController",
            type: "post",
            data: {
                page: page,
            },
            success: function (data) {
                $("#items").append(data);
                const page = $("#pageValue").val();
                $("#pageValue").val((parseInt(page) + 1) + "");
            }
        })
    })
</script>
</body>

</html>
<%}%>