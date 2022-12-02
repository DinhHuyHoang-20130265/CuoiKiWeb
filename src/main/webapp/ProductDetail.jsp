<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>P&T Shop</title>
    <!-- link icon -->
    <link rel="stylesheet" href="./assets/uicons-regular-rounded/css/uicons-regular-rounded.css">
    <link rel='stylesheet' href="./assets/uicons-regular-straight/css/uicons-regular-straight.css">
    <link rel="stylesheet" href="./assets/fontawesome-free-5.15.3-web/css/all.min.css">
    <!-- link css -->
    <link rel="stylesheet" href="./assets/css/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/bootstrap.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/productdetail.css">
    <link rel="stylesheet" href="./assets/css/reponsive1.css">
    <link rel="stylesheet" href="./assets/css/menu-contact.css">
    <link rel="stylesheet" href="./assets/css/productDetail1.css">
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

    .sale-off-2 {
        top: 14px;
        right: 14px;
    }

    /* Mobile & tablet  */

    @media (max-width: 1199px) {
        #main-img img {
            width: 280px;
        }

        .img-item img {
            width: 80px;
        }

        .sale-off-2 {
            top: 14px;
            right: 34px;
        }
    }

    .container-rate-tab {
        position: relative;
        width: 400px;
        background: #c7c7c7;
        padding: 20px 30px;
        border: 1px solid #444;
        border-radius: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    .container-rate-tab .post {
        display: none;
    }

    .container-rate-tab .text {
        font-size: 25px;
        color: #666;
        font-weight: 500;
    }

    .container-rate-tab .edit {
        position: absolute;
        right: 10px;
        top: 5px;
        font-size: 16px;
        color: #666;
        font-weight: 500;
        cursor: pointer;
    }

    .container-rate-tab .edit:hover {
        text-decoration: underline;
    }

    .container-rate-tab .star-widget input {
        display: none;
    }

    .container-rate-tab .star-widget label {
        font-size: 40px;
        color: #444;
        padding: 10px;
        float: right;
        transition: all 0.2s ease;
    }

    .container-rate-tab input:not(:checked) ~ label:hover,
    .container-rate-tab input:not(:checked) ~ label:hover ~ label {
        color: #fd4;
    }

    .container-rate-tab input:checked ~ label {
        color: #fd4;
    }

    .container-rate-tab input#rate-5:checked ~ label {
        color: #fe7;
        text-shadow: 0 0 20px #952;
    }

    #rate-1:checked ~ form header:before {
        content: "Không thích";
    }

    #rate-2:checked ~ form header:before {
        content: "Chưa tốt ";
    }

    #rate-3:checked ~ form header:before {
        content: "Bình thường ";
    }

    #rate-4:checked ~ form header:before {
        content: "Tốt ";
    }

    #rate-5:checked ~ form header:before {
        content: "Rất tốt ";
    }

    .container-rate-tab .container form {
        display: none;
    }

    .container-rate-tab input:checked ~ form {
        display: block;
    }

    .container-rate-tab form header {
        width: 100%;
        font-size: 25px;
        color: #fe7;
        font-weight: 500;
        margin: 5px 0 20px 0;
        text-align: center;
        transition: all 0.2s ease;
    }

    .container-rate-tab form .textarea {
        height: 100px;
        width: 100%;
        overflow: hidden;
    }

    .container-rate-tab form .textarea textarea {
        height: 100%;
        width: 100%;
        outline: none;
        color: #414141;
        border: 1px solid #333;
        padding: 10px;
        font-size: 17px;
        resize: none;
    }

    .container-rate-tab .textarea textarea:focus {
        border-color: #444;
    }
    .btn-rate {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .container-rate-tab form .btn {
        height: 45px;
        width: 100%;
        margin: 15px 0;
    }

    .container-rate-tab-btn {
        width: 100px;
        height: 30px;
        border: 1px solid #444;
        outline: none;
        background: #ededed;
        color: #727272;
        font-size: 17px;
        font-weight: 500;
        text-transform: uppercase;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    form .btn button:hover {
        background: #1b1b1b;
    }

    @media (max-width: 768px) {
        .tablink {
            width: 120px;
        }
    }

    /* tablet */
    @media (min-width: 740px) and (max-width: 1023px) {
        .sale-off-2 {
            top: 0px;
            right: 15px;
        }

        .daonguoc {
            display: flex;
            flex-direction: column-reverse;
        }

        #main-img {
            max-width: unset;
        }

        #main-img img {
            width: 100%;
            margin-left: 0;
            margin-top: 0;
            background-size: cover;
            background-position: center;
            margin-bottom: 10px;
        }

        .all-img > li {
            display: inline-block;
        }

        .all-img {
            padding: unset;
            display: flex;
        }

        .product__detail-row .col-lg-6 {
            height: fit-content;
        }

        .img-item img {
            width: 150px;
            cursor: pointer;
            margin: 5px 10px;
        }

        textarea {
            width: 100%;
        }

        .btn-comment {
            display: block;
            width: 100%;
            padding: 25px 0 35px 0;
            font-size: small;
        }

        .card:hover .hover-icon {
            display: none;
        }
    }

    /* mobile */
    @media (max-width: 739px) {
        .card:hover .hover-icon {
            display: none;
        }

        .sale-off-2 {
            top: 0px !important;
            right: 25px;
        }

        .daonguoc {
            display: flex;
            flex-direction: column-reverse;
        }

        #main-img img {
            width: 100%;
            margin-left: 0;
            margin-top: 0;
            background-size: cover;
            background-position: center;
            margin-bottom: 10px;
        }

        .all-img > li {
            display: inline-block;
        }

        .all-img {
            padding: unset;
        }

        .img-item img {
            width: 80px;
            margin: 5px 2px;
        }

        .product__price {
            margin: 15px 0;
        }

        .product__wrap {
            display: block;
            margin: 15px 0;
        }

        .add-cart {
            width: 100%;
            padding: 10px 0;
            margin: 15px 0;
        }

        .product__shopnow {
            display: block;
        }

        .shopnow {
            width: 100%;
            margin-bottom: 15px;
        }

        .likenow {
            width: 100%;
        }

        .btn-comment {
            width: 100%;
        }

        .sale-off-2 {
            top: 1px;
        }
    }
