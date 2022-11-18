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
  <link rel="stylesheet" href="./assets/css/newDetail.css">
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
    word-wrap: break-word;
    text-align: center;
  }
  .content-page p img{
   width: auto;
   height: auto;
   max-width: 100%;
    vertical-align: middle;
    height: initial !important;
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
              <a href="index.jsp" class="active">Trang chủ</a>
            </li>
            <li class="header_nav-list-item">
              <a href="intro.jsp">Giới thiệu</a>
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
    <div class="content" style="margin-top: 30px">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="page-title">
                        <h1 class="title-head" style="font-size: 30px">
                           <strong> Nike Mercurial Vapor 14 theo phong cách của Nike Jordan 1 sẽ trông như nào?</strong>
                        </h1>
                    </div>
                    <div class="content-page">
                        <span class="time" style="font-size: 18px; color: #999;"><i class="far fa-clock" style="margin-right: 10px;"></i>13/11/2021</span>
                        <p>
                            Mới đây Footpack và Soub đã hợp tác với nhau để tạo ra một phiên bản Nike Mercurial Vapor 14 được tùy chỉnh đặc biệt, lấy cảm hứng từ một
                             trong những đôi giày yêu thích của tiền đạo người Pháp Marcus Thuram,
                              đôi Jordan 1 Travis Scott x Fragment.
                        </p>
                        <p>
                            <img src="./assets/img/product/new4.jpg" alt="">
                        </p>
                        <P>
                            Tiền đạo của Borussia Mönchengladbach là một fan cứng của những đôi giày thể thao đặc biệt là dòng sản phẩm Nike Jordan, cũng vì lý do đó mà khi thương hiệu footpack của Pháp đề nghị sẽ "custom" cho Marcus một đôi Nike Mercurial Vapors 14, thì đôi Jordan 1 Travis Scott x Fragment,
                             đã được chọn để trở thành nguồn cảm hứng cho phiên bản "custom" này, được tạo ra bởi nghệ sĩ thiết kế Soub.
                        </P>
                        <p>
                            <img src="./assets/img/product/new5.jpg" alt="">
                        </p>
                        <P>
                            Nike Mercurial Travis Scott có tone màu chủ đạo toàn màu trắng và phủ lên nó
                             các tấm hình khối màu xanh tương đồng với Jordan 1 Travis Scott x Fragment.
                              Dấu Swoosh lớn màu đen ở mặt ngoài với một chữ ký của Travis Scott - phía má trong là dấu Swoosh nhỏ hơn
                             kiểu setup giống với bản phối "Recharge" được Nike cho ra mắt gần đây. 
                        </P>
                        <p>
                            <img src="./assets/img/product/new6.jpg" alt="">
                        </p>
                        <p>
                            <img src="./assets/img/product/new7.jpg" alt="">
                        </p>
                        <p>
                            Ở trung tâm phần gót giày, dòng "Marcus Jack" được thiết kế khá "nguệch ngoạc",
                             có lẽ để tạo dấu hiệu đặc trưng cho đôi giày.
                             Đặt bên cạnh là logo của footpack ở mặt ngoài và logo Joaquim Soub ở mặt bên trong.
                        </p>
                        <p>
                            <img src="./assets/img/product/new8.jpg" alt="">
                        </p>
                        <p>
                            Theo dõi blog của P&T SHOP để biết được những thông tin mới nhất về
                             những đôi giày bóng đá chính hãng đã và sắp có mặt trên thị trường toàn thế giới nhé.
                            Ngoài ra các bạn có thể tham khảo thêm những đôi giày bóng đá chính hãng phiên bản
                            dành cho mặt sân cỏ nhân tạo và Futsal tại <a href="">đây</a>.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- comment -->
    <div class="container">
      <div class="col-md-12" id="fbcomment">
        <div class="header_comment">
          <div class="row">
            <div class="col-md-6 text-left">
              <span class="count_comment">30 bình luận</span>
            </div>
            <div class="col-md-6 text-right">
              <span class="sort_title">Sắp xếp theo</span>
              <select class="sort_by">
              <option>Mới nhất</option>
              <option>Cũ nhất</option>
              </select>
            </div>
          </div>
        </div>
  
        <div class="body_comment">
          <div class="row">
            <div class="avatar_comment col-md-1">
              <img src="./assets/imgNews/news/avatar.jpg" alt="avatar"/>
            </div>
            <div class="box_comment col-md-11">
              <textarea class="commentar" placeholder="Viết bình luận..."></textarea>
              <div class="box_post">
              <div class="pull-left">
                <input type="checkbox" id="post_fb"/>
                <label for="post_fb">Đăng lên facebook</label>
              </div>
              <div class="pull-right">
                <span>
                <img src="./assets/imgNews/news/avatar.jpg" alt="avatar" />
                <i class="fa fa-caret-down"></i>
                </span>
                <button onclick="submit_comment()" type="button" value="1">Đăng</button>
              </div>
              </div>
            </div>
          </div>
          <div class="row">
            <ul id="list_comment" class="col-md-12">
              <!-- Start List Comment 1 -->
              <li class="box_result row">
                <div class="avatar_comment col-md-1">
                  <img src="./assets/imgNews/news/avatar.jpg" alt="avatar"/>
                </div>
                <div class="result_comment col-md-11">
                  <h4>Nguyễn Huy Hiệp</h4>
                  <p>Đôi giày này thật tuyệt vời, tôi sẽ mua 2 đôi để tặng bạn thân nhất nhân dịp sinh nhật sắp tới của bạn tôi</p>
                  <div class="tools_comment">
                    <a class="like" href="#">Thích</a>
                    <span aria-hidden="true"> · </span>
                    <a class="replay" href="#">Phản hồi</a>
                    <span aria-hidden="true"> · </span>
                    <i class="fa fa-thumbs-o-up"></i> <span class="count">1</span> 
                    <span aria-hidden="true"> · </span>
                    <span>26m</span>
                  </div>
                  <ul class="child_replay">
                    <li class="box_reply row">
                      <div class="avatar_comment col-md-1">
                        <img src="./assets/imgNews/news/avatar.jpg" alt="avatar"/>
                      </div>
                       <div class="result_comment col-md-11">
                        <h4>Nguyễn Minh Hiếu</h4>
                        <p>Rất ủng hộ bạn, tôi cũng vừa tặng cho đứa bạn tôi 1 đôi, nó cực kỳ thích luôn</p>
                        <div class="tools_comment">
                          <a class="like" href="#">Thích</a>
                          <span aria-hidden="true"> · </span>
                          <a class="replay" href="#">Phản hồi</a>
                          <span aria-hidden="true"> · </span>
                          <i class="fa fa-thumbs-o-up"></i> <span class="count">1</span> 
                          <span aria-hidden="true"> · </span>
                          <span>5m</span>
                        </div>
                        <ul class="child_replay"></ul>
                      </div>
                    </li>
                  </ul>
                </div>
              </li>
               <!-- Start List Comment 2 -->
               <li class="box_result row">
                <div class="avatar_comment col-md-1">
                  <img src="./assets/imgNews/news/avatar.jpg" alt="avatar"/>
                </div>
                <div class="result_comment col-md-11">
                  <h4>Đinh Huy Hoàng</h4>
                  <p>Tuyệt vời</p>
                  <div class="tools_comment">
                    <a class="like" href="#">Thích</a>
                    <span aria-hidden="true"> · </span>
                    <a class="replay" href="#">Phản hồi</a>
                    <span aria-hidden="true"> · </span>
                    <i class="fa fa-thumbs-o-up"></i> <span class="count">1</span> 
                    <span aria-hidden="true"> · </span>
                    <span>26m</span>
                  </div>
                  <ul class="child_replay"></ul>
                </div>
              </li>
            </ul>
          <button class="show_more" type="button">Tải thêm 10 bình luận</button>
          </div>
        </div>
      </div>
    </div>
    <!-- comment -->
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