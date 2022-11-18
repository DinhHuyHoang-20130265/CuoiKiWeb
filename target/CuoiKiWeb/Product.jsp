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
  <link rel="stylesheet" href="./assets/css/product.css">
  <link rel="stylesheet" href="./assets/css/productdetail.css">
  <link rel="stylesheet" href="./assets/css/reponsive1.css">
  <link rel="stylesheet" href="./assets/css/menu-contact.css">
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
            <a href="./Product.html">Sản phẩm <i class="fas fa-plus cong"></i>
              <i class="fas fa-minus tru hidden"></i></a>
            <ul class="ul-has-child1">
              <li class="ng-scope ng-has-child2">
                <a href="./Product.html">Tất cả sản phẩm</a>
              </li>
              <li class="ng-scope ng-has-child2">
                <a href="./Product.html">Đồ Nam
                  <i class="fas fa-plus cong2" onclick="hienthi(2,`abc2`)"></i>
                  <i class="fas fa-minus tru2 hidden" onclick="hienthi(2,`abc2`)"></i></a>
                <ul class="ul-has-child2 hidden" id="abc2">
                  <li class="ng-scope ng-has-child2">
                    <a href="./Product.html">Áo Thun Nam
                      <i class="fas fa-plus cong3" onclick="hienthi(3,`abc3`)"></i>
                      <i class="fas fa-minus tru3 hidden" onclick="hienthi(3,`abc3`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc3">
                      <li class="ng-scope">
                        <a href="./Product.html">Áo Thun Tay Dài Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Áo Thun Polo Nam </a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="./Product.html">Áo Sơ Mi Nam
                      <i class="fas fa-plus cong4" onclick="hienthi(4,`abc4`)"></i>
                      <i class="fas fa-minus tru4 hidden" onclick="hienthi(4,`abc4`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc4">
                      <li class="ng-scope">
                        <a href="./Product.html">Áo Sơ Mi Tay Ngắn Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Áo Sơ Mi Tay Dài Nam </a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="./Product.html">Quần Short Nam
                      <i class="fas fa-plus cong5" onclick="hienthi(5,`abc5`)"></i>
                      <i class="fas fa-minus tru5 hidden" onclick="hienthi(5,`abc5`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc5">
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Short Kaki Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Short Jean Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Short Thun Nam</a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="./Product.html">Quần Dài Nam
                      <i class="fas fa-plus cong6" onclick="hienthi(6,`abc6`)"></i>
                      <i class="fas fa-minus tru6 hidden" onclick="hienthi(6,`abc6`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc6">
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Jean Cá Tính Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Jogger Nam</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Kaki Nam</a>
                      </li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li class="ng-scope ng-has-child2">
                <a href="./Product.html">Đồ Nữ<i class="fas fa-plus cong4" onclick="hienthi(7,`abc7`)"></i>
                  <i class="fas fa-minus tru7 hidden" onclick="hienthi(7,`abc7`)"></i></a>
                <ul class="ul-has-child2 hidden" id="abc7">
                  <li class="ng-scope ng-has-child2">
                    <a href="./Product.html">Áo Thun Nữ
                      <i class="fas fa-plus cong8" onclick="hienthi(8,`abc8`)"></i>
                      <i class="fas fa-minus tru8 hidden" onclick="hienthi(8,`abc8`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc8">
                      <li class="ng-scope">
                        <a href="./Product.html">Áo Thun Tay Ngắn Nữ</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Áo Thun Tay Dài Nữ</a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="./Product.html">Áo Sơ Mi Nữ
                      <i class="fas fa-plus cong9" onclick="hienthi(9,`abc9`)"></i>
                      <i class="fas fa-minus tru9 hidden" onclick="hienthi(9,`abc9`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc9">
                      <li class="ng-scope">
                        <a href="./Product.html">Áo Sơ Mi Tay Ngắn Nữ</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Áo Sơ Mi Tay Dài Nữ</a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="./Product.html">Quần Short Nữ
                      <i class="fas fa-plus cong10" onclick="hienthi(10,`abc10`)"></i>
                      <i class="fas fa-minus tru10 hidden" onclick="hienthi(10,`abc10`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc10">
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Short Kaki Nữ</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Short Jean Nữ</a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope ng-has-child2">
                    <a href="./Product.html">Quần Dài Nữ
                      <i class="fas fa-plus cong11" onclick="hienthi(11,`abc11`)"></i>
                      <i class="fas fa-minus tru11 hidden" onclick="hienthi(11,`abc11`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc11">
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Jogger Nữ</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Jean Đơn Giản Nữ</a>
                      </li>
                      <li class="ng-scope">
                        <a href="./Product.html">Quần Jean Cá Tính Nữ</a>
                      </li>
                    </ul>
                  </li>
                  <li class="ng-scope">
                    <a href="./Product.html">Chân Váy</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./Product.html">Yếm</a>
                  </li>
                </ul>
              </li>
              <li class="ng-scope ng-has-child2">
                <a href="./Product.html">Đồ Unisex<i class="fas fa-plus cong12" onclick="hienthi(12,`abc12`)"></i>
                  <i class="fas fa-minus tru5 hidden" onclick="hienthi(12,`abc12`)"></i></a>
                <ul class="ul-has-child2 hidden" id="abc12">
                  <li class="ng-scope ng-has-child2">
                    <a href="./Product.html">Áo Thun Unisex
                      <i class="fas fa-plus cong13" onclick="hienthi(13,`abc13`)"></i>
                      <i class="fas fa-minus tru13 hidden" onclick="hienthi(13,`abc13`)"></i></a>
                    <ul class="ul-has-child2 hidden" id="abc13">
                      <li class="ng-scope">
                        <a href="./Product.html">Áo Thun Tay Ngắn Unisex</a>
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
            <form class="example" action="./Product.html">
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
            <a href="index.jsp">Trang chủ</a>
          </li>
          <li class="header_nav-list-item">
            <a href="intro.jsp">Giới thiệu</a>
          </li>
          <li class="header_nav-list-item has-mega">
            <a href="./Product.html" class="active">Sản phẩm<i class="fas fa-angle-right"
                style="margin-left: 5px"></i></a>
            <div class="mega-content" style="overflow-x: hidden">
              <div class="row">
                <ul class="col-8 no-padding level0">
                  <li class="level1">
                    <a class="hmega" href="./Product.html">Tất cả sản phẩm</a>
                  </li>
                  <li class="level1">
                    <a class="hmega">Đồ Nam</a>
                    <ul class="level1">
                      <li class="level2">
                        <a href="./Product.html">Áo Thun Nam</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="./Product.html">Áo Thun Tay Dài Nam</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Áo Thun Polo Nam</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="./Product.html">Áo Sơ Mi Nam</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="./Product.html">Áo Sơ Mi Tay Ngắn Nam</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Áo Sơ Mi Tay Dài Nam</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="./Product.html">Quần Short Nam</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="./Product.html">Quần Short Kaki Nam</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Quần Short Jean Nam</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Quần Short Thun Nam</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="./Product.html">Quần Dài Nam</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="./Product.html">Quần Jean Cá Tính Nam</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Quần Jogger Nam</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Quần Kaki Nam</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li class="level1">
                    <a class="hmega">Đồ Nữ</a>
                    <ul class="level1">
                      <li class="level2">
                        <a href="./Product.html">Áo Thun Nữ</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="./Product.html">Áo Thun Tay Ngắn Nữ</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Áo Thun Tay Dài</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="./Product.html">Áo Sơ Mi Nữ</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="./Product.html">Áo Sơ Mi Tay Ngắn Nữ</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Áo Sơ Mi Tay Dài Nữ</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="./Product.html">Quần Short Nữ</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="./Product.html">Quần Short Kaki Nữ</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Quần Short Jean Nữ</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="./Product.html">Quần Dài Nữ</a>
                        <ul class="level2">
                          <li class="level3">
                            <a href="./Product.html">Quần Jogger Nữ</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Quần Jean Đơn Giản Nữ</a>
                          </li>
                          <li class="level3">
                            <a href="./Product.html">Quần Jean Cá Tính Nữ</a>
                          </li>
                        </ul>
                      </li>
                      <li class="level2">
                        <a href="./Product.html">Chân Váy</a>
                      </li>
                      <li class="level2"><a href="./Product.html">Yếm</a></li>
                    </ul>
                  </li>
                  <li class="level1">
                    <a class="hmega">Đồ Unisex</a>
                    <ul class="level1">
                      <li class="level2">
                        <a href="./Product.html">Áo Thun Unisex</a>
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
  <!-- product -->
  <div class="product">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-12 hidden-xs hidden-sm">
          <div class="product__filter">
            <div class="product__filter-price">
              <h4 class="product__filter-heading">
                <h7>-</h7>
                Khoảng giá <i class="fi-rs-minus" id="minus-1"></i> <i class="fi-rs-plus hidden" id="plus-1"></i>
              </h4>
              <ul id="khoanggia" class="product__filter-ckeckbox">
                <li class="product__filter-item">
                  <label class="form-check-label" for="kg0">
                    <input type="radio" class="form-check-input checkGia" id="kg0" name="optradio" value="-1"><span>Tất
                      cả</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="kg1">
                    <input type="radio" class="form-check-input checkGia" id="kg1" name="optradio"
                      value="0-100000"><span>Dưới 100,000đ</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="kg2">
                    <input type="radio" class="form-check-input checkGia" id="kg2" name="optradio"
                      value="100000-200000"><span>100,000đ - 200,000đ</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="kg3">
                    <input type="radio" class="form-check-input checkGia" id="kg3" name="optradio"
                      value="200000-300000"><span>200,000đ - 300,000đ</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="kg4">
                    <input type="radio" class="form-check-input checkGia" id="kg4" name="optradio"
                      value="300000-400000"><span>300,000đ - 400,000đ</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="kg5">
                    <input type="radio" class="form-check-input checkGia" id="kg5" name="optradio"
                      value="400000-100000000"><span>Trên 400,000đ</span>
                  </label>
                </li>
              </ul>
            </div>
            <div class="product__filter-trademark">
              <h4 class="product__filter-heading">
                <h7>-</h7>
                Màu sắc<i class="fi-rs-minus" id="minus-2"></i> <i class="fi-rs-plus hidden" id="plus-2"></i>
              </h4>

              <ul id="color" class="color-box">
                <li class="product__filter-item">
                  <label class="form-check-label" for="th1">
                    <div class="foo black th1"></div>
                    <div class="foo dark_grey"></div>
                    <div class="foo grey"></div>
                    <div class="foo light_blue"></div>
                    <div class="foo blue"></div>
                    <div class="foo dark_blue"></div>
                    <div class="foo dark_green"></div>
                  </label>
                  <label class="form-check-label" for="th1">
                    <div class="foo green"></div>
                    <div class="foo purple"></div>
                    <div class="foo pink"></div>
                    <div class="foo yellow"></div>
                    <div class="foo orange"></div>
                    <div class="foo red"></div>
                    <div class="foo brown"></div>
                  </label>
                </li>
              </ul>
            </div>
            <div class="product__filter-size">
              <h4 class="product__filter-heading">
                <h7>-</h7>
                Kích cỡ <i class="fi-rs-minus" id="minus-3"></i> <i class="fi-rs-plus hidden" id="plus-3"></i>
              </h4>
              <ul id="size" class="product__filter-ckeckbox">
                <li class="product__filter-item">
                  <label class="form-check-label" for="size1">
                    <input type="checkbox" class="form-check-input checksize" id="size1" name="option2"><span>S</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size2">
                    <input type="checkbox" class="form-check-input checksize" id="size2" name="option2"><span>M</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size3">
                    <input type="checkbox" class="form-check-input checksize" id="size3" name="option2"><span>L</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size4">
                    <input type="checkbox" class="form-check-input checksize" id="size4" name="option2"><span>XL</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size5">
                    <input type="checkbox" class="form-check-input checksize" id="size5" name="option2"><span>2XL</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size6">
                    <input type="checkbox" class="form-check-input checksize" id="size6" name="option2"><span>28</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size7">
                    <input type="checkbox" class="form-check-input checksize" id="size7" name="option2"><span>29</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size8">
                    <input type="checkbox" class="form-check-input checksize" id="size8" name="option2"><span>30</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size9">
                    <input type="checkbox" class="form-check-input checksize" id="size9" name="option2"><span>31</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size10">
                    <input type="checkbox" class="form-check-input checksize" id="size10" name="option2"><span>32</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size11">
                    <input type="checkbox" class="form-check-input checksize" id="size11" name="option2"><span>34</span>
                  </label>
                </li>
                <li class="product__filter-item">
                  <label class="form-check-label" for="size12">
                    <input type="checkbox" class="form-check-input checksize" id="size12" name="option2"><span>36</span>
                  </label>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-lg-9 col-12">
          <div class="sort-wrap row">
            <div class="sort-left col-12 col-lg-6">
              <h1 class="coll-name">Tất cả sản phẩm</h1>
            </div>
            <div class="sort-right col-12 col-lg-6">
              <div class="sortby">
                <label for="">Sắp xếp theo:</label>
                <div class="dropdown">
                  <button type="button" class="btn btn-dark dropdown-toggle" id="dropdownMenuButton"
                    data-toggle="dropdown">
                    Sản phẩm nổi bật
                  </button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item isactive" id="sort0">Sản phẩm nổi bật</a>
                    <a class="dropdown-item" id="sort1">Giá: Tăng dần</a>
                    <a class="dropdown-item" id="sort2">Giá: Giảm dần</a>
                    <a class="dropdown-item" id="sort3">Tên A->Z</a>
                    <a class="dropdown-item" id="sort4">Tên Z->A</a>
                    <a class="dropdown-item" id="sort5">Cũ nhất</a>
                    <a class="dropdown-item" id="sort6">Mới nhất</a>
                    <a class="dropdown-item" id="sort7">Bán chạy nhất</a>
                  </div>
                </div>
              </div>
              <div class="sortby2 hidden" style="float: right;">
                <div class="dropdown">
                  <button class="btn btn-dark dropdown-toggle" id="filter">
                    Lọc sản phẩm
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="row row-product" id="products">
          </div>
          <div class="loadmore" id="loadMore">
            <a style="cursor: pointer;" class="loadmore-btn">Tải thêm</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- bộ lọc mobile -->
  <div class="overlay2 hidden"></div>
  <div class="filter-mobile">
    <div class="product__filter">
      <div class="product__filter-price">
        <h4 class="product__filter-heading">
          <h7>-</h7>
          Khoảng giá <i class="fi-rs-minus" id="minus-4"></i> <i class="fi-rs-plus hidden" id="plus-4"></i>
        </h4>
        <ul id="khoanggia1" class="product__filter-ckeckbox">
          <li class="product__filter-item">
            <label class="form-check-label" for="radio1">
              <input type="radio" class="form-check-input checkGia" id="radio1" name="optradio" value="-1"><span>Tất
                cả</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="radio2">
              <input type="radio" class="form-check-input checkGia" id="radio2" name="optradio"
                value="0-100000"><span>Dưới
                100,000đ</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="radio3">
              <input type="radio" class="form-check-input checkGia" id="radio3" name="optradio"
                value="100000-200000"><span>100,000đ -
                200,000đ</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="radio4">
              <input type="radio" class="form-check-input checkGia" id="radio4" name="optradio"
                value="200000-300000"><span>200,000đ -
                300,000đ</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="radio5">
              <input type="radio" class="form-check-input checkGia" id="radio5" name="optradio"
                value="300000-400000"><span>300,000đ -
                400,000đ</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="radio6">
              <input type="radio" class="form-check-input checkGia" id="radio6" name="optradio"
                value="400000-10000000"><span>Trên
                400,000đ</span>
            </label>
          </li>
        </ul>
      </div>
      <div class="product__filter-trademark">
        <h4 class="product__filter-heading">
          <h7>-</h7>
          Màu sắc<i class="fi-rs-minus" id="minus-2"></i> <i class="fi-rs-plus hidden" id="plus-2"></i>
        </h4>

        <ul id="color" class="color-box">
          <li class="product__filter-item">
            <label class="form-check-label" for="th1">
              <div type="button" class="foo black"></div>
              <div class="foo dark_grey"></div>
              <div class="foo grey"></div>
              <div class="foo light_blue"></div>
              <div class="foo blue"></div>
              <div class="foo dark_blue"></div>
              <div class="foo dark_green"></div>
            </label>
            <label class="form-check-label" for="th1">
              <div class="foo green"></div>
              <div class="foo purple"></div>
              <div class="foo pink"></div>
              <div class="foo yellow"></div>
              <div class="foo orange"></div>
              <div class="foo red"></div>
              <div class="foo brown"></div>
            </label>
          </li>
        </ul>
      </div>
      <div class="product__filter-size">
        <h4 class="product__filter-heading">
          <h7>-</h7>
          Kích cỡ <i class="fi-rs-minus" id="minus-6"></i> <i class="fi-rs-plus hidden" id="plus-6"></i>
        </h4>
        <ul id="size" class="product__filter-ckeckbox">
          <li class="product__filter-item">
            <label class="form-check-label" for="check1">
              <input type="checkbox" class="form-check-input checksize" id="check1" name="option2"><span>S</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check2">
              <input type="checkbox" class="form-check-input checksize" id="check2" name="option2"><span>M</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check3">
              <input type="checkbox" class="form-check-input checksize" id="check3" name="option2"><span>L</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check4">
              <input type="checkbox" class="form-check-input checksize" id="check4" name="option2"><span>XL</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check5">
              <input type="checkbox" class="form-check-input checksize" id="check5" name="option2"><span>2XL</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check6">
              <input type="checkbox" class="form-check-input checksize" id="check6" name="option2"><span>28</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check7">
              <input type="checkbox" class="form-check-input checksize" id="check7" name="option2"><span>29</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check8">
              <input type="checkbox" class="form-check-input checksize" id="check8" name="option2"><span>30</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check9">
              <input type="checkbox" class="form-check-input checksize" id="check9" name="option2"><span>31</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check10">
              <input type="checkbox" class="form-check-input checksize" id="check10" name="option2"><span>32</span>
            </label>
          </li>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check11">
              <input type="checkbox" class="form-check-input checksize" id="check1" name="option2"><span>34</span>
            </label>
          </li>
          <li class="product__filter-item">
            <label class="form-check-label" for="check12">
              <input type="checkbox" class="form-check-input checksize" id="check12" name="option2"><span>36</span>
            </label>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <!-- end bộ lộc mobile -->
  <!-- end product -->
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
                  xoriginal="./assets/imgProduct/images/men/1.jpg" />
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
  </div>
  <!-- end modal -->
  <script src="./assets/js/jquery-3.6.1.min.js"></script>
  <script src="./assets/js/bootstrap.bundle.min.js"></script>
  <script src="./assets/js/main.js"></script>
  <script src="./assets/js/product.js"></script>
  <script src="./assets/js/productlist.json"></script>
  <script src="./assets/js/generateProduct.js"></script>
</body>

</html>