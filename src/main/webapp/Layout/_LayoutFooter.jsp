<%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 11/27/2022
  Time: 11:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <p>
                            <i class="fas fa-phone-square-alt footer__item-icon"></i>
                            Số điện thoại: <a href="tel:0123456789">0123456789</a>
                        </p>
                    </li>
                    <li class="footer__item">
                        <p><i class="fas fa-envelope-square footer__item-icon"></i> Email: <a
                                href="mailto:pntshopnlu@gmail.com">pntshopnlu@gmail.com</a></p>
                    </li>
                    <li>
                        <a href=""><i class="fab fa-facebook" style="font-size: 24px; margin-right: 10px"></i></a>
                        <a href=""><i class="fab fa-instagram"
                                      style="font-size: 24px; margin-right: 10px;color: pink;"></i></a>
                        <a href=""><i class="fab fa-youtube"
                                      style="font-size: 24px; margin-right: 10px;color: red;"></i></a>
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
                        <a href="index.jsp" class="footer__item--link">Trang chủ</a>
                    <li class="footer__item">
                        <a href="intro.jsp" class="footer__item--link">Giới thiệu</a>
                    </li>
                    <li class="footer__item">
                        <a href="Product.jsp" class="footer__item--link">Sản phẩm</a>
                    </li>
                    <li class="footer__item">
                        <a href="news.jsp" class="footer__item--link">Tin tức</a>
                    </li>
                    <li class="footer__item">
                        <a href="contact.jsp" class="footer__item--link">Liên hệ</a>
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
        <a href="contact.jsp" class="fab-action fab-action-3">
            <i class="far fa-comment-dots"></i>
        </a>
        <a href="#" class="fab-action fab-action-4">
            <i class="fab fa-github"></i>
        </a>
    </div>
</div>
<!--end contact menu-->