<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>P&T Shop</title>
    <!-- link icon -->
    <link rel="stylesheet" href="./assets/uicons-regular-rounded/css/uicons-regular-rounded.css"/>
    <link rel="stylesheet" href="./assets/uicons-regular-straight/css/uicons-regular-straight.css"/>
    <link rel="stylesheet" href="./assets/fontawesome-free-5.15.3-web/css/all.min.css"/>
    <!-- link css -->
    <link rel="stylesheet" href="./assets/css/normalize.min.css"/>
    <link rel="stylesheet" href="./assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="./assets/css/base.css"/>
    <link rel="stylesheet" href="./assets/css/main.css"/>
    <link rel="stylesheet" href="./assets/css/productdetail.css"/>
    <link rel="stylesheet" href="./assets/css/reponsive1.css"/>
    <link rel="stylesheet" href="./assets/css/menu-contact.css">
    <link rel="icon" href="./assets/img/logo/main.png" type="image/x-icon"/>
    <style>
        form.example input[type="text"] {
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
            background: #2196f3;
            color: white;
            font-size: 17px;
            border: 1px solid grey;
            border-left: none;
            cursor: pointer;
        }

        form.example button:hover {
            background: #0b7dda;
        }

        @media (max-width: 1199px) {
            .shoesnews .product__new-item .card .card-img-top {
                height: 174px;
            }
        }

        /* Mobile & tablet  */
        @media (max-width: 991px) {
            .shoesnews .product__new-item .card .card-img-top {
                height: 120px;
            }
        }

        @media (max-width: 767px) {
            .shoesnews .product__new-item .card .card-img-top {
                height: 250px;
            }
        }

        /* tablet */
        @media (min-width: 740px) and (max-width: 1023px) {
            .owl-item {
                width: 396px;
                padding: 16px 0;
            }

            .card:hover .hover-icon {
                display: none;
            }
        }

        /* mobile */
        @media (max-width: 739px) {
            .owl-item {
                float: unset;
                padding: 16px 0;
            }

            .card:hover .hover-icon {
                display: none;
            }
        }
    </style>
</head>

