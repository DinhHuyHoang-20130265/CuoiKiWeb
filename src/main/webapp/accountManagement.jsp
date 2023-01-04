<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
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
    <link rel="stylesheet" href="./assets/css/login.css">
    <link rel="stylesheet" href="./assets/css/account.css">
    <link rel="stylesheet" href="./assets/css/reponsive1.css">
    <link rel="stylesheet" href="./assets/css/menu-contact.css">
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

    .wrapper {
        margin-top: 30px;
    }
</style>
<body>
<%

    //----------------------Kiểm tra thử đăng nhập hay chưa--------------------//
    if (request.getSession().getAttribute("user") == null) {
        // Sendredirect tới login
        response.sendRedirect("Login.jsp");

    } else {
        SiteUser user = (SiteUser) request.getSession().getAttribute("user");
%>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<!-- content -->
<div class="container">
    <div class="wrapper">
        <div class="row">
            <div class="col-4">
                <div class="heading">
                    <img src="<%=UserInformationService.getInstance().getUserInfo(user.getId()).getAvatar_link() != null ? UserInformationService.getInstance().getUserInfo(user.getId()).getAvatar_link() : "./assets/img/product/noavatar.png"%>" alt="" class="heading-img">
                    <span class="heading-name_acc"><%=UserInformationService.getInstance().getUserInfo(user.getId()).getFull_name()%></span>
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
                            <input id="fullname" name="fullname" type="text" placeholder="VD: User1"
                                   class="form-control"
                                   value="User1">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input id="email" name="email" type="text" placeholder="VD: email@domain.com"
                                   class="form-control"
                                   value="abc@gmail.com">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label for="email" class="form-label">Địa chỉ</label>
                            <input id="email" name="email" type="text" placeholder="VD: 86/2/3 Bình Thạnh TP HCM"
                                   class="form-control"
                                   value="86 Đinh Bộ Lĩnh Phường 26 Quận Bình Thạnh TP.HCM">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label for="sdt" class="form-label">Số điện thoại</label>
                            <input id="sdt" name="sdt" type="number" placeholder="VD: 089" class="form-control"
                                   value="0912420530">
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
                        <input id="password" name="password" type="password" placeholder="Nhập mật khẩu"
                               class="form-control">
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
                                        <div class="fa-3x" style="font-size: 1.5em !important;">
                                            <i class="fas fa-spinner fa-spin" style="color: blue;"></i>
                                        </div>
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
                                        <div class="fa-3x" style="font-size: 1.5em !important;">
                                            <i class="fas fa-check"
                                               style="margin-right: 0px !important;color: #006500;"></i>
                                        </div>
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
                                        <div class="fa-3x" style="font-size: 1.5em !important;">
                                            <i class="fa fa-times" aria-hidden="true" style="color: red"></i>
                                        </div>
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
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
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
<!-- end modal -->
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
<%}%>