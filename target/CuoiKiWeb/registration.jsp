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
<!-- registration form -->
<div class="container">
    <div class="registration__form">
        <div class="row">
            <div class="col-sm-12 col-lg-6">
                <form method="POST" class="form" id="form-1">
                    <h3 class="heading">ĐĂNG KÍ</h3>
                    <div class="form-group">
                        <label for="fullname" class="form-label">Tên đầy đủ</label>
                        <input id="fullname" name="fullname" type="text" placeholder="VD: Nguyễn Văn A"
                               class="form-control">
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                        <label for="username" class="form-label">Tên đăng nhập</label>
                        <input id="username" name="username" type="text" placeholder="VD: abc123"
                               class="form-control">
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                        <label for="email" class="form-label">Email</label>
                        <input id="email" name="email" type="text" placeholder="VD: email@domain.com"
                               class="form-control">
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group matkhau">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input id="password" name="password" type="password" placeholder="Nhập mật khẩu"
                               class="form-control">
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group matkhau">
                        <label for="password_confirmation" class="form-label">Nhập lại mật khẩu</label>
                        <input id="password_confirmation" name="password_confirmation" placeholder="Nhập lại mật khẩu"
                               type="password" class="form-control">
                        <span class="form-message"></span>
                    </div>
                    <button class="form-submit btn-blocker" style="border-radius: unset;">Đăng ký <i
                            class="fas fa-arrow-right"
                            style="font-size: 16px;margin-left: 10px;"></i></button>
                    <p style="font-size: 16px;margin: 10px 0;">Bạn đã có tài khoản? <a href="Login.jsp"
                                                                                       style="color: black; font-weight: bold">Đăng
                        nhập</a></p>
                    <input type="text" id="role" name="role" value="register" style="display: none">
                </form>
            </div>
            <div class="col-sm-12 col-lg-6">
                <h3 class="heading">TẠO MỘT TÀI KHOẢN</h3>
                <p class="text-login">Đăng nhập bằng tài khoản sẽ giúp bạn truy cập:</p>
                <ul>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Một lần đăng nhập chung duy nhất để tương tác với các sản phẩm và dịch vụ
                            của P&T
                            shop
                        </p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Thanh toán nhanh hơn</p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Xem lịch sử đặt hàng riêng của bạn</p>
                    </li>
                    <li class="text-login-item"><i class="fas fa-check"></i>
                        <p class="text-login">Thêm hoặc thay đổi tùy chọn email</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- end registration form -->
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
            Validator.isRequired('#fullname', 'Vui lòng nhập tên đầy đủ'),
            Validator.isRequired('#email'),
            Validator.isRequired('#username'),
            Validator.isEmail('#email'),
            Validator.minLength('#password', 6),
            Validator.isRequired('#password_confirmation')
        ],
        onSubmit: function (data) {
            // call api
            console.log(data);
        }
    });
</script>
<script>
    const pass_field = document.querySelector('#password');
    const show_btn = document.querySelector('.fa-eye')
    show_btn.addEventListener("click", function () {
        if (pass_field.type === "password") {
            pass_field.type = "text";
            show_btn.classList.add("hide");
        } else {
            pass_field.type = "password";
            show_btn.classList.remove("hide");
        }
    });
</script>
<script>
    const pass_field2 = document.querySelector('#password_confirmation');
    const show_btn2 = document.querySelector('.fa-eye-2')
    show_btn2.addEventListener("click", function () {
        if (pass_field2.type === "password") {
            pass_field2.type = "text";
            show_btn2.classList.add("hide");
        } else {
            pass_field2.type = "password";
            show_btn2.classList.remove("hide");
        }
    });
</script>
<script>
    $("#form-1").on('submit', function (e) {
        e.preventDefault();
        const fullname = $("#fullname").val();
        const email = $("#email").val();
        const username = $("#username").val();
        const password = $("#password").val();
        const password_confirmation = $("#password_confirmation").val();
        const role = $("#role").val();
        const code = $("#code").val();
        $.ajax({
            type: 'POST',
            url: "SignupController",
            data: {
                fullname : fullname,
                email : email,
                username : username,
                password : password,
                password_confirmation : password_confirmation,
                role : role,
                code : code
            },
            success : function (response) {
                if (response.includes("success"))
                    window.location.href = "http://localhost:8080/CuoiKiWeb_war/Login.jsp"
                else {
                    $("#form-1").html(response);
                }
            }
        });
    })
</script>
</body>

</html>