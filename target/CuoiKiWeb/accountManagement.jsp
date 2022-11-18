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
  <link rel="stylesheet" href="./assets/css/account.css">
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
  .wrapper {
    margin-top:30px;
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
            <div class="_body">Xin Chào<br/>User1</div>
          </div>
        </a>
      </div>
        <ul class="ul-first-menu">
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
              <ul class="nav nav__first right">
                <li class="nav-item nav-item__first nav-item__first-user">
                  <img src="./assets/img/product/noavatar.png" alt="" class="nav-item__first-img">
                  <span class="nav-item__first-name">User1</span>
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
              </ul>
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
  <!-- content -->
  <div class="container">
    <div class="wrapper">
      <div class="row">
        <div class="col-4">
          <div class="heading">
            <img src="./assets/img/product/noavatar.png" alt="" class="heading-img">
            <span class="heading-name_acc">User1</span>
          </div>
          <div class="menu-manager">
            <div class="my-profile" onclick="hienThiDoiThongTin()">
              <div class="my-profile-title">
                <div class="my-profile-icon"><i class="fas fa-user"></i></div>
                <div class="my-profile-name">Hồ sơ của tôi</div>
              </div>
            </div>
            <div class="my-order" onclick="hienThiDonHang()">
              <div class="my-order-title active">
                <div class="my-order-icon"><i class="fas fa-shopping-bag"></i></div>
                <div class="my-order-name">Đơn hàng của tôi</div>
              </div>
            </div>
            <div class="my-password" onclick="hienThiDoiMatKhau()">
              <div class="my-password-title">
                <div class="my-password-icon"><i class="fas fa-key"></i></div>
                <div class="my-password-name">Đổi mật khẩu</div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-8">
          <div class="detial__my-profile undisplay">
            <div class="heading-edit-account">
              <h2>Hồ sơ của tôi</h2>
              <div class="form-group">
                <label for="fullname" class="form-label">Tên đầy đủ</label>
                <input id="fullname" name="fullname" type="text" placeholder="VD: User1" class="form-control"
                  value="User1">
                <span class="form-message"></span>
              </div>
              <div class="form-group">
                <label for="email" class="form-label">Email</label>
                <input id="email" name="email" type="text" placeholder="VD: email@domain.com" class="form-control"
                  value="abc@gmail.com">
                <span class="form-message"></span>
              </div>
              <div class="form-group">
                <label for="email" class="form-label">Địa chỉ</label>
                <input id="email" name="email" type="text" placeholder="VD: 86/2/3 Bình Thạnh TP HCM" class="form-control"
                  value="86 Đinh Bộ Lĩnh Phường 26 Quận Bình Thạnh TP.HCM">
                <span class="form-message"></span>
              </div>
              <div class="form-group">
                <label for="sdt" class="form-label">Số điện thoại</label>
                <input id="sdt" name="sdt" type="number" placeholder="VD: 089" class="form-control" value="0912420530">
                <span class="form-message"></span>
              </div>
              <div class="form-group">
                <label for="avatar" class="form-label">Cập nhật ảnh đại diện</label>
                <input id="avatar" name="avatar" type="file" class="form-control">
                <span class="form-message"></span>
              </div>
              <button class="form-submit">Lưu</button>
            </div>
          </div>
          <div class="detail__confirm-password undisplay">
            <div class="heading-edit-password">
              <h2>Đổi lại mật khẩu</h2>
            </div>
            <div class="form-group form-group-old-password">
              <div style="display:flex;justify-content: space-between;">
                <label for="password" class="form-label">Mật khẩu cũ</label>
              </div>
              <input id="password" name="password" type="password" placeholder="Nhập mật khẩu" class="form-control">
              <span class="form-message"></span>
            </div>
            <div class="form-group form-group-new-password">
              <div style="display:flex;justify-content: space-between;">
                <label for="password-new" class="form-label">Mật khẩu mới</label>
              </div>
              <input id="password-new" name="password-new" type="password" placeholder="Nhập mật khẩu"
                class="form-control">
              <span class="form-message"></span>
            </div>
            <div class="form-group form-group-confirm-password">
              <div style="display:flex;justify-content: space-between;">
                <label for="password-confirm" class="form-label">Mật khẩu mới</label>
              </div>
              <input id="password-confirm" name="password-confirm" type="password" placeholder="Nhập mật khẩu"
                class="form-control">
              <span class="form-message"></span>
            </div>
            <button class="form-submit">Lưu</button>
          </div>
          <div class="detail__my-order">
            <div class="heading-edit-password">
              <h2>Đơn hàng của bạn</h2>
            </div>
            <div class="detail__my-order-content">
              <form action="">
                <div class="my-order-heading">
                  <div class="row">
                    <div class="col-2">MĐH</div>
                    <div class="col-3">Ngày</div>
                    <div class="col-3">Tổng tiền</div>
                    <div class="col-2">Trạng thái</div>
                    <div class="col-2">Chi tiết</div>
                  </div>
                </div>
                <div class="my-order-body">
                  <div class="row bd-bottom">
                    <div class="col-2">#1</div>
                    <div class="col-3">05-06-2021</div>
                    <div class="col-3">3.000.000 VNĐ</div>
                    <div class="col-2">
                      <span class="btn-stt blue">Đang xác nhận</span>
                    </div>
                    <div class="col-2">
                      <a href="" data-toggle="modal" data-target="#myModal">Xem</a>
                    </div>
                  </div>
                  <div class="row bd-bottom">
                    <div class="col-2">#2</div>
                    <div class="col-3">05-06-2021</div>
                    <div class="col-3">3.000.000 VNĐ</div>
                    <div class="col-2">
                      <span class="btn-stt green">Đã giao</span>
                    </div>
                    <div class="col-2">
                      <a href="">Xem</a>
                    </div>
                  </div>
                  <div class="row bd-bottom">
                    <div class="col-2">#3</div>
                    <div class="col-3">05-06-2021</div>
                    <div class="col-3">3.000.000 VNĐ</div>
                    <div class="col-2">
                      <span class="btn-stt red">Đã hủy</span>
                    </div>
                    <div class="col-2">
                      <a href="">Xem</a>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- end content -->
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
    <a href="" class="btn-gototop"><i class="fas fa-arrow-up"></i></a>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title">Chi tiết đơn hàng</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="margin-top:10px">
          <div class="body-one">
            <div>Tổng tiền: <p>840.000 VNĐ</p></div>
            <div>Giá đã giảm: <p>1.000.000 VNĐ</p></div>
            <div>Phí ship:<p>30.000 VNĐ</p></div>
            <div>Thành Tiền: <p>870.000 VNĐ</p></div>
          </div>
          <form action="">
            <div class="my-order-heading">
              <div class="row" style="text-align:center">
                <div class="col-4">Sản phẩm</div>
                <div class="col-1">SL</div>
                <div class="col-3">Giá</div>
                <div class="col-1">Giảm</div>
                <div class="col-3">Tổng</div>
              </div>
            </div>
            <div class="body-two">
              <div class="row" style="text-align:center; margin-top:10px">
                <div class="col-4" style="display: flex;">
                  <a href=""><img src="./assets/imgProduct/images/men/1.jpg" alt=""
                      style="width: 50px;height: 70px;margin-right: 5px;"></a>
                  <h5>Áo len sọc lớn màu</h5>
                </div>
                <div class="col-1">1</div>
                <div class="col-3">420.000 VNĐ</div>
                <div class="col-1">20%</div>
                <div class="col-3">420.000 VNĐ</div>
              </div>
            </div>
            <div class="body-two">
              <div class="row" style="text-align:center; margin-top:10px">
                <div class="col-4" style="display: flex;">
                  <a href=""><img src="./assets/imgProduct/images/men/2.jpg" alt=""
                      style="width: 50px;height: 70px;margin-right: 5px;"></a>
                  <h5>Áo len sọc phối màu</h5>
                </div>
                <div class="col-1">1</div>
                <div class="col-3">420.000 VNĐ</div>
                <div class="col-1">20%</div>
                <div class="col-3">420.000 VNĐ</div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
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
  <script>
    function hienThiDoiMatKhau() {
      $(".detail__confirm-password").removeClass("undisplay");
      $(".detail__confirm-password").addClass("display");
      $(".my-password-title").addClass("active");
      $(".my-profile-title").removeClass("active");
      $(".my-order-title").removeClass("active");
      $(".detial__my-profile").addClass("undisplay");
      $(".detial__my-profile").removeClass("display");
    }
    function hienThiDoiThongTin() {
      $(".detial__my-profile").removeClass("undisplay");
      $(".detial__my-profile").addClass("display");
      $(".my-profile-title").addClass("active");
      $(".my-password-title").removeClass("active");
      $(".my-order-title").removeClass("active");
      $(".detail__confirm-password").addClass("undisplay");
      $(".detail__confirm-password").removeClass("display");
    }
    function hienThiDonHang() {
      $(".detial__my-profile").addClass("undisplay");
      $(".detial__my-profile").removeClass("display");
      $(".my-profile-title").removeClass("active");
      $(".my-password-title").removeClass("active");
      $(".detail__confirm-password").addClass("undisplay");
      $(".detail__confirm-password").removeClass("display");
      $(".my-order-title").addClass("active");
    }
  </script>
</body>

</html>