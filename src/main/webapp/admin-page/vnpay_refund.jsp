<%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 6/11/2023
  Time: 1:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
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
    </style>
</head>

<body>
<%

    //----------------------Kiểm tra thử đăng nhập hay chưa--------------------//
    if (request.getSession().getAttribute("userAdmin") == null) {
        // Sendredirect tới login
        response.sendRedirect("login.jsp");

    } else {
        boolean isAdmin = false;
        AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
        boolean check = false;
        for (AdminRole role : admin.getRole()) {
            if (role.getTable().equals("refund")) {
                check = true;
            } else if (role.getTable().equals("admin")) {
                check = true;
                isAdmin = true;
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
                            <h3 class="title"> Hoàn tiền đơn hàng có giao dịch thanh toán online</h3>
                        </div>
                    </div>
                </div>
                <div class="items-search">
                    <form class="form-inline">
                        <div class="input-group">
                            <input type="text" id="order_id" class="form-control boxed rounded-s"
                                   placeholder="Điền mã hóa đơn giao dịch">
                            <span class="input-group-btn">
                                    <button id="query" class="btn btn-secondary rounded-s" type="button">
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
                            <div class="item-col item-col-header item-col-title">
                                <div>
                                    <span>Id hóa đơn</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales">
                                <div>
                                    <span>Số tiền giao dịch</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales">
                                <div>
                                    <span>Phí giao dịch</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-stats">
                                <div class="no-overflow">
                                    <span>Nội dung giao dịch</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-category">
                                <div class="no-overflow">
                                    <span>Ngân hàng</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author">
                                <div class="no-overflow">
                                    <span>Ngày giao dịch</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author">
                                <div class="no-overflow">
                                    <span>Mã số thẻ</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author">
                                <div class="no-overflow">
                                    <span>Tên chủ thẻ</span>
                                </div>
                            </div>
                            <div class="item-col item-col-header item-col-author">
                                <div class="no-overflow">
                                    <span>Mã giao dịch số</span>
                                </div>
                            </div>
                        </div>
                    </li>
                    <div id="appendItem">
                        <li class="item">
                            <div class="item-row">
                                <div class="item-col fixed pull-left item-col-title">
                                    <div>
                                        <a style="text-decoration: none">
                                            <h4 class="item-title" id="vnp_TxnRef">
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-sales">
                                    <div>
                                        <a style="text-decoration: none">
                                            <h4 class="item-title" id="vnp_Amount">
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-sales">
                                    <div>
                                        <a style="text-decoration: none" id="vnp_FeeAmount">
                                            <h4 class="item-title">
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-stats no-overflow">
                                    <div class="no-overflow">
                                        <a style="text-decoration: none">
                                            <h4 class="item-title" id="vnp_OrderInfo">
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-category no-overflow">
                                    <div class="no-overflow">
                                        <a style="text-decoration: none">
                                            <h4 class="item-title" id="vnp_BankCode">
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-author">
                                    <div class="no-overflow">
                                        <a style="text-decoration: none">
                                            <h4 class="item-title" id="vnp_PayDate">
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-author">
                                    <div class="no-overflow">
                                        <a style="text-decoration: none">
                                            <h4 class="item-title" id="vnp_CardNumber">
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-author">
                                    <div class="no-overflow">
                                        <a style="text-decoration: none">
                                            <h4 class="item-title" id="vnp_CardHolder">
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item-col item-col-author">
                                    <div class="no-overflow">
                                        <a style="text-decoration: none">
                                            <h4 class="item-title" id="vnp_TransactionNo">
                                            </h4>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </div>
                </ul>
            </div>
        </article>
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
    $("#query").on("click", function (e) {
        e.preventDefault();
        const order_id = $("#order_id").val();
        $.ajax({
            url: "../query_transaction",
            type: "post",
            data: {
                order_id: order_id
            },
            success: function (resp) {
                console.log(resp)
                if (resp.vnp_Message === "Transaction_not_found")
                    alert(resp.vnp_Message);
                else {
                    let fee = new Intl.NumberFormat('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }).format(parseFloat(resp.vnp_Amount) / 100)
                    let Amountfee = new Intl.NumberFormat('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }).format(parseFloat(resp.vnp_FeeAmount) / 100)
                    $("#vnp_TxnRef").text(resp.vnp_TxnRef);
                    $("#vnp_Amount").text(fee);
                    $("#vnp_FeeAmount").text(Amountfee);
                    $("#vnp_OrderInfo").text(resp.vnp_OrderInfo);
                    $("#vnp_BankCode").text(resp.vnp_BankCode);
                    $("#vnp_PayDate").text(resp.vnp_PayDate);
                    $("#vnp_CardNumber").text(resp.vnp_CardNumber);
                    $("#vnp_CardHolder").text(resp.vnp_CardHolder);
                    $("#vnp_TransactionNo").text(resp.vnp_TransactionNo);
                }
            }
        })
    })
</script>
</body>

</html>
<%
        }
    }
%>
