<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.cart.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.cart.CartKey" %>
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
<%
    SiteUser user = (SiteUser) request.getSession().getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<!-- content -->
<div class="cart">
    <div class="container">
        <div class="cart-wrap">
            <div class="cart-content">
                <form action="" class="form-cart">
                    <div class="cart-body-left">
                        <div class="cart-heding hidden-xs">
                            <div class="row cart-row">
                                <div class="col-11" style="text-align: center;">
                                    <div class="row">
                                        <div class="col-5">Sản phẩm</div>
                                        <div class="col-2">Đơn giá</div>
                                        <div class="col-3">Số lượng</div>
                                        <div class="col-2">Thành tiền</div>
                                    </div>
                                </div>
                                <div class="col-1"></div>
                            </div>
                        </div>
                        <div class="cart-body">
                            <% Cart cart = (Cart) request.getSession().getAttribute("cart");
                                int i = 1;
                                NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>

                            <% if (cart != null) {
                                for (CartKey p : cart.getData().keySet()) {%>
                            <div class="row cart-body-row cart-body-row-1" style="align-items: center;">
                                <div class="col-md-11 col-10" style="text-align: center;">
                                    <div class="row card-info" style="align-items: center;">
                                        <div class="col-md-2 col-12 card-info-img">
                                            <a href=""><img class="cart-img"
                                                            src="<%=cart.getData().get(p).getMain_img_link()%>"
                                                            alt=""></a>
                                        </div>
                                        <div class="col-md-3 col-12"
                                             style="display: flex; align-items: center; padding: 0 2px 0 2px">
                                            <a href="" class="cart-name"><h5><%=cart.getData().get(p).getProd_name()%>
                                            </h5></a>
                                            <div class="foo" style="background: <%=p.getColor()%>"></div>
                                            <p class="size_choosed" style="font-size: 12px;"><%=p.getSize()%>
                                            </p>
                                        </div>
                                        <%if (cart.getData().get(p).getSales() != null) {%>
                                        <div class="col-md-2 col-12" style="font-size: 16px;">
                                            <span><%=format.format(cart.getData().get(p).getPrice() * 0.01 * (100 - cart.getData().get(p).getSales().getDiscount_rate()))%>₫ - (-<%=cart.getData().get(p).getSales().getDiscount_rate()%>%)</span>
                                        </div>
                                        <%} else {%>
                                        <div class="col-md-2 col-12" style="font-size: 16px;">
                                            <span><%=format.format(cart.getData().get(p).getPrice())%>₫</span>
                                        </div>
                                        <%}%>
                                        <div class="col-md-3 col-12">
                                            <div class="cart-quantity">
                                                <input type="button" value="-" class="control" onclick="tru(<%=i%>)">
                                                <input type="text" value="<%=cart.getData().get(p).getQuantity_cart()%>"
                                                       class="text-input"
                                                       id="text_so_luong-(<%=i%>)"
                                                       onkeypress='validate(event)'>
                                                <input type="button" value="+" class="control" onclick="cong(<%=i%>)">
                                            </div>
                                        </div>
                                        <%if (cart.getData().get(p).getSales() != null) {%>
                                        <div class="col-md-2 col-12 hidden-xs" style="font-size: 16px;">
                                            <span><%=format.format(cart.getData().get(p).getQuantity_cart() * (cart.getData().get(p).getPrice() * 0.01 * (100 - cart.getData().get(p).getSales().getDiscount_rate())))%>₫</span>
                                        </div>
                                        <%} else {%>
                                        <div class="col-md-2 col-12 hidden-xs" style="font-size: 16px;">
                                            <span><%=format.format(cart.getData().get(p).getQuantity_cart() * cart.getData().get(p).getPrice())%>₫</span>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="col-md-1 col-2 text-right">
                                    <a href="#" id="delete<%=cart.getData().get(p).getId()%>"><i
                                            class="fas fa-trash"></i></a>
                                </div>
                            </div>
                            <%
                                        i++;
                                    }
                                }
                            %>
                        </div>
                        <div class="cart-footer">
                            <div class="row cart-footer-row">
                                <div class="col-1"></div>
                                <div class="col-11 continue">
                                    <a href="Product.jsp">
                                        <i class="fas fa-chevron-left"></i>
                                        Tiếp tục mua sắm
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cart-body-right">
                        <div class="cart-total">
                            <label>Thành tiền:</label>
                            <span class="total__price"><%=cart != null ? format.format(cart.total()) : 0%>₫</span>
                        </div>
                        <div class="cart-buttons">
                            <a style="display: block; text-align: center;" href="pay.jsp" class="chekout">THANH TOÁN</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end content -->
<!-- end content -->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/main.js"></script>
</body>
</html>