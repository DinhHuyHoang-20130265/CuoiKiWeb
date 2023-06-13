<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.SlideService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.slide.Slide" %>
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
                    <%
                        List<Slide> listSlide = SlideService.getInstance().LoadAllSlide();
                    %>
                    <div id="demo" class="carousel slide" data-ride="carousel">
                        <ul class="carousel-indicators">
                            <% for (int k = 0; k < listSlide.size(); k++) { %>
                            <li data-target="#demo" data-slide-to="<%=k%>" class="<%=k==0 ? "active" : ""%>"></li>
                            <%}%>
                        </ul>
                        <div class="carousel-inner">
                            <% int h = 0;
                                for (Slide slide : listSlide) {%>
                            <div class="carousel-item <%=h==0 ? "active" : ""%>">
                                <img src="<%=slide.getSlide_link()%>" alt="Los Angeles" width="1100" height="500"
                                     style="max-width: 1100px; max-height: 500px; min-width: 1100px; min-height: 500px;"/>
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <% h++;
                            }
                            %>
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
            <%SiteUser user = (SiteUser) request.getSession().getAttribute("user");%>
            <%NumberFormat formatter = NumberFormat.getInstance(new Locale("vn", "VN"));%>
            <%List<Product> newProducts = ProductService.getInstance().loadProductWithCondition(1, 6, "5", "all", null, null, null, null);%>
            <%List<Product> hotProducts = ProductService.getInstance().loadProductWithCondition(1, 6, "0", "all", null, null, null, null);%>
            <%List<Product> likeProducts = ProductService.getInstance().loadProductWithCondition(1, 6, "7", "all", null, null, null, null);%>
            <div class="product_popular">
                <h3 class="product__popular title-product">Sản phẩm phổ biến</h3>
                <div class="row">
                    <div class="col-lg-6 col-sm-12 mb-20" style="justify-content: center; display: flex">
                        <div class="card" style="width: 75%">
                            <img class="card-img-top" src="./assets/imgProduct/images/m1.jpg" alt="Card image"
                                 style="width: 100%"/>
                            <div class="card-body">
                                <h4 class="card-title">Áo len sọc lớn màu</h4>
                                <a href="ProductDetail.jsp?id=prod001" class="btn btn-buynow">Xem
                                    ngay
                                    <i class="fas fa-arrow-right" style="font-size: 16px"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 mb-20" style="justify-content: center; display: flex">
                        <div class="card" style="width: 75%">
                            <img class="card-img-top" src="./assets/imgProduct/images/m3.jpg" alt="Card image"
                                 style="width: 100%"/>
                            <div class="card-body">
                                <h4 class="card-title">Áo len traffic</h4>
                                <a href="ProductDetail.jsp?id=prod003" class="btn btn-buynow">Xem ngay
                                    <i class="fas fa-arrow-right" style="font-size: 16px"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product__new">
                <h3 class="product__ne title-product">Sản phẩm mới</h3>
                <div class="row">
                    <%for (int i = 0; i < 4; i++) {%>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="./ProductDetail.jsp?id=<%=newProducts.get(i).getId()%>" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="<%=newProducts.get(i).getMain_img_link()%>"
                                         alt="Card image cap"/>
                                    <form class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden">
                                        <% if (user != null) {%>
                                        <a class="btn-add-to-cart add-wishlist"
                                           id="addWishList<%=newProducts.get(i).getId()%>"
                                           title="Đưa vào danh sách yêu thích">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <%}%>
                                        <a class="quickview quickviewProduct"
                                           title="Xem nhanh" id="view<%=newProducts.get(i).getId()%>">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        <%=newProducts.get(i).getProd_name()%>
                                    </h5>
                                    <div class="product__price">
                                        <%if (newProducts.get(i).getSales() != null) {%>
                                        <p class="card-text price-color product__price-old"><%=formatter.format(newProducts.get(i).getPrice())%>
                                            đ</p>
                                        <p class="card-text price-color product__price-new"><%=formatter.format(newProducts.get(i).getPrice() * (1 - (newProducts.get(i).getSales().getDiscount_rate()) * 0.01))%>
                                            đ</p>
                                        <%} else {%>
                                        <p class="card-text price-color product__price-old" style="opacity: 0">0</p>
                                        <p class="card-text price-color product__price-new"><%=formatter.format(newProducts.get(i).getPrice())%>
                                            đ</p>
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
                                        <span class="home-product-item__sold"><%=newProducts.get(i).getView_count()%> Lượt xem</span>
                                    </div>
                                    <%if (newProducts.get(i).getSales() != null) {%>
                                    <div class="sale-off">
                                        <span class="sale-off-percent"><%=newProducts.get(i).getSales().getDiscount_rate()%>%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </a>
                    </div>
                    <%}%>
                </div>
            </div>
            <div class="product__sale">
                <h3 class="product__sale title-product">Top sản phẩm hot</h3>
                <div class="row">
                    <%for (int i = 0; i < 4; i++) {%>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="./ProductDetail.jsp?id=<%=hotProducts.get(i).getId()%>" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="<%=hotProducts.get(i).getMain_img_link()%>"
                                         alt="Card image cap"/>
                                    <form class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden">
                                        <% if (user != null) {%>
                                        <a class="btn-add-to-cart add-wishlist"
                                           id="addWishList<%=hotProducts.get(i).getId()%>"
                                           title="Đưa vào danh sách yêu thích">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <%}%>
                                        <a class="quickview quickviewProduct"
                                           title="Xem nhanh" id="view<%=hotProducts.get(i).getId()%>">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        <%=hotProducts.get(i).getProd_name()%>
                                    </h5>
                                    <div class="product__price">
                                        <%if (hotProducts.get(i).getSales() != null) {%>
                                        <p class="card-text price-color product__price-old"><%=formatter.format(hotProducts.get(i).getPrice())%>
                                            đ</p>
                                        <p class="card-text price-color product__price-new"><%=formatter.format(hotProducts.get(i).getPrice() * (1 - (hotProducts.get(i).getSales().getDiscount_rate()) * 0.01))%>
                                            đ</p>
                                        <%} else {%>
                                        <p class="card-text price-color product__price-old" style="opacity: 0">0</p>
                                        <p class="card-text price-color product__price-new"><%=formatter.format(hotProducts.get(i).getPrice())%>
                                            đ</p>
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
                                        <span class="home-product-item__sold"><%=hotProducts.get(i).getView_count()%> Lượt xem</span>
                                    </div>
                                    <%if (hotProducts.get(i).getSales() != null) {%>
                                    <div class="sale-off">
                                        <span class="sale-off-percent"><%=hotProducts.get(i).getSales().getDiscount_rate()%>%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </a>
                    </div>
                    <%}%>
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
                                                        Liên hệ hỗ trợ 24/7
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
                    <%for (int i = 0; i < 4; i++) {%>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
                        <a href="./ProductDetail.jsp?id=<%=likeProducts.get(i).getId()%>" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="<%=likeProducts.get(i).getMain_img_link()%>"
                                         alt="Card image cap"/>
                                    <form class="hover-icon hidden-sm hidden-xs">
                                        <input type="hidden">
                                        <% if (user != null) {%>
                                        <a class="btn-add-to-cart add-wishlist"
                                           id="addWishList<%=likeProducts.get(i).getId()%>"
                                           title="Đưa vào danh sách yêu thích">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <%}%>
                                        <a class="quickview quickviewProduct"
                                           title="Xem nhanh" id="view<%=likeProducts.get(i).getId()%>">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        <%=likeProducts.get(i).getProd_name()%>
                                    </h5>
                                    <div class="product__price">
                                        <%if (likeProducts.get(i).getSales() != null) {%>
                                        <p class="card-text price-color product__price-old"><%=formatter.format(likeProducts.get(i).getPrice())%>
                                            đ</p>
                                        <p class="card-text price-color product__price-new"><%=formatter.format(likeProducts.get(i).getPrice() * (1 - (likeProducts.get(i).getSales().getDiscount_rate()) * 0.01))%>
                                            đ</p>
                                        <%} else {%>
                                        <p class="card-text price-color product__price-old" style="opacity: 0">0</p>
                                        <p class="card-text price-color product__price-new"><%=formatter.format(likeProducts.get(i).getPrice())%>
                                            đ</p>
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
                                        <span class="home-product-item__sold"><%=likeProducts.get(i).getView_count()%> Lượt xem</span>
                                    </div>
                                    <%if (likeProducts.get(i).getSales() != null) {%>
                                    <div class="sale-off">
                                        <span class="sale-off-percent"><%=likeProducts.get(i).getSales().getDiscount_rate()%>%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </a>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
    <div class="shoesnews">
        <div class="container">
            <h3 class="shoesnews__title">Tin tức</h3>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 mb-20">
                    <a href="newDetail.jsp?id=news001" class="product__new-item">
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
                    <a href="newDetail.jsp?id=news002" class="product__new-item">
                        <div class="card" style="width: 100%">
                            <img class="card-img-top" src="./assets/imgNews/news/2-min.jpg" alt="Card image cap"
                                 height="230px"/>
                            <div class="card-body">
                                <h5 class="card-title custom__name-product title-news">
                                    Happy Halloween with friends
                                </h5>
                                <p class="card-text custom__name-product" style="font-weight: 400">
                                    Món quà "bí mật" sẽ được bật mí và dành tặng các FRIENDS…
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 mb-20">
                    <a href="newDetail.jsp?id=news003" class="product__new-item">
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
        <div class="modal-content" id="modal-content">
        </div>
    </div>
</div>
<!-- end modal -->
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/main.js"></script>
<script>
    $(document).ready(async function () {
        load();
        addwishlist();
    });

    function load() {
        const value = document.getElementsByClassName("quickviewProduct")
        for (let i = 0; i < value.length; i++) {
            value.item(i).addEventListener('click', function (e) {
                e.preventDefault();
                const idQuickview = this.id;
                $.ajax({
                    type: "post",
                    url: "QuickViewController",
                    data: {
                        idQuickview: idQuickview
                    },
                    success: function (data) {
                        $("#modal-content").html(data);
                        $("#myModal").modal('toggle');
                        addcart()
                        $(".circlecheck").each(function () {
                            const $this = $(this);
                            const id = $this.find("input").attr("id");
                            const color = id.substring(0, id.indexOf("-"));
                            const style = document.createElement('style');
                            style.type = 'text/css';
                            style.innerHTML = `
                            .circlecheck input[type=radio].circle-` + color + `:checked ~ .outer-circle {
                                border: 3px solid ` + color + `;
                            }

                            .circlecheck input[type=radio].circle-` + color + ` ~ .outer-circle {
                                border-color: ` + color + `;
                            }
                            .circlecheck input[type=radio].circle-` + color + `:checked ~ .outer-circle::before {
                                background: ` + color + `;
                            }
                            `;
                            document.getElementsByTagName('head')[0].appendChild(style);
                        })
                    }
                });
            })
        }
    }

    function addwishlist() {
        $(".btn-add-to-cart").click(function (e) {
            e.preventDefault();
            const id = this.id;
            console.log(id);
            if (id == null) {
                alert("Không thể đưa vào danh sách yêu thích")
            } else {
                $.ajax(({
                    url: "AddWishListController",
                    type: "get",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        $(".header_wishlist").each(function () {
                            $(this).text(data);
                        })
                        // $(".home-product-item__action span i").html(`<i class="home-product-item__like-icon-fill fas fa-heart" style="display: contents!important;"></i>`)
                    }
                }))
            }
        })
    }

    function addcart() {
        $(".shopnow2").click(function (e) {
            e.preventDefault();
            const idAdd = this.id;
            const amount = $("#text_so_luong-10").val();
            const size = $(".swatch-element input[type='radio']:checked").val();
            const color = $(".circlecheck input[type='radio']:checked").attr("id");
            if (size == null || color == null) {
                alert("Yêu cầu nhập đầy đủ thông tin")
            } else {
                $.ajax({
                    url: "AddCartController",
                    type: "get",
                    data: {
                        idAdd: idAdd,
                        size: size,
                        color: color,
                        amount: amount
                    },
                    success: function (data) {
                        $(".header__second__cart--notice").each(function () {
                            $(this).text(data)
                        })
                        $(".product__shopnow").html(`<a class="notify" style="color:green; font-size: 16px; font-weight: 600;"><i class="fas fa-check" style="color: green"></i> Thêm sản phẩm vào giỏ hàng thành công !</a>`)
                    }
                })
            }
        })
    }
</script>
</body>

</html>