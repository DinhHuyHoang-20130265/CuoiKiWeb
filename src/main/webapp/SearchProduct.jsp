<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/12/2022
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>P&T Shop</title>
    <!-- link icon -->
    <link rel="stylesheet" href="./assets/uicons-regular-rounded/css/uicons-regular-rounded.css">
    <link rel="stylesheet" href="./assets/uicons-regular-straight/css/uicons-regular-straight.css">
    <link rel="stylesheet" href="./assets/fontawesome-free-5.15.3-web/css/all.min.css">
    <!-- link css -->
    <link rel="stylesheet" href="./assets/css/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/bootstrap.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/product.css">
    <link rel="stylesheet" href="./assets/css/productdetail.css">
    <link rel="stylesheet" href="./assets/css/reponsive1.css">
    <link rel="stylesheet" href="./assets/css/menu-contact.css">
    <link rel="icon" href="./assets/img/logo/main.png" type="image/x-icon"/>
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
            .sortby {
                float: left;
            }

            .sortby label {
                display: none;
            }

            .sort-left {
                margin-bottom: 20px;
            }

            .sortby2 {
                display: block;
            }

            .sortby {
                float: left;
            }
        }

        /* tablet */
        @media (min-width: 740px) and (max-width: 1023px) {
            .card:hover .hover-icon {
                display: none;
            }
        }

        /* mobile */
        @media (max-width: 739px) {
            .card:hover .hover-icon {
                display: none;
            }
        }
    </style>
</head>

<body>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<!-- product -->
<div class="product">
    <div class="container">
        <div class="row" style="justify-content: center;">
            <div class="col-lg-9 col-12">
                <%List<Product> products = (List<Product>) request.getAttribute("searchProduct");%>
                <%NumberFormat formatter = NumberFormat.getNumberInstance(new Locale("vn", "VN"));%>
                <div class="row row-product" id="products">
                    <!-- loadProduct o day -->
                    <% for (Product p : products) {%>
                    <div class="col-lg-4 col-md-6 col-12 mb-20"
                         style="margin-bottom: 20px;">
                        <a href="./ProductDetail.jsp?id=<%=p.getId()%>" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="<%=p.getMain_img_link()%>" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        <%=p.getProd_name()%>
                                    </h5>
                                    <div class="product__price">
                                        <%if (p.getSales() != null) {%>
                                        <p class="card-text price-color product__price-old"><%=p.getPrice()%>đ</p>
                                        <p class="card-text price-color product__price-new"><%=formatter.format(p.getPrice() * (1 - (p.getSales().getDiscount_rate()) * 0.01))%>
                                            đ</p>
                                        <%} else {%>
                                        <p class="card-text price-color product__price-old" style="opacity: 0">0</p>
                                        <p class="card-text price-color product__price-new"><%=formatter.format(p.getPrice())%>đ</p>
                                        <%}%>
                                    </div>
                                    <div class="home-product-item__action">
                            <span class="home-product-item__like home-product-item__like--liked">
                                <i class="home-product-item__like-icon-empty far fa-heart"></i>
                                <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                            </span>
                                        <div class="home-product-item__rating">
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <span class="home-product-item__sold"><%= p.getView_count()%> Lượt xem</span>
                                    </div>
                                    <%if (p.getSales() != null) {%>
                                    <div class="sale-off">
                                        <span class="sale-off-percent"><%=p.getSales().getDiscount_rate()%>%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </a>
                    </div>
                    <%}%>
                </div>
                <div class="loadmore" id="loadMore">
                    <a style="cursor: pointer;" class="loadmore-btn">Tải thêm</a>
                </div>
                <input id="page" name="page" value="2" style="display: none">
                <input id="search" name="search" value="<%=request.getParameter("search")%>"
                       style="display: none">
            </div>
        </div>
    </div>
</div>
<div class="overlay2 hidden"></div>
<!-- end product -->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.bundle.min.js"></script>
<script src="./assets/js/main.js"></script>
<script src="./assets/js/product.js"></script>
<script>
    function loadproduct() {
        const page = $("#page").val();
        const category = "all";
        const search = $("#search").val();
        $.ajax({
            type: 'post',
            url: "LoadMoreProductSearchController",
            data: {
                page: page,
                search: search
            },
            success: function (data) {
                $("#products").append(data);
                const page = $("#page").val();
                $("#page").val((parseInt(page) + 1) + "");
            }
        });
    }

    $("#loadMore").on('click', function () {
        loadproduct();
    });
</script>
</body>

</html>
