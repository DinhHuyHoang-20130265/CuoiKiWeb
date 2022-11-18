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
  <link rel="stylesheet" href="./assets/css/login.css">
  <link rel="stylesheet" href="./assets/css/reponsive1.css">
  <link rel="stylesheet" href="./assets/css/menu-contact.css">
  <link rel="stylesheet" href="./assets/css/intro.css">
  <link rel="icon" href="./assets/img/logo/main.png" type="image/x-icon" />
</head>
<style>
     .title-heading {
        margin: 0;
        color: #36424b;
        font-size: 18px;
        font-weight: 500;
        padding: 0;
        margin-top: 0;
        margin-bottom: 10px;
        position: relative;
        text-transform: uppercase;
    }

    .contact-info {
        padding: 0;
    }

    .contact-info li {
        display: table;
        margin-bottom: 7px;
        font-size: 14px;
    }

    .text-contact {
        font-style: italic;
        color: #707e89;
        font-size: 12px;
    }
    .mapbox {
        border-top: 1px solid #e8e9f1;
        margin-top: 30px;
        height: 350px;
        overflow: hidden;
        border: 10px solid #e5e5e5;
        border-radius: 3px;
    }
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
  .content-page p{
    font-size: 16px;
    padding: 5px 0;
  }
    /* Mobile & tablet  */
  @media (max-width: 1023px) {
  }
  /* tablet */
  @media (min-width: 740px) and (max-width: 1023px) {
    
    textarea {
      width: 100%;
    }
    
  }
  /* mobile */
  @media (max-width: 739px) {
    
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
              <a href="./intro.html">Giới thiệu</a>
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
              <a href=""
                ><i
                  class="fab fa-facebook"
                  style="font-size: 24px; margin-right: 10px"
                ></i
              ></a>
              <a href=""
                ><i
                  class="fab fa-instagram"
                  style="font-size: 24px; margin-right: 10px; color: pink"
                ></i
              ></a>
              <a href=""
                ><i
                  class="fab fa-youtube"
                  style="font-size: 24px; margin-right: 10px; color: red"
                ></i
              ></a>
              <a href=""
                ><i
                  class="fab fa-twitter"
                  style="font-size: 24px; margin-right: 10px"
                ></i
              ></a>
            </div>
            <div class="col-6 login_link">
              <ul class="header_link right m-auto">
                <li>
                  <a href="Login.jsp"
                    ><i class="fas fa-sign-in-alt mr-3"></i>Đăng nhập</a
                  >
                </li>
                <li>
                  <a href="registration.jsp"
                    ><i
                      class="fas fa-user-plus mr-3"
                      style="margin-left: 10px"
                    ></i
                    >Đăng kí</a
                  >
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
                  <span
                    id="header__second__cart--notice"
                    class="header__second__cart--notice"
                    >3</span
                  >
                </a>
                <a href="listlike.jsp" class="header__second__like--icon">
                  <i class="far fa-heart"></i>
                  <span
                    id="header__second__like--notice"
                    class="header__second__like--notice"
                    >3</span
                  >
                </a>
              </div>
            </div>
            <div class="col-lg-6 m-auto pdt15">
              <form class="example" action="Product.jsp">
                <input
                  type="text"
                  class="input-search"
                  placeholder="Tìm kiếm.."
                  name="search"
                />
                <button type="submit" class="search-btn">
                  <i class="fa fa-search"></i>
                </button>
              </form>
            </div>
            <div class="col-3 m-auto hidden-sm hidden-xs">
              <div class="item-car clearfix">
                <a href="cart.jsp" class="header__second__cart--icon">
                  <i class="fas fa-shopping-cart"></i>
                  <span
                    id="header__second__cart--notice"
                    class="header__second__cart--notice"
                    >3</span
                  >
                </a>
              </div>
              <div class="item-like clearfix">
                <a href="listlike.jsp" class="header__second__like--icon">
                  <i class="far fa-heart"></i>
                  <span
                    id="header__second__like--notice"
                    class="header__second__like--notice"
                    >3</span
                  >
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
              <a href="index.jsp">Trang chủ</a>
            </li>
            <li class="header_nav-list-item">
              <a href="./intro.html" class="active">Giới thiệu</a>
            </li>
            <li class="header_nav-list-item has-mega">
              <a href="Product.jsp"
                >Sản phẩm<i
                  class="fas fa-angle-right"
                  style="margin-left: 5px"
                ></i
              ></a>
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
                        <img
                          src="./assets/img/product/gif.gif"
                          alt=""
                          width="80%"
                        />
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
  <!-- content intro-->
    <div class="content" style="margin-top: 30px">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="page-title">
                        <h1 class="title-head">
                            Giới thiệu
                        </h1>
                    </div>
                    <hr>
                    <div class="content-page">
                      <div class="page-title"> 
                        <p>
                          <span style="text-align: center; font-size: 13px; line-height: 50%;">
                            Góp mặt trên thị trường Việt Nam từ năm 2021, P&T SHOP với định hướng không ngừng phát triển
                            để trở thành một trong những cửa hàng cung cấp các sản
                            phẩm giày đá bóng chính hãng tốt nhất Việt Nam</span>
                        </p>
                      </div> 
                      <div class="tam-nhin">
                        <div class="left">
                        <h2 class="h2-title">
                            <strong>Tầm nhìn</strong>
                        </h2>
                        <p>
                            Tại P&T SHOP, chúng tôi luôn hướng đến việc cải tiến chất lượng
                            trải nghiệm của khách hàng thông qua việc đa dạng hóa các loại sản phẩm,
                            đầu tư nghiên cứu để đưa ra những tư vấn phù hợp với từng khách hàng một
                        </p>
                        <button class="button">Xem thêm</button>
                      </div>
                        <div class="right">
                          <img src="assets\img\logo\4.png" alt="nothing" style="width:400px;height:400px;">
                        </div>
                      </div>
                    <div class="su-menh">
                        <h2 class="h2-title">
                          <strong>II/ Sứ mệnh</strong>
                      </h2>
                      <p>
                          Đặt khách hàng làm trung tâm. Đáp ứng hiệu quả nhất mọi nhu cầu vì lợi ích khách hàng và chất lượng dịch vụ
                          Đặt nhân sự là yếu tố quyết định và là nền tảng của sự phát triển. Không ngừng đào tạo và xây dựng đội ngũ kế thừa.
                          Chia sẽ các quyền lợi với các thành viên trong công ty, cùng xây dựng và phát triển vì mục tiêu chung của công ty.
                      </p>
                        <div class="ctner">
                        <div class="sm-container">
                          <div class="left">
                        <div class="cont-txt">
                          <h3>
                              <strong>1. Trải nghiệm hoàn hảo</strong>
                          </h3>
                          <P>
                              Thông qua việc tư vấn, hỗ trợ khách hàng tận tâm và nhanh nhất có thể. 
                          </P>
                          <button class="button">Xem thêm</button>
                        </div>
                          </div>
                        <div class="right">
                          <img src="assets\img\logo\4.png" alt="nothing" style="float: right;">
                        </div>    
                      </div>
                    
                      <div class="sm-container">
                        <div class="left">
                          <img src="assets\img\logo\4.png" alt="nothing" style="float: left;">
                        </div> 
                        <div class="right">
                          <div class="cont-txt">
                        <h3>
                            <strong>2. Sản phẩm chính hãng</strong>
                        </h3>
                        <P>
                            Sản phẩm được P&T SHOP mua trực tiếp từ công ty và các trang web
                             uy tín của Nike, adidas,
                             Puma v.v… nên các bạn có thể yên tâm về nguồn gốc sản phẩm. 
                        </P>
                        <button class="button">Xem thêm</button>
                        </div>
                      `</div>
                      </div>
                      <div class="sm-container">
                        <div class="left">
                          <div class="cont-txt">
                        <h3>
                            <strong>3. Chế độ dịch vụ</strong>
                        </h3>
                        <P>
                            Những sản phẩm giày đá banh tại P&T SHOP được bảo hành 3 tháng,
                             hỗ trợ trả góp 0% lãi suất qua Fundiin, Freeship toàn quốc
                             khi khách hàng thanh toán chuyển khoản trước, tặng vớ & balo khi mua giày.
                        </P>
                        <button class="button">Xem thêm</button>
                          </div>
                      </div>
                      <div class="right">
                        <img src="assets\img\logo\4.png" alt="nothing" style="float: right;">
                      </div>
                      </div>
                    </div>
                    </div>
                        <h2 class="h2-title">
                            <strong>III/ Cửa hàng của P&T SHOP</strong>
                        </h2>
                        <p> 
                            Bạn có thể gặp chúng tôi ở:
                            <br>
                            <b>P&T SHOP Store I: 86 Đinh Bộ Lĩnh, P. 26 Q. Bình Thạnh, TP. HCM | ĐT: 0123456789</b>
                            <br>
                            <b>P&T SHOP Store II: 26 Đinh Bộ Lĩnh, P. 26 Q. Bình Thạnh, TP. HCM | ĐT: 0123456789</b>
                            <br>
                            
                        </p>
                        <hr>  
                        <p>
                            Thời gian hoạt động của shop: từ 9h tới 21h hàng ngày và cả 7 ngày trong tuần
                            . Rất vui được đón tiếp các bạn.
                            <br>
                            Xin cảm ơn các bạn đã tin tưởng và ủng hộ P&T SHOP.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <!-- end intro-->
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
          <div class="footer_toggle" style="display: flex;justify-content:space-between;cursor: pointer;margin-bottom: 8px;"
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
          <div class="footer_toggle" style="display: flex;justify-content:space-between;cursor: pointer;margin-bottom: 8px;"
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
          <div class="footer_toggle" style="display: flex;justify-content:space-between;cursor: pointer;margin-bottom: 8px;"
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
    <input id="fabCheckbox" type="checkbox" class="fab-checkbox"/>
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
  <script src="./assets/js/jquery-3.6.1.min.js"></script>
  <script src="./assets/js/bootstrap.min.js"></script>
  <script src="./assets/js/main.js"></script>
</body>
</html>