</style>

<body>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<!-- product detail -->
<div class="container">
    <div class="product__detail">
        <div class="row product__detail-row">
            <div class="col-lg-6 col-12 daonguoc">
                <div class="img-product">
                    <ul class="all-img">
                        <li class="img-item">
                            <img src="./assets/imgProduct/images/men/1.jpg" class="small-img" alt="anh 1"
                                 onclick="changeImg('one')"
                                 id="one">
                        </li>
                        <li class="img-item">
                            <img src="./assets/imgProduct/images/men/1-a.jpg" class="small-img" alt="anh 2"
                                 onclick="changeImg('two')" id="two">
                        </li>
                        <li class="img-item">
                            <img src="./assets/imgProduct/images/men/1-b.jpg" class="small-img" alt="anh 3"
                                 onclick="changeImg('three')" id="three">
                        </li>
                        <li class="img-item">
                            <img src="./assets/imgProduct/images/men/1-c.jpg" class="small-img" alt="anh 4"
                                 onclick="changeImg('four')" id="four">
                        </li>
                    </ul>
                </div>
                <div id="main-img" style="cursor: pointer;">
                    <img src="./assets/imgProduct/images/men/1.jpg" class="big-img" alt="ảnh chính" id="img-main">
                    <div class="sale-off sale-off-2">
                        <span class="sale-off-percent">20%</span>
                        <span class="sale-off-label">GIẢM</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-12">
                <div class="product__name">
                    <h2 style="text-transform: uppercase">Áo len sọc lớn màu</h2>
                </div>
                <div class="status-product">
                    Trạng thái: <b>Còn hàng</b>
                </div>
                <div class="infor-oder">
                    Loại sản phẩm: <b>Đồ Nam</b>
                </div>
                <div class="product__price">
                    <h2>420.000đ</h2>
                </div>
                <div class="price-old">
                    Giá gốc:
                    <del>650.000đ</del>
                    <span class="discount">(-20%)</span>
                </div>
                <div class="product__color d-flex" style="align-items: center;">
                    <div class="title" style="font-size: 16px; margin-right: 10px;">
                        Màu:
                    </div>
                    <div class="select-swap d-flex">

                        <div class="circlecheck">
                            <input type="radio" id="f-option" class="circle-1" name="selector" checked>
                            <label for="f-option"></label>
                            <div class="outer-circle"></div>
                        </div>
                        <div class="circlecheck">
                            <input type="radio" id="g-option" class="circle-2" name="selector">
                            <label for="g-option"></label>
                            <div class="outer-circle"></div>
                        </div>
                        <div class="circlecheck">
                            <input type="radio" id="h-option" class="circle-3" name="selector">
                            <label for="h-option"></label>
                            <div class="outer-circle"></div>
                        </div>
                    </div>
                </div>
                <div class="product__size d-flex" style="align-items: center;">
                    <div class="title" style="font-size: 16px; margin-right: 10px;">
                        Kích thước:
                    </div>
                    <div class="select-swap">
                        <div class="swatch-element" data-value="38">
                            <input type="radio" class="variant-1" id="swatch-1-38" name="mau" value="trung"
                                   onclick="check()">
                            <label for="swatch-1-38" class="sd"><span>38</span></label>
                        </div>
                        <div class="swatch-element" data-value="39">
                            <input type="radio" class="variant-1" id="swatch-1-39" name="mau" value="thanh"
                                   onclick="check()">
                            <label for="swatch-1-39" class="sd"><span>39</span></label>
                        </div>
                        <div class="swatch-element" data-value="40">
                            <input type="radio" class="variant-1" id="swatch-1-40" name="mau" value="hieu"
                                   onclick="check()">
                            <label for="swatch-1-40" class="sd"><span>40</span></label>
                        </div>
                    </div>
                </div>
                <div class="product__wrap">
                    <div class="product__amount">
                        <label>Số lượng: </label>
                        <input type="button" value="-" class="control" onclick="tru(0)" id="cong">
                        <input type="text" value="1" class="text-input" id="text_so_luong-0"
                               onkeypress='validate(event)'>
                        <input type="button" value="+" class="control" onclick="cong(0)">
                    </div>
                    <button class="add-cart" onclick="fadeInModal()">Thêm vào giỏ</button>
                </div>
                <div class="product__shopnow">
                    <button class="shopnow">Mua ngay</button>
                    <span class="home-product-item__like home-product-item__like--liked likedProductDetails"
                          onclick="yeuThich('likedProductDetails')">
              <i class="home-product-item__like-icon-fill far fa-heart" style="font-size: 24px;margin-top: 7px;"></i>
            </span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Begin tab -->
