<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.wishlist.WishList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>P&T Shop</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="./assets/css/bootstrap.css">
    <!-- link icon -->
    <link rel="stylesheet" href="./assets/uicons-regular-rounded/css/uicons-regular-rounded.css">
    <link rel='stylesheet' href="./assets/uicons-regular-straight/css/uicons-regular-straight.css">
    <link rel="stylesheet" href="./assets/fontawesome-free-5.15.3-web/css/all.min.css">
    <!-- link css -->
    <link rel="stylesheet" href="./assets/css/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/cart.css">
    <link rel="stylesheet" href="./assets/css/listlike.css">
    <link rel="stylesheet" href="./assets/css/reponsive1.css">
    <link rel="stylesheet" href="./assets/css/menu-contact.css">
    <link rel="icon" href="./assets/img/logo/main.png" type="image/x-icon"/>
</head>
<style>
    form.example input[type=text] {
        padding: 10px;
        font-size: 17px;
        border: 1px solid grey;
        float: left;
        width: 80%;
        background: #f1f1f1;
    }

    form.example button {
        float: left;
        width: 20%;
        padding: 10px;
        background: #2196F3;
        color: white;
        font-size: 17px;
        border: 1px solid grey;
        border-left: none;
        cursor: pointer;
    }

    form.example button:hover {
        background: #0b7dda;
    }

    form.example::after {
        content: "";
        clear: both;
        display: table;
    }

    /* Mobile & tablet  */
    @media (max-width: 1023px) {
    }

    /* tablet */
    @media (min-width: 740px) and (max-width: 1023px) {
        .cart-wrap {
            padding-top: 8px;
            padding-bottom: 46px
        }

        .cart-body-left {
            width: 100%;
        }

        .cart-body-right {
            margin-top: 8px;
            width: 100%;
            padding: 16px;
        }
    }

    /* mobile */
    @media (max-width: 739px) {
        .cart-wrap {
            padding-top: 8px;
            padding-bottom: 46px;
        }

        .cart-body-left {
            width: 100%;
        }

        .cart-body-right {
            margin-top: 8px;
            width: 100%;
            padding: 16px;
        }

        .cart-body-row {
            flex-direction: row;
            /* margin-left: -12px;
            margin-right: -12px; */
        }

        .card-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
        }

        .card-info-img {
            grid-row: span 3;
        }

        .cart-quantity {
            margin-top: 5px;
        }
    }
</style>

<body>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<%
    SiteUser user = (SiteUser) request.getSession().getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<!-- content -->
<div class="cart">
    <div class="container">
        <div class="cart-wrap">
            <div class="cart-content">
                <div class="page_title" style="font-size: 20px;margin-left: 27px;margin-bottom: 20px;border-bottom: 3px solid black">Sản phẩm vừa xem</div>
                <form action="" class="form-cart">
                    <div class="cart-body-left">
                        <div class="cart-heding hidden-xs">
                            <div class="row cart-row">
                                <div class="col-11" style="text-align: center;">
                                    <div class="row">
                                        <div class="col-5">Sản phẩm</div>
                                        <div class="col-2">Đơn giá</div>
                                        <div class="col-2"></div>
                                    </div>
                                </div>
                                <div class="col-1"></div>
                            </div>
                        </div>
                        <div class="cart-body">
                            <% List<String> visiteds = (List<String>) request.getSession().getAttribute("listVisited");
                                NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
                            <% if (visiteds != null) {
                                for (String id : visiteds) {
                                    Product seenProduct = new ProductService().getProductAndDetails(id);
                            %>
                            <div class="row cart-body-row cart-body-row-1" style="align-items: center;">
                                <div class="col-md-11 col-10" style="text-align: center;">
                                    <div class="row card-info" style="align-items: center;">
                                        <div class="col-md-2 col-12 card-info-img">
                                            <a href=""><img class="cart-img"
                                                            src="<%=seenProduct.getMain_img_link()%>"
                                                            alt=""></a>
                                        </div>
                                        <div class="col-md-3 col-12">
                                            <a href="" class="cart-name">
                                                <h5><%=seenProduct.getProd_name()%>
                                                </h5>
                                            </a>
                                        </div>
                                        <%if (seenProduct.getSales() != null) {%>
                                        <div class="col-md-2 col-12" style="font-size: 16px;">
                                            <span><%=format.format(seenProduct.getPrice() * 0.01 * (100 - seenProduct.getSales().getDiscount_rate()))%>₫ - (-<%=seenProduct.getSales().getDiscount_rate()%>)</span>
                                        </div>
                                        <%} else {%>
                                        <div class="col-md-2 col-12" style="font-size: 16px;">
                                            <span><%=format.format(seenProduct.getPrice())%>₫</span>
                                        </div>
                                        <%}%>
                                        <%--                                        <div class="col-md-3 col-12">--%>
                                        <%--                                            <div class="cart-fiding">--%>
                                        <%--                                                <a href="#">Tìm sản phẩm tương tự</a>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                        <div class="col-md-2 col-12" style="font-size: 16px;">
                                            <a href="./ProductDetail.jsp?id=<%=seenProduct.getId()%>" class="likecartbutton"> Xem ngay </a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end content -->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/main.js"></script>
</body>
</html>