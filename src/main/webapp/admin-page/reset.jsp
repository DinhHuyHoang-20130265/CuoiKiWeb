<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">
<%
    //  Nếu như đã đăng nhập rồi thì sẽ không thể tới trang này foward tới controller điều hướng index
    if (request.getSession().getAttribute("userAdmin") != null) {
        response.sendRedirect("index.jsp");
    }
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> Quên mật khẩu</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
    <link rel="stylesheet" href="css/vendor.css">
    <!-- Theme initialization -->
    <script>
        const themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
            {};
        const themeName = themeSettings.themeName || '';
        if (themeName) {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app-' + themeName + '.css">');
        } else {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app.css">');
        }
    </script>
</head>
<body>
<div class="auth">
    <div class="auth-container">
        <div class="card">
            <header class="auth-header">
                <h1 class="auth-title">
                    <div class="logo">
                        <span class="l l1"></span>
                        <span class="l l2"></span>
                        <span class="l l3"></span>
                        <span class="l l4"></span>
                        <span class="l l5"></span>
                    </div>
                    Trang Quản Lý
                </h1>
            </header>
            <div class="auth-content">
                <p class="text-center">Đặt lại mật khẩu</p>
                <p class="text-muted text-center">
                    <small>Bạn cần hoàn thành các bước để đặt lại mật khẩu</small>
                </p>
                <form id="reset-form-reset" method="POST">
                    <div class="form-group">
                        <label for="email">Nhập Email của bạn</label>
                        <input type="email" class="form-control underlined" name="email" id="email"
                               placeholder="Email của bạn" required>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-block btn-primary">Đặt lại</button>
                    </div>
                    <div class="form-group clearfix">
                        <a class="pull-left" href="login.jsp">Quay lại đăng nhập</a>
                    </div>
                    <input type="text" id="role" name="role" value="email" style="display: none">
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Reference block for JS -->
<div class="ref" id="ref">
    <div class="color-primary"></div>
    <div class="chart">
        <div class="color-primary"></div>
        <div class="color-secondary"></div>
    </div>
</div>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
    ga('create', 'UA-80463319-4', 'auto');
    ga('send', 'pageview');
</script>
<script src="../assets/js/jquery-3.6.1.min.js"></script>
<script src="../assets/js/bootstrap.js"></script>
<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
<script>
    $("#reset-form-reset").on('submit', function (e) {
        e.preventDefault();
        const email = $("#email").val();
        const code = $("#code").val();
        const pass1 = $("#pass1").val();
        const pass2 = $("#pass2").val();
        const role = $("#role").val();
        $.ajax({
            type: 'POST',
            url: "../ForgotPasswordAdminController",
            data: {
                email: email,
                code: code,
                pass1: pass1,
                pass2: pass2,
                role: role
            },
            success: function (response) {
                if (response.includes("complete"))
                    window.location.href = "../admin-page/login.jsp"
                else {
                    $("#reset-form-reset").html(response);
                }
            }
        })
    })
</script>
</body>
</html>