<div class="noidung">
    <div class="container">
        <!-- Tab links -->
        <div class="tab">
            <button class="tablink" onclick="openTab('mota',this,'gray')" id="defaultOpen">Mô tả</button>
            <button class="tablink" onclick="openTab('danhgia',this,'gray')" id="defaultOpen">Đánh giá</button>
            <button class="tablink" onclick="openTab('binhluan',this,'gray')" id="defaultOpen">Bình luận</button>
        </div>
        <!-- Tab content -->
        <div class="tab1">
            <div id="mota" class="tabcontent">
                <div class="row">
                    <div class="col-11">
                        <h3 class="name__product">NIKE MERCURIAL SUPERFLY 8 ACADEMY TF</h3>
                        <h3>Thông số kĩ thuật: </h3>
                        <p>Phân khúc: Academy (tầm trung).</p>
                        <p>Upper: Synthetic - Da tổng hợp cao cấp.</p>
                        <p>Thiết kế đinh giày: Các đinh cao su hình chữ nhật, xếp chồng chéo với nhau. Theo đánh giá của
                            nhiều
                            người chơi thì những đinh TF hình chữ nhật lần này giúp đôi giày có thể trụ vững hơn trên
                            sân.</p>
                        <p>Độ ôm chân: Cao</p>
                        <p>Bộ sưu tập: SAFARI PACK - Ra mắt tháng 4/2021</p>
                        <p>PTrên chân các cầu thủ nổi tiếng như: Cristiano Ronaldo, Kylian Mbappé, Erling Haaland, Jadon
                            Sancho,
                            Leroy Sané, Romelu Lukaku...</p>
                    </div>
                </div>
            </div>
            <div id="binhluan" class="tabcontent">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-12">
                            <div class="body__comment">
                                <div class="comment">
                                    <img class="comment-img" src="./assets/img/product/noavatar.png" alt="">
                                    <div class="comment__content">
                                        <div class="comment__content-heding">
                                            <h4 class="comment__content-name">User1</h4>
                                            <span class="comment__content-time">2021-11-12</span>
                                        </div>
                                        <div class="home-product-item__rating"
                                             style="font-size: 14px;transform-origin: left;margin-bottom: 5px">
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div class="comment__content-content">
                                            <span>Quá đẹp</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment">
                                    <img class="comment-img" src="./assets/img/product/noavatar.png" alt="">
                                    <div class="comment__content">
                                        <div class="comment__content-heding">
                                            <h4 class="comment__content-name">User1</h4>
                                            <span class="comment__content-time">2021-11-12</span>
                                        </div>
                                        <div class="home-product-item__rating"
                                             style="font-size: 14px;transform-origin: left;margin-bottom: 5px">
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div class="comment__content-content">
                                            <span>Đẹp quá</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment">
                                    <img class="comment-img" src="./assets/img/product/noavatar.png" alt="">
                                    <div class="comment__content">
                                        <div class="comment__content-heding">
                                            <h4 class="comment__content-name">User1</h4>
                                            <span class="comment__content-time">2021-11-12</span>
                                        </div>
                                        <div class="home-product-item__rating"
                                             style="font-size: 14px;transform-origin: left;margin-bottom: 5px">
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div class="comment__content-content">
                                            <span>Sản phẩm tốt</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="danhgia" class="tabcontent">
                <% SiteUser user = (SiteUser) request.getSession().getAttribute("user");
                    if (user == null) {
                %>
                <div class="box">
                    <div class="box1">
                        <h1 style="margin-top:12px">Thêm Đánh giá</h1>
                        <button class="butt1">Đăng nhập để đánh giá</button>
                    </div>
                </div>
                <% } else {%>
                <div class="container container-rate-tab">
                    <div class="post">
                        <div class="text">Cảm ơn bạn đã đánh giá!</div>
                        <div class="edit">Chỉnh sửa</div>
                    </div>
                    <div class="star-widget">
                        <input type="radio" name="rate" id="rate-5">
                        <label for="rate-5" class="fas fa-star"></label>
                        <input type="radio" name="rate" id="rate-4">
                        <label for="rate-4" class="fas fa-star"></label>
                        <input type="radio" name="rate" id="rate-3">
                        <label for="rate-3" class="fas fa-star"></label>
                        <input type="radio" name="rate" id="rate-2">
                        <label for="rate-2" class="fas fa-star"></label>
                        <input type="radio" name="rate" id="rate-1">
                        <label for="rate-1" class="fas fa-star"></label>
                        <form action="#">
                            <header></header>
                            <div class="textarea">
                                <textarea cols="30" placeholder="Nhập trải nghiệm cụ thể..."></textarea>
                            </div>
                            <div class="btn-rate">
                                <button class="container-rate-tab-btn" type="submit">Đánh giá</button>
                            </div>
                        </form>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</div>
<!-- end product detail -->
<!-- product relate to -->
<div class="product__relateto">
    <div class="container">
        <h3 class="product__relateto-heading">Sản phẩm liên quan</h3>
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                <a href="#" class="product__new-item">
                    <div class="card" style="width: 100%">
                        <div>
                            <img class="card-img-top" src="./assets/imgProduct/images/men/1.jpg" alt="Card image cap"/>
                            <form action="" class="hover-icon hidden-sm hidden-xs">
                                <input type="hidden"/>
                                <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                    <i class="fas fa-cart-plus"></i>
                                </a>
                                <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                   style="margin-top: 10px">
                                    <i class="fas fa-heart"></i>
                                </a>
                                <a data-toggle="modal" data-target="#myModal" class="quickview" title="Xem nhanh">
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
                <a href="#" class="product__new-item">
                    <div class="card" style="width: 100%">
                        <div>
                            <img class="card-img-top" src="./assets/imgProduct/images/men/2.jpg" alt="Card image cap"/>
                            <form action="" class="hover-icon hidden-sm hidden-xs">
                                <input type="hidden"/>
                                <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                    <i class="fas fa-cart-plus"></i>
                                </a>
                                <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                   style="margin-top: 10px">
                                    <i class="fas fa-heart"></i>
                                </a>
                                <a data-toggle="modal" data-target="#myModal" class="quickview" title="Xem nhanh">
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
                <a href="#" class="product__new-item">
                    <div class="card" style="width: 100%">
                        <div>
                            <img class="card-img-top" src="./assets/imgProduct/images/men/3.jpg" alt="Card image cap"/>
                            <form action="" class="hover-icon hidden-sm hidden-xs">
                                <input type="hidden"/>
                                <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                    <i class="fas fa-cart-plus"></i>
                                </a>
                                <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                   style="margin-top: 10px">
                                    <i class="fas fa-heart"></i>
                                </a>
                                <a data-toggle="modal" data-target="#myModal" class="quickview" title="Xem nhanh">
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
                <a href="#" class="product__new-item">
                    <div class="card" style="width: 100%">
                        <div>
                            <img class="card-img-top" src="./assets/imgProduct/images/men/4.jpg" alt="Card image cap"/>
                            <form action="" class="hover-icon hidden-sm hidden-xs">
                                <input type="hidden"/>
                                <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                                    <i class="fas fa-cart-plus"></i>
                                </a>
                                <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích"
                                   style="margin-top: 10px">
                                    <i class="fas fa-heart"></i>
                                </a>
                                <a data-toggle="modal" data-target="#myModal" class="quickview" title="Xem nhanh">
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
        <div class="seemore">
            <a href="Product.jsp">Xem thêm</a>
        </div>
    </div>
</div>
<!-- end  product relate to-->
<div class="modal" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">
                        <div class="mb-2 main-img-2">
                            <img src="./assets/imgProduct/images/men/1.jpg" alt="" id="img-main"/>
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
                                    <label>Số lượng: </label>
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
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<div id="alert-cart" class="alert" style="display:none">
    <div class="alert__heading">
        <h4>Thêm vào giỏ hàng</h4>
    </div>
    <div class="alert__body">
        <img src="./assets/imgProduct/images/men/1.jpg" alt="" class="alert__body-img">
        <div>
            <h5 class="alert__body-name"></h5>
            <span class="alert__body-amount">Số lượng: 1</span>
            <h6 class="alert__body-price">420.000 VNĐ</h6>
        </div>
    </div>
    <div class="alert__footer">
        <a class="click__cart" style="border-radius: 4px">Xem giỏ hàng</a>
    </div>
</div>
<div class="overlay1" style="display: none" onclick="fadeout()">
</div>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/zoomsl.js"></script>
<script src="./assets/js/main.js"></script>
<script>
    $(document).ready(function () {
        $(".big-img").imagezoomsl({
            zoomrange: [3, 3]
        });
    });
</script>
<script>
    function fadeInModal() {
        $('.alert').fadeIn();
        $('.overlay1').fadeIn();
    }

    function fadeOutModal() {
        $('.alert').fadeOut();
        $('.overlay1').fadeOut();
    }

    function fadeout() {
        $('.overlay1').fadeOut();
        $('.alert').fadeOut();
    }

    setInterval(fadeOutModal, 7000);
</script>
<script>
    function openTab(tabName, elmnt, color) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablink");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].style.backgroundColor = "";
        }
        document.getElementById(tabName).style.display = "block";
        elmnt.style.backgroundColor = color;

    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
</script>
<script>
    const btn = document.querySelector(".container-rate-tab-btn");
    const post = document.querySelector(".container-rate-tab .post");
    const widget = document.querySelector(".star-widget");
    const editBtn = document.querySelector(".container-rate-tab .edit");
    btn.onclick = ()=>{
        widget.style.display = "none";
        post.style.display = "block";
        editBtn.onclick = ()=>{
            widget.style.display = "block";
            post.style.display = "none";
        }
        return false;
    }
</script>
</body>

</html>