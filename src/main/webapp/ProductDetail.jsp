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
  <link rel="icon" href="./assets/img/logo/main.png" type="image/x-icon" />
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

    .all-img>li {
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

    .all-img>li {
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
  <div class="overlay hidden"></div>
  <!-- mobile menu -->
  <div class="mobile-main-menu">
    <div class="drawer-header">
      <a href="">
        <div class="drawer-header--auth">
          <div class="_object">
            <img src="./assets/img/product/noavatar.png" alt="" />
          </div>
          <div class="_body">Đăng nhập <br />Nhận nhiều ưu đãi hơn</div>
        </div>
      </a>
    </div>
    <ul class="ul-first-menu">
      <li>
        <a href="">Đăng nhập</a>
      </li>
      <li>
        <a href="" class="abc">Đăng kí</a>
      </li>
      <!-- <ul class="ul-first-menu">
          <li>
            <a href="">Tài khoản của tôi</a>
          </li>
          <li>
            <a href="">Địạ chỉ của tôi</a>
          </li>
          <li>
            <a href="">Đơn mua</a>
          </li>
          <li>
            <a href="" class="list-like-noicte">Danh sách yêu thích</a>
            <span id="header__second__like--notice" class="header__second__like--notice">3</span>
          </li>
          <li>
            <a href="">Đăng xuất</a>
          </li>
        </ul> -->
    </ul>
    <div class="la-scroll-fix-infor-user">
      <div class="la-nav-menu-items">
        <div class="la-title-nav-items">
          <strong>Danh mục</strong>
        </div>
        <ul class="la-nav-list-items">
          <li class="ng-scope">
            <a href="">Trang chủ</a>
          </li>
          <li class="ng-scope">
            <a href="intro.jsp">Giới thiệu</a>
          </li>
          <li class="ng-scope ng-has-child1">
            <a href="Product.jsp">Sản phẩm <i class="fas fa-plus cong"></i>
              <i class="fas fa-minus tru hidden"></i></a>
            <ul class="ul-has-child1">
              <li class="ng-scope ng-has-child2">
                <a href="Product.jsp">Tất cả sản phẩm</a>
              </li>
              <li class="ng-scope ng-has-child2">
                <a href="Product.jsp">Đồ Nam
                  <i class="fas fa-plus cong2" onclick="hienthi(2,`abc2`)"></i>
                  <i class="fas fa-minus tru2 hidden" onclick="hienthi(2,`abc2`)"></i></a>
                <ul class="ul-has-child2 hidden" id="abc2">
                  <li class="ng-scope ng-has-child2">
                    <a href="Product.jsp">Áo Thun Nam
                      <i class="fas fa-plus cong3" onclick="hienthi(3,`abc3`)"></i>
                      <i class="fas fa-minus tru3 hidden" onclick="hienthi(3,`abc3`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc3">
                      <li class="ng-scope">
                        <a href="Product.jsp">Áo Thun Tay Dài Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Áo Thun Polo Nam </a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="Product.jsp">Áo Sơ Mi Nam
                      <i class="fas fa-plus cong4" onclick="hienthi(4,`abc4`)"></i>
                      <i class="fas fa-minus tru4 hidden" onclick="hienthi(4,`abc4`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc4">
                      <li class="ng-scope">
                        <a href="Product.jsp">Áo Sơ Mi Tay Ngắn Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Áo Sơ Mi Tay Dài Nam </a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="Product.jsp">Quần Short Nam
                      <i class="fas fa-plus cong5" onclick="hienthi(5,`abc5`)"></i>
                      <i class="fas fa-minus tru5 hidden" onclick="hienthi(5,`abc5`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc5">
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Short Kaki Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Short Jean Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Short Thun Nam</a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="Product.jsp">Quần Dài Nam
                      <i class="fas fa-plus cong6" onclick="hienthi(6,`abc6`)"></i>
                      <i class="fas fa-minus tru6 hidden" onclick="hienthi(6,`abc6`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc6">
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Jean Cá Tính Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Jogger Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Kaki Nam</a>
                      </li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li class="ng-scope ng-has-child2">
                <a href="Product.jsp">Đồ Nữ<i class="fas fa-plus cong4" onclick="hienthi(7,`abc7`)"></i>
                  <i class="fas fa-minus tru7 hidden" onclick="hienthi(7,`abc7`)"></i></a>
                <ul class="ul-has-child2 hidden" id="abc7">
                  <li class="ng-scope ng-has-child2">
                    <a href="Product.jsp">Áo Thun Nữ
                      <i class="fas fa-plus cong8" onclick="hienthi(8,`abc8`)"></i>
                      <i class="fas fa-minus tru8 hidden" onclick="hienthi(8,`abc8`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc8">
                      <li class="ng-scope">
                        <a href="Product.jsp">Áo Thun Tay Ngắn Nữ</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Áo Thun Tay Dài Nữ</a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="Product.jsp">Áo Sơ Mi Nữ
                      <i class="fas fa-plus cong9" onclick="hienthi(9,`abc9`)"></i>
                      <i class="fas fa-minus tru9 hidden" onclick="hienthi(9,`abc9`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc9">
                      <li class="ng-scope">
                        <a href="Product.jsp">Áo Sơ Mi Tay Ngắn Nữ</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Áo Sơ Mi Tay Dài Nữ</a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="Product.jsp">Quần Short Nữ
                      <i class="fas fa-plus cong10" onclick="hienthi(10,`abc10`)"></i>
                      <i class="fas fa-minus tru10 hidden" onclick="hienthi(10,`abc10`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc10">
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Short Kaki Nữ</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Short Jean Nữ</a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="Product.jsp">Quần Dài Nữ
                      <i class="fas fa-plus cong11" onclick="hienthi(11,`abc11`)"></i>
                      <i class="fas fa-minus tru11 hidden" onclick="hienthi(11,`abc11`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc11">
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Jogger Nữ</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Jean Đơn Giản Nữ</a>
                      </li>
                      <li class="ng-scope">
                        <a href="Product.jsp">Quần Jean Cá Tính Nữ</a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope">
                    <a href="Product.jsp">Chân Váy</a>
                  </li>
                  <li class="ng-scope">
                    <a href="Product.jsp">Yếm</a>
                  </li>
                </ul>
              </li>
              <li class="ng-scope ng-has-child2">
                <a href="Product.jsp">Đồ Unisex<i class="fas fa-plus cong12" onclick="hienthi(12,`abc12`)"></i>
                  <i class="fas fa-minus tru5 hidden" onclick="hienthi(12,`abc12`)"></i></a>
                <ul class="ul-has-child2 hidden" id="abc12">
                  <li class="ng-scope ng-has-child2">
                    <a href="Product.jsp">Áo Thun Unisex
                      <i class="fas fa-plus cong13" onclick="hienthi(13,`abc13`)"></i>
                      <i class="fas fa-minus tru13 hidden" onclick="hienthi(13,`abc13`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc13">
                      <li class="ng-scope">
                        <a href="Product.jsp">Áo Thun Tay Ngắn Unisex</a>
                      </li>
                    </ul>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="ng-scope">
            <a href="news.jsp">Tin tức</a>
          </li>
          <li class="ng-scope">
            <a href="contact.jsp">Liên hệ</a>
          </li>
        </ul>
      </div>
    </div>
    <ul class="mobile-support">
      <li>
        <div class="drawer-text-support">Hỗ trợ</div>
      </li>
      <li>
        <i class="fas fa-phone-square-alt footer__item-icon">Liên hệ: </i>
        <a href="tel:19006750">19006750</a>
      </li>
      <li>
        <i class="fas fa-envelope-square footer__item-icon">Email: </i>
        <a href="mailto:support@sapo.vn">support@gmail.vn</a>
      </li>
    </ul>
  </div>
  <!-- end mobile menu -->
  <!-- header -->
  <header class="header">
    <div class="container">
      <div class="top-link clearfix hidden-sm hidden-xs">
        <div class="row">
          <div class="col-6 social_link">
            <div class="social-title">Theo dõi:</div>
            <a href=""><i class="fab fa-facebook" style="font-size: 24px; margin-right: 10px"></i></a>
            <a href=""><i class="fab fa-instagram" style="font-size: 24px; margin-right: 10px; color: pink"></i></a>
            <a href=""><i class="fab fa-youtube" style="font-size: 24px; margin-right: 10px; color: red"></i></a>
            <a href=""><i class="fab fa-twitter" style="font-size: 24px; margin-right: 10px"></i></a>
          </div>
          <div class="col-6 login_link">
            <ul class="header_link right m-auto">
              <li>
                <a href="Login.jsp"><i class="fas fa-sign-in-alt mr-3"></i>Đăng nhập</a>
              </li>
              <li>
                <a href="registration.jsp"><i class="fas fa-user-plus mr-3" style="margin-left: 10px"></i>Đăng kí</a>
              </li>
            </ul>
            <!-- <ul class="nav nav__first right">
                <li class="nav-item nav-item__first nav-item__first-user">
                  <img src="./assets/img/product/noavatar.png" alt="" class="nav-item__first-img">
                  <span class="nav-item__first-name">Quốc Trung</span>
                  <ul class="nav-item__first-menu">
                    <li class="nav-item__first-item">
                      <a href="">Tài khoản của tôi</a>
                    </li>
                    <li class="nav-item__first-item">
                      <a href="">Địa chỉ của tôi</a>
                    </li>
                    <li class="nav-item__first-item">
                      <a href="">Đơn mua</a>
                    </li>
                    <li class="nav-item__first-item">
                      <a href="">Đăng xuất</a>
                    </li>
                  </ul>
                </li>
              </ul> -->
          </div>
        </div>
      </div>
      <div class="header-main clearfix">
        <div class="row">
          <div class="col-lg-3 col-100-h">
            <div id="trigger-mobile" class="visible-sm visible-xs">
              <i class="fas fa-bars"></i>
            </div>
            <div class="logo">
              <a href="">
                <img src="./assets/img/logo/logomain.png" alt="" />
              </a>
            </div>
            <div class="mobile_cart visible-sm visible-xs">
              <a href="cart.jsp" class="header__second__cart--icon">
                <i class="fas fa-shopping-cart"></i>
                <span id="header__second__cart--notice" class="header__second__cart--notice">3</span>
              </a>
              <a href="listlike.jsp" class="header__second__like--icon">
                <i class="far fa-heart"></i>
                <span id="header__second__like--notice" class="header__second__like--notice">3</span>
              </a>
            </div>
          </div>
          <div class="col-lg-6 m-auto pdt15">
            <form class="example" action="Product.jsp">
              <input type="text" class="input-search" placeholder="Tìm kiếm.." name="search" />
              <button type="submit" class="search-btn">
                <i class="fa fa-search"></i>
              </button>
            </form>
          </div>
          <div class="col-3 m-auto hidden-sm hidden-xs">
            <div class="item-car clearfix">
              <a href="cart.jsp" class="header__second__cart--icon">
                <i class="fas fa-shopping-cart"></i>
                <span id="header__second__cart--notice" class="header__second__cart--notice">3</span>
              </a>
            </div>
            <div class="item-like clearfix">
              <a href="listlike.jsp" class="header__second__like--icon">
                <i class="far fa-heart"></i>
                <span id="header__second__like--notice" class="header__second__like--notice">3</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <nav class="header_nav hidden-sm hidden-xs">
      <div class="container">
        <ul class="header_nav-list nav">
          <li class="header_nav-list-item">
            <a href="index.jsp" class="active">Trang chủ</a>
          </li>
          <li class="header_nav-list-item">
            <a href="intro.jsp">Giới thiệu</a>
          </li>
          <li class="header_nav-list-item has-mega">
            <a href="Product.jsp">Sản phẩm<i class="fas fa-angle-right" style="margin-left: 5px"></i></a>
            <div class="mega-content" style="overflow-x: hidden">
              <div class="row">
                <ul class="col-8 no-padding level0">
                  <li class="level1">
                    <a class="hmega" href="Product.jsp">Tất cả sản phẩm</a>
                  </li>
                  <li class="level1">
                    <a class="hmega">Đồ Nam</a>
                    <ul class="level1">
                      <li class="level2">
                        <a href="Product.jsp">Áo Thun Nam</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="Product.jsp">Áo Thun Tay Dài Nam</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Áo Thun Polo Nam</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="Product.jsp">Áo Sơ Mi Nam</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="Product.jsp">Áo Sơ Mi Tay Ngắn Nam</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Áo Sơ Mi Tay Dài Nam</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="Product.jsp">Quần Short Nam</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="Product.jsp">Quần Short Kaki Nam</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Quần Short Jean Nam</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Quần Short Thun Nam</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="Product.jsp">Quần Dài Nam</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="Product.jsp">Quần Jean Cá Tính Nam</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Quần Jogger Nam</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Quần Kaki Nam</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li class="level1">
                    <a class="hmega">Đồ Nữ</a>
                    <ul class="level1">
                      <li class="level2">
                        <a href="Product.jsp">Áo Thun Nữ</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="Product.jsp">Áo Thun Tay Ngắn Nữ</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Áo Thun Tay Dài</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="Product.jsp">Áo Sơ Mi Nữ</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="Product.jsp">Áo Sơ Mi Tay Ngắn Nữ</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Áo Sơ Mi Tay Dài Nữ</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="Product.jsp">Quần Short Nữ</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="Product.jsp">Quần Short Kaki Nữ</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Quần Short Jean Nữ</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="Product.jsp">Quần Dài Nữ</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="Product.jsp">Quần Jogger Nữ</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Quần Jean Đơn Giản Nữ</a>
                          </li>
                          <li class="level3">
                            <a href="Product.jsp">Quần Jean Cá Tính Nữ</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="Product.jsp">Chân Váy</a>
                      </li>
                      <li class="level2"><a href="Product.jsp">Yếm</a></li>
                    </ul>
                  </li>
                  <li class="level1">
                    <a class="hmega">Đồ Unisex</a>
                    <ul class="level1">
                      <li class="level2">
                        <a href="Product.jsp">Áo Thun Unisex</a>
                      </li>
                    </ul>
                  </li>
                </ul>
                <div class="col-4">
                  <a href="#">
                    <picture>
                      <img src="./assets/img/product/gif.gif" alt="" width="80%" />
                    </picture>
                  </a>
                </div>
              </div>
            </div>
          </li>
          <li class="header_nav-list-item">
            <a href="news.jsp">Tin tức</a>
          </li>
          <li class="header_nav-list-item">
            <a href="contact.jsp">Liên hệ</a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- end header -->
  <!-- product detail -->
  <div class="container">
    <div class="product__detail">
      <div class="row product__detail-row">
        <div class="col-lg-6 col-12 daonguoc">
          <div class="img-product">
            <ul class="all-img">
              <li class="img-item">
                <img src="./assets/imgProduct/images/men/1.jpg" class="small-img" alt="anh 1" onclick="changeImg('one')"
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
                <input type="radio" class="variant-1" id="swatch-1-38" name="mau" value="trung" onclick="check()">
                <label for="swatch-1-38" class="sd"><span>38</span></label>
              </div>
              <div class="swatch-element" data-value="39">
                <input type="radio" class="variant-1" id="swatch-1-39" name="mau" value="thanh" onclick="check()">
                <label for="swatch-1-39" class="sd"><span>39</span></label>
              </div>
              <div class="swatch-element" data-value="40">
                <input type="radio" class="variant-1" id="swatch-1-40" name="mau" value="hieu" onclick="check()">
                <label for="swatch-1-40" class="sd"><span>40</span></label>
              </div>
            </div>
          </div>
          <div class="product__wrap">
            <div class="product__amount">
              <label for="">Số lượng: </label>
              <input type="button" value="-" class="control" onclick="tru(0)" id="cong">
              <input type="text" value="1" class="text-input" id="text_so_luong-0" onkeypress='validate(event)'>
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
              <p>Thiết kế đinh giày: Các đinh cao su hình chữ nhật, xếp chồng chéo với nhau. Theo đánh giá của nhiều
                người chơi thì những đinh TF hình chữ nhật lần này giúp đôi giày có thể trụ vững hơn trên sân.</p>
              <p>Độ ôm chân: Cao</p>
              <p>Bộ sưu tập: SAFARI PACK - Ra mắt tháng 4/2021</p>
              <p>PTrên chân các cầu thủ nổi tiếng như: Cristiano Ronaldo, Kylian Mbappé, Erling Haaland, Jadon Sancho,
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
          <div class="box">
            <div class="box1">
              <h1 style="margin-top:12px">Thêm Đánh giá</h1>
              <button class="butt1">Đăng nhập để đánh giá</button>
            </div>
          </div>
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
          <a href="./ProductDetail.html" class="product__new-item">
            <div class="card" style="width: 100%">
              <div>
                <img class="card-img-top" src="./assets/imgProduct/images/men/1.jpg" alt="Card image cap" />
                <form action="" class="hover-icon hidden-sm hidden-xs">
                  <input type="hidden" />
                  <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                    <i class="fas fa-cart-plus"></i>
                  </a>
                  <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích" style="margin-top: 10px">
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
          <a href="./ProductDetail.html" class="product__new-item">
            <div class="card" style="width: 100%">
              <div>
                <img class="card-img-top" src="./assets/imgProduct/images/men/2.jpg" alt="Card image cap" />
                <form action="" class="hover-icon hidden-sm hidden-xs">
                  <input type="hidden" />
                  <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                    <i class="fas fa-cart-plus"></i>
                  </a>
                  <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích" style="margin-top: 10px">
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
          <a href="./ProductDetail.html" class="product__new-item">
            <div class="card" style="width: 100%">
              <div>
                <img class="card-img-top" src="./assets/imgProduct/images/men/3.jpg" alt="Card image cap" />
                <form action="" class="hover-icon hidden-sm hidden-xs">
                  <input type="hidden" />
                  <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                    <i class="fas fa-cart-plus"></i>
                  </a>
                  <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích" style="margin-top: 10px">
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
          <a href="./ProductDetail.html" class="product__new-item">
            <div class="card" style="width: 100%">
              <div>
                <img class="card-img-top" src="./assets/imgProduct/images/men/4.jpg" alt="Card image cap" />
                <form action="" class="hover-icon hidden-sm hidden-xs">
                  <input type="hidden" />
                  <a href="pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                    <i class="fas fa-cart-plus"></i>
                  </a>
                  <a href="cart.jsp" class="btn-add-to-cart" title="Đưa vào trang ưu thích" style="margin-top: 10px">
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
                <img src="./assets/imgProduct/images/men/1.jpg" alt="" id="img-main" />
              </div>
              <ul class="all-img-2">
                <li class="img-item-2">
                  <img src="./assets/imgProduct/images/men/1.jpg" alt="" onclick="changeImg('one')" id="one" />
                </li>
                <li class="img-item-2">
                  <img src="./assets/imgProduct/images/men/1-a.jpg" alt="" onclick="changeImg('two')" id="two" />
                </li>
                <li class="img-item-2">
                  <img src="./assets/imgProduct/images/men/1-b.jpg" alt="" onclick="changeImg('three')" id="three" />
                </li>
                <li class="img-item-2">
                  <img src="./assets/imgProduct/images/men/1-c.jpg" alt="" onclick="changeImg('four')" id="four" />
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
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur ducimus vero quibusdam adipisci
                  dolore id veritatis tempore ipsa obcaecati alias libero, minus sequi nam corrupti esse nulla eum,
                  similique deleniti?
                </div>
                <div class="product__color d-flex" style="align-items: center">
                  <div class="title" style="font-size: 16px; margin-right: 10px">
                    Màu:
                  </div>
                  <div class="select-swap d-flex">
                    <div class="circlecheck">
                      <input type="radio" id="f-option" class="circle-1" name="selector" checked />
                      <label for="f-option"></label>
                      <div class="outer-circle"></div>
                    </div>
                    <div class="circlecheck">
                      <input type="radio" id="g-option" class="circle-2" name="selector" />
                      <label for="g-option"></label>
                      <div class="outer-circle"></div>
                    </div>
                    <div class="circlecheck">
                      <input type="radio" id="h-option" class="circle-3" name="selector" />
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
                        onclick="check()" />
                      <label for="swatch-1-38" class="sd"><span>38</span></label>
                    </div>
                    <div class="swatch-element" data-value="39">
                      <input type="radio" class="variant-1" id="swatch-1-39" name="mau" value="thanh"
                        onclick="check()" />
                      <label for="swatch-1-39" class="sd"><span>39</span></label>
                    </div>
                    <div class="swatch-element" data-value="40">
                      <input type="radio" class="variant-1" id="swatch-1-40" name="mau" value="hieu"
                        onclick="check()" />
                      <label for="swatch-1-40" class="sd"><span>40</span></label>
                    </div>
                  </div>
                </div>
                <div class="product__wrap">
                  <div class="product__amount">
                    <label for="">Số lượng: </label>
                    <input type="button" value="-" class="control" onclick="tru()" />
                    <input type="text" value="1" class="text-input" id="text_so_luong" onkeypress="validate(event)" />
                    <input type="button" value="+" class="control" onclick="cong()" />
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
  <!-- footer -->
  <footer class="footer">
    <div class="container">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="flexbox-alignItems-center">
          <div class="emailWrp">
            <h7 class="title-footer">Đăng kí nhận khuyến mãi</h7>
            <form class="form-subrice" action="">
              <input type="text" placeholder="Nhập vào email của bạn" name="q" class="subcrible">
              <button type="submit" class="findButton">Gửi</button>
            </form>
          </div>
          <div class="subWrp">
            <h7 class="title-footer">Tra cứu đơn hàng của bạn</h7>
            <form class="form-subrice" action="">
              <input type="text" placeholder="Nhập SĐT hoặc Mã số đơn hàng" name="q" class="subcrible">
              <button type="submit" class="findButton">TÌM</button>
            </form>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-3">
          <img src="./assets/img/logo/logomain.png" alt="" width="100px" height="100px"
            style="border-radius: 50%;border: 3px solid #000;margin-bottom: 20px;">
          <ul class="footer__list">
            <li class="footer__item">
              <p><i class="fas fa-search-location footer__item-icon"></i> Ho Chi Minh, Viet Nam</p>
            </li>
            <li class="footer__item">
              <p><i class="fas fa-phone-square-alt footer__item-icon"></i> Số điện thoại: <a
                  href="tel:0123456789">0123456789</a></p>
            </li>
            <li class="footer__item">
              <p><i class="fas fa-envelope-square footer__item-icon"></i> Email: <a
                  href="mailto:abc@gmail.com">abc@gmail.com</a></p>
            </li>
            <li>
              <a href=""><i class="fab fa-facebook" style="font-size: 24px; margin-right: 10px"></i></a>
              <a href=""><i class="fab fa-instagram" style="font-size: 24px; margin-right: 10px;color: pink;"></i></a>
              <a href=""><i class="fab fa-youtube" style="font-size: 24px; margin-right: 10px;color: red;"></i></a>
              <a href=""><i class="fab fa-twitter" style="font-size: 24px; margin-right: 10px"></i></a>
            </li>
          </ul>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-3">
          <div class="footer_toggle"
            style="display: flex;justify-content:space-between;cursor: pointer;margin-bottom: 8px;"
            data-toggle="collapse" data-target="#demo2">
            <h3 class="footer__heading">Thông tin của chúng tôi</h3><i class="fas fa-chevron-down checkdl1"></i>
          </div>
          <ul class="footer__list collapse show" id="demo2">
            <li class="footer__item">
              <a href="" class="footer__item--link">Cơ sở 1: 26 Đường D1, P12, Quận Bình Thanh, TP.HCM</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Cơ sở 2: 86 Đinh Bộ Lĩnh, P26, Quận Bình Thanh, TP.HCM</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Lĩnh vực kinh doanh</a>
            </li>
          </ul>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-3">
          <div class="footer_toggle"
            style="display: flex;justify-content:space-between;cursor: pointer;margin-bottom: 8px;"
            data-toggle="collapse" data-target="#demo1">
            <h3 class="footer__heading">Chính sách</h3><i class="fas fa-chevron-down checkdl1"></i>
          </div>
          <ul class="footer__list collapse show" id="demo1">
            <li class="footer__item">
              <a href="" class="footer__item--link">Chính sách bảo hành</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Chính sách đổi trả</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Chính sách thanh toán</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Chính sách giao nhận hàng</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Chính sách bảo mật</a>
            </li>
          </ul>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-3">
          <div class="footer_toggle"
            style="display: flex;justify-content:space-between;cursor: pointer;margin-bottom: 8px;"
            data-toggle="collapse" data-target="#demo">
            <h3 class="footer__heading">Hỗ trợ chung</h3><i class="fas fa-chevron-down checkdl1"></i>
          </div>
          <ul class="footer__list collapse show" id="demo">
            <li class="footer__item">
              <a href="" class="footer__item--link">Trang chủ</a>
            <li class="footer__item">
              <a href="" class="footer__item--link">Giới thiệu</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Sản phẩm</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Tin tức</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Liên hệ</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="footer__bottom">
      <p class="footer__text">© Bản quyền thuộc về P&T Shop</p>
    </div>
  </footer>
  <div id="go-to-top">
    <a class="btn-gototop"><i class="fas fa-arrow-up"></i></a>
  </div>
  <!-- end footer -->
  <!--contact menu-->
  <div class="fab-wrapper">
    <input id="fabCheckbox" type="checkbox" class="fab-checkbox" />
    <label class="fab1" for="fabCheckbox">
      <span class="fab-dots fab-dots-1"></span>
      <span class="fab-dots fab-dots-2"></span>
      <span class="fab-dots fab-dots-3"></span>
    </label>
    <div class="fab-wheel">
      <a href="#" class="fab-action fab-action-1">
        <i class="fab fa-facebook"></i>
      </a>
      <a href="#" class="fab-action fab-action-2">
        <i class="fab fa-instagram"></i>
      </a>
      <a href="#" class="fab-action fab-action-3">
        <i class="far fa-comment-dots"></i>
      </a>
      <a href="#" class="fab-action fab-action-4">
        <i class="fab fa-github"></i>
      </a>
    </div>
    <!--end contact menu-->

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
</body>

</html>