<body>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<!-- content -->
<div class="container">
    <!-- slide show -->
    <div class="row">
        <section class="awe-section-1">
            <div class="mt-4 top-sliders col-md-12">
                <div class="slideshow">
                    <div id="demo" class="carousel slide" data-ride="carousel">
                        <ul class="carousel-indicators">
                            <li data-target="#demo" data-slide-to="0" class="active"></li>
                            <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li>
                        </ul>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="./assets/img/slideshow/1.jpg" alt="Los Angeles" width="1100" height="500"/>
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="./assets/img/slideshow/2.jpg" alt="Chicago" width="1100" height="500"/>
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="./assets/img/slideshow/3.jpg" alt="New York" width="1100" height="500"/>
                                <div class="carousel-caption">
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- end slide show -->
    <div class="product">
        <div class="container">
            <div class="product_popular">
                <h3 class="product__popular title-product">Sản phẩm phổ biến</h3>
                <div class="row">
                    <div class="col-lg-6 col-sm-12 mb-20" style="justify-content: center; display: flex">
                        <div class="card" style="width: 75%">
                            <img class="card-img-top" src="./assets/imgProduct/images/men/1.jpg" alt="Card image"
                                 style="width: 100%"/>
                            <div class="card-body">
                                <h4 class="card-title">Áo len sọc lớn màu</h4>
                                <a href="ProductDetail.jsp" title="GIÀY ADIDAS 4D FUTURECRAFT" class="btn btn-buynow">Xem
                                    ngay
                                    <i class="fas fa-arrow-right" style="font-size: 16px"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 mb-20" style="justify-content: center; display: flex">
                        <div class="card" style="width: 75%">
                            <img class="card-img-top" src="./assets/imgProduct/images/men/3.jpg" alt="Card image"
                                 style="width: 100%"/>
                            <div class="card-body">
                                <h4 class="card-title">Áo len traffic</h4>
                                <a href="ProductDetail.jsp" class="btn btn-buynow">Xem ngay
                                    <i class="fas fa-arrow-right" style="font-size: 16px"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product__new">
                <h3 class="product__ne title-product">Sản phẩm mới</h3>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/1.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        Áo len sọc lớn màu
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/2.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        Áo len sọc phối màu
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/3.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        Áo len traffic
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/4.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">Áo len nhiều màu
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="product__sale">
                <h3 class="product__sale title-product">Top sản phẩm hot</h3>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/1.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        Áo len sọc lớn màu
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/2.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        Áo len sọc phối màu
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/3.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        Áo len traffic
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/4.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">Áo len nhiều màu
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <section class="awe-section-9">
                <div class="section_policy clearfix">
                    <div class="col-12">
                        <div class="owl-policy-mobile">
                            <div class="owl-stage-outer">
                                <div class="owl-stage">
                                    <div class="owl-item">
                                        <div class="section_policy_content">
                                            <a href="">
                                                <img
                                                        src="https://bizweb.dktcdn.net/100/344/983/themes/704702/assets/policy_images_1.png?1628514159582"
                                                        alt=""/>
                                                <div class="section-policy-padding">
                                                    <h3>Miễn phí vận chuyển</h3>
                                                    <div class="section_policy_title">
                                                        Cho các đơn hàng
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="owl-item">
                                        <div class="section_policy_content">
                                            <a href="">
                                                <img
                                                        src="https://bizweb.dktcdn.net/100/344/983/themes/704702/assets/policy_images_2.png?1628514159582"
                                                        alt=""/>
                                                <div class="section-policy-padding">
                                                    <h3>Hỗ trợ 24/7</h3>
                                                    <div class="section_policy_title">
                                                        Liên hệ hỗ trợ 24h/ngày
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="owl-item">
                                        <div class="section_policy_content">
                                            <a href="">
                                                <img
                                                        src="	https://bizweb.dktcdn.net/100/344/983/themes/704702/assets/policy_images_3.png?1628514159582"
                                                        alt=""/>
                                                <div class="section-policy-padding">
                                                    <h3>Hoàn tiền 100%</h3>
                                                    <div class="section_policy_title">
                                                        Nếu sản phẩm bị lỗi, hư hỏng
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="owl-item">
                                        <div class="section_policy_content">
                                            <a href="">
                                                <img
                                                        src="https://bizweb.dktcdn.net/100/344/983/themes/704702/assets/policy_images_4.png?1628514159582"
                                                        alt=""/>
                                                <div class="section-policy-padding">
                                                    <h3>Thanh toán</h3>
                                                    <div class="section_policy_title">
                                                        Được bảo mật 100%
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="product__yml">
                <h3 class="product__yml title-product">Có thể bạn sẽ thích</h3>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/1.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        Áo len sọc lớn màu
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/2.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        Áo len sọc phối màu
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/3.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        Áo len traffic
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="ProductDetail.jsp" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="./assets/imgProduct/images/men/4.jpg"
                                         alt="Card image cap"/>
                                    <form action="" class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden"/>
                                        <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                            <i class="fas fa-cart-plus"></i>
                                        </a>
                                        <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <a data-toggle="modal" data-target="#myModal" class="quickview"
                                           title="Xem nhanh">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">Áo len nhiều màu
                                    </h5>
                                    <div class="product__price">
                                        <p class="card-text price-color product__price-old">
                                            1,000,000 đ
                                        </p>
                                        <p class="card-text price-color product__price-new">
                                            420000 đ
                                        </p>
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
                                        <span class="home-product-item__sold">79 đã bán</span>
                                    </div>
                                    <div class="sale-off">
                                        <span class="sale-off-percent">20%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="shoesnews">
        <div class="container">
            <h3 class="shoesnews__title">Tin tức</h3>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 mb-20">
                    <a href="newDetail.jsp" class="product__new-item">
                        <div class="card" style="width: 100%">
                            <img class="card-img-top" src="./assets/imgNews/news/1-min.jpg" alt="Card image cap"
                                 height="230px"/>
                            <div class="card-body">
                                <h5 class="card-title custom__name-product title-news">
                                    Post hình check-in, rinh quà hấp dẫn
                                </h5>
                                <p class="card-text custom__name-product" style="font-weight: 400">
                                    Tin vui không thể bỏ lỡ cho các FRIENDs của P&T vào tháng 11 này!
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 mb-20">
                    <a href="newDetail.jsp" class="product__new-item">
                        <div class="card" style="width: 100%">
                            <img class="card-img-top" src="./assets/imgNews/news/2-min.jpg" alt="Card image cap"
                                 height="230px"/>
                            <div class="card-body">
                                <h5 class="card-title custom__name-product title-news">
                                    Happy halloween with friends
                                </h5>
                                <p class="card-text custom__name-product" style="font-weight: 400">
                                    Món quà "bí mật" sẽ được bật mí và dành tặng các FRIENDS…
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 mb-20">
                    <a href="newDetail.jsp" class="product__new-item">
                        <div class="card" style="width: 100%">
                            <img class="card-img-top" src="./assets/imgNews/news/3-min.jpg" alt="Card image cap"
                                 height="230px"/>
                            <div class="card-body">
                                <h5 class="card-title custom__name-product title-news">
                                    Thu cũ đổi mới - Giảm ngay 20%
                                </h5>
                                <p class="card-text custom__name-product" style="font-weight: 400">
                                    Cơ hội lý tưởng để “reset” tủ đồ của bạn mà vẫn đảm bảo “kinh tế” với chương trình
                                    “Thu cũ đổi mới”…
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="shoesnews__all">
                <a href="Product.jsp" class="shoesnews__all-tittle">Xem tất cả</a>
                <i class="fi-rs-angle-right"></i>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<!-- modal -->
