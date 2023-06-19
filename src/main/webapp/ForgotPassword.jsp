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
    <link rel="stylesheet" href="./assets/css/login.css">
    <link rel="stylesheet" href="./assets/css/reponsive1.css">
    <link rel="stylesheet" href="./assets/css/menu-contact.css">
    <link rel="stylesheet" href="./assets/css/forgotpassword.css">
    <link rel="icon" href="./assets/img/logo/main.png" type="image/x-icon">
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

    .registration__form .row .col-sm-12 ul {
        padding-left: 0;
    }

    /* Mobile & tablet  */
    @media (max-width: 1023px) {
        .custom-btn {
            margin: unset;
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

        .show-hide-two {
            top: 56px;
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

        .show-hide-two {
            top: 56px;
        }
    }
</style>

<body>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<!-- forgotpassword form -->
<div class="container">
    <div class="registration__form">
        <div class="row">
            <div class="col-sm-12 col-lg-6">
                <form method="POST" class="form" id="form-1">
                    <div id="content-form">
                        <h3 class="heading">Quên mật khẩu</h3>
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input id="email" name="email" type="text" placeholder="VD: email@domain.com"
                                   class="form-control">
                            <span class="form-message"></span>
                        </div>
                        <button type="submit" class="form-submit btn-blocker" style="border-radius: unset;">Gửi<i
                                class="fas fa-arrow-right" style="font-size: 16px;margin-left: 10px;"></i></button>
                        <p style="font-size: 16px;margin: 10px 0;">Quay trở lại <a href="Login.jsp"
                                                                                   style="color: black; font-weight: bold">
                            Đăng nhập</a></p>
                        <input type="text" id="role" name="role" value="email" style="display: none">
                    </div>
                </form>
            </div>
            <div class="col-sm-12 col-lg-6">
                <h3 class="heading">Bạn ơi đừng lo</h3>
                <p class="text-login">Chúng tôi sẽ giúp bạn lấy lại mật khẩu: </p>
                <ul>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Khi bạn điền vào email đăng kí của mình và nhấn gửi</p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Chúng tôi sẽ gửi ngay một mail mới vào trong email của bạn</p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Lấy mã code trong mail, nhập và đổi lại mật khẩu</p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Đăng nhập trở lại và tiếp tục mua sắm nào!</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- end forgot form -->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/validator.js"></script>
<script src="./assets/js/main.js"></script>
<script>
    Validator({
        form: '#form-1',
        formGroupSelector: '.form-group',
        errorSelector: '.form-message',
        rules: [
            Validator.isRequired('#email'),
            Validator.isEmail('#email'),
            Validator.minLength('#pass1', 6),
            Validator.isRequired('#pass2')
        ],
        onSubmit: function (data) {
            console.log(data);
        }
    });
</script>
<script>
    $("#form-1").on('submit', function (e) {
        e.preventDefault();
        const email = $('#email').val();
        const role = $('#role').val();
        const pass1 = $('#pass1').val();
        const pass2 = $('#pass2').val();
        const code = $('#code').val();
        $.ajax({
            type: 'post',
            url: "ForgotPasswordController",
            data: {
                email: email,
                role: role,
                pass1: pass1,
                pass2: pass2,
                code: code
            },
            success: function (response) {
                if (response.includes("complete"))
                    window.location.href = "Login.jsp"
                else {
                    $("#content-form").html(response);
                }
            }
        });
    })
</script>
</body>

</html>