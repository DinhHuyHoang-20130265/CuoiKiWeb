<%@ page import="vn.edu.hcmuaf.fit.beans.ForgotPasswordStatus" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
    //  Nếu như đã đăng nhập rồi thì sẽ không thể tới trang này foward tới index
    if (request.getSession().getAttribute("user") != null) {
        response.sendRedirect("index.jsp");
    }
%>
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
    <link rel="stylesheet" href="./assets/css/reponsive1.css">
    <link rel="stylesheet" href="./assets/css/login.css">
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

    .login__form .row .col-sm-12 ul {
        padding-left: 0;
    }

    /* Mobile & tablet  */
    @media (max-width: 1023px) {
        .custom-btn {
            margin: unset;
        }
    }

    @media (min-width: 1200px) {
        #twitter {
            display: flex;
            width: auto;
            height: 68px;
            margin-right: 51px;
        }
    }

    @media (max-width: 1199px) {
        .form-submit-social:first-child {
            margin-right: 30px;
        }

        .form-submit-social--img {
            margin-left: 28px;
        }

        #twitter {
            display: flex;
            width: auto;
            height: 68px;
            margin-right: 45px;
        }
    }

    /* tablet */
    @media (min-width: 740px) and (max-width: 1023px) {
        .btn-blocker {
            display: block;
            width: 100%;
        }

        .show-hide {
            top: 56px;
        }

        #twitter {
            margin-right: 0;
        }
    }

    /* mobile */
    @media (max-width: 739px) {
        .btn-blocker {
            display: block;
            width: 100%;
        }

        .show-hide {
            top: 56px;
        }
    }
</style>

<body>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<!-- login form -->
<div class="container">
    <div class="login__form">
        <div class="row">
            <div class="col-sm-12 col-lg-6">
                <form action="LoginUserController" method="post" class="form" id="form-2">
                    <h3 class="heading">ĐĂNG NHẬP</h3>
                    <a href="ForgotPassword.jsp" class="form__forgot-password">Bạn quên mật khẩu?</a>
                    <div class="form-group">
                        <label for="username" class="form-label">Tài khoản</label>
                        <input id="username" name="username" type="text" placeholder="VD: abcdef"
                               class="form-control">
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group matkhau">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input id="password" name="password" type="password" placeholder="Nhập mật khẩu"
                               class="form-control">
                        <span class="form-message"></span>
                    </div>
                    <%ForgotPasswordStatus string = (ForgotPasswordStatus) request.getSession().getAttribute("forgotPassword");%>
                    <%String success = (String) request.getSession().getAttribute("success");%>
                    <h5 style="text-align:left; color: green; font-size: 16px;">
                        <%if (string != null && string.isComplete()) {%>
                        <i class="fa fa-check" aria-hidden="true" style="color: green; font-size: 16px"></i>
                        Chúc mừng bạn dã đổi mật khẩu thành công, mời bạn đăng nhập
                        <%} else if (success != null) {%>
                        <i class="fa fa-check" aria-hidden="true" style="color: green; font-size: 16px"></i>
                        Chúc mừng bạn dã đăng ký tài khoản thành công, mời bạn đăng nhập
                        <%}%>
                    </h5>
                    <% String status = (String) request.getAttribute("loginStatus");%>
                    <h5 style="text-align:left; color: red;">
                        <%= status == null ? "" : status%>
                    </h5>
                    <button type="submit" class="form-submit" style="border-radius: unset;">ĐĂNG NHẬP <i
                            class="fas fa-arrow-right"
                            style="font-size: 16px;margin-left: 10px;"></i></button>
                    <h4>HOẶC ĐĂNG NHẬP BẰNG</h4>
                    <div class="form-social">
                        <a href="https://www.facebook.com/dialog/oauth?client_id=2000376943622419&redirect_uri=https://redirectmeto.com/https://localhost:8443/CuoiKiWeb_war/login-facebook"
                           class="form-submit-social btn-blocker" id="facebook-login">
                            <span>Facebook</span>
                            <img src="./assets/icon/facebook.svg" alt="" class="form-submit-social--img">
                        </a>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=profile+email&redirect_uri=https://redirectmeto.com/https://localhost:8443/CuoiKiWeb_war/login-google&response_type=code
                        &client_id=910519969681-toe1jki11dlo6blotqtm47npbu31t6rd.apps.googleusercontent.com&approval_prompt=force"
                           class="form-submit-social btn-blocker">
                            <span>GOOGLE</span>
                            <img src="./assets/icon/google.svg" alt="" class="form-submit-social--img">
                        </a>
                    </div>
                </form>
            </div>
            <div class="col-sm-12 col-lg-6">
                <h3 class="heading">TẠO MỘT TÀI KHOẢN</h3>
                <p class="text-login">Thật dễ dàng tạo một tài khoản. Hãy nhập địa chỉ email của bạn và điền vào mẫu
                    trên
                    trang tiếp theo và tận hưởng những lợi ích của việc sở hữu một tài khoản :</p>
                <ul>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Tổng quan đơn giản về thông tin cá nhân của bạn</p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Thanh toán nhanh hơn</p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Ưu đãi và khuyến mãi độc quyền</p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Các sản phẩm mới nhất</p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Các bộ sưu tập giới hạn và bộ sưu tập theo mùa mới</p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Các sự kiện sắp tới</p>
                    </li>
                </ul>
                <a href="registration.jsp">
                    <button class="form-submit btn-blocker custom-btn" style="border-radius: unset;margin:unset">ĐĂNG KÍ
                        <i class="fas fa-arrow-right" style="font-size: 16px;margin-left: 10px;"></i></button>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- end login form -->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/validator.js"></script>
<script src="./assets/js/main.js"></script>
<script>
    Validator({
        form: '#form-2',
        formGroupSelector: '.form-group',
        errorSelector: '.form-message',
        rules: [
            Validator.isRequired('#username'),
            Validator.isRequired('#password'),
            Validator.minLength('#password', 8)
        ]
    });
</script>
</body>

</html>