<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">
                        <div class="mb-2 main-img-2">
                            <img src="./assets/imgProduct/images/men/1.jpg" alt="" id="img-main"
                                 xoriginal="./assets/imgProduct/images/men/1.jpg"/>
                        </div>
                        <ul class="all-img-2">
                            <li class="img-item-2">
                                <img src="./assets/imgProduct/images/men/1.jpg" alt="" onclick="changeImg('one')"
                                     id="one"/>
                            </li>
                            <li class="img-item-2">
                                <img src="./assets/imgProduct/images/men/1-a.jpg" alt="" onclick="changeImg('two')"
                                     id="two"/>
                            </li>
                            <li class="img-item-2">
                                <img src="./assets/imgProduct/images/men/1-b.jpg" alt="" onclick="changeImg('three')"
                                     id="three"/>
                            </li>
                            <li class="img-item-2">
                                <img src="./assets/imgProduct/images/men/1-c.jpg" alt="" onclick="changeImg('four')"
                                     id="four"/>
                            </li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <div class="info-product">
                            <h3 class="product-name">
                                <a href="" title="">Áo len sọc lớn màu</a>
                            </h3>
                            <div class="status-product">Trạng thái: <b>Còn hàng</b></div>
                            <div class="infor-oder">Loại sản phẩm: <b>Đồ Nam</b></div>
                            <div class="price-product">
                                <div class="special-price">
                                    <span>540.000đ</span>
                                </div>
                                <div class="price-old">
                                    Giá gốc:
                                    <del>650.000đ</del>
                                    <span class="discount">(-20%)</span>
                                </div>
                            </div>
                            <div class="product-description">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur ducimus vero
                                quibusdam adipisci
                                dolore id veritatis tempore ipsa obcaecati alias libero, minus sequi nam corrupti esse
                                nulla eum,
                                similique deleniti?
                            </div>
                            <div class="product__color d-flex" style="align-items: center">
                                <div class="title" style="font-size: 16px; margin-right: 10px">
                                    Màu:
                                </div>
                                <div class="select-swap d-flex">
                                    <div class="circlecheck">
                                        <input type="radio" id="f-option" class="circle-1" name="selector" checked/>
                                        <label for="f-option"></label>
                                        <div class="outer-circle"></div>
                                    </div>
                                    <div class="circlecheck">
                                        <input type="radio" id="g-option" class="circle-2" name="selector"/>
                                        <label for="g-option"></label>
                                        <div class="outer-circle"></div>
                                    </div>
                                    <div class="circlecheck">
                                        <input type="radio" id="h-option" class="circle-3" name="selector"/>
                                        <label for="h-option"></label>
                                        <div class="outer-circle"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="product__size d-flex" style="align-items: center">
                                <div class="title" style="font-size: 16px; margin-right: 10px">
                                    Kích thước:
                                </div>
                                <div class="select-swap">
                                    <div class="swatch-element" data-value="38">
                                        <input type="radio" class="variant-1" id="swatch-1-38" name="mau" value="trung"
                                               onclick="check()"/>
                                        <label for="swatch-1-38" class="sd"><span>38</span></label>
                                    </div>
                                    <div class="swatch-element" data-value="39">
                                        <input type="radio" class="variant-1" id="swatch-1-39" name="mau" value="thanh"
                                               onclick="check()"/>
                                        <label for="swatch-1-39" class="sd"><span>39</span></label>
                                    </div>
                                    <div class="swatch-element" data-value="40">
                                        <input type="radio" class="variant-1" id="swatch-1-40" name="mau" value="hieu"
                                               onclick="check()"/>
                                        <label for="swatch-1-40" class="sd"><span>40</span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="product__wrap">
                                <div class="product__amount">
                                    <label for="text_so_luong">Số lượng: </label>
                                    <input type="button" value="-" class="control" onclick="tru()"/>
                                    <input type="text" value="1" class="text-input" id="text_so_luong"
                                           onkeypress="validate(event)"/>
                                    <input type="button" value="+" class="control" onclick="cong()"/>
                                </div>
                            </div>
                            <div class="product__shopnow">
                                <button class="shopnow2">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="btn-default btn-close" data-dismiss="modal">
                <i class="fas fa-times-circle"></i>
            </button>
        </div>
    </div>
</div>
<!-- end modal -->
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/main.js"></script>
</body>

</html>