<%@ page import="vn.edu.hcmuaf.fit.beans.RememberAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminLogin" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.ReCAPTCHAConfiguration" %>
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
    <title> Đăng nhập </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->
    <link rel="stylesheet" href="css/vendor.css">
    <!-- Theme initialization -->
    <script>
        var themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
            {};
        var themeName = themeSettings.themeName || '';
        if (themeName) {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app-' + themeName + '.css">');
        } else {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app.css">');
        }
    </script>
</head>
<body>
<%
    //  Lấy loginAdmin, nếu như có tồn tại thì lấy các thuộc tính cần thiết
    AdminLogin loginAdmin = (AdminLogin) request.getSession().getAttribute("loginAdmin");
    //  Lấy remember account, để làm những việc cần thiết
    RememberAccount rememberAccount = (RememberAccount) request.getSession().getAttribute("rememberAccount");

%>
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
                <p class="text-center">Đăng nhập để tiếp tục</p>
                <form id="login-form" action="/CuoiKiWeb_war/LoginAdminController" method="GET" novalidate="">
                    <div class="form-group">
                        <label for="username">Tên tài khoản</label>
                        <input type="username" class="form-control underlined" name="username" id="username"
                               placeholder="Tên đăng nhập" required
                            <% if(loginAdmin != null){%>
                               value="<%=loginAdmin.getAccount()%>"
                            <%} else if(rememberAccount != null){%>
                               value="<%=rememberAccount.getAccount()%>"
                            <%}%>
                        ></div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input type="password" class="form-control underlined" name="password" id="password"
                               placeholder="Mật khẩu của bạn" required
                            <% if(rememberAccount != null){%>
                               value="<%=rememberAccount.getPassword()%>"
                            <%}%>
                        ></div>
                    <div class="form-group">
                        <%if (loginAdmin != null) {%>
                        <h5 style="text-align: center; color:red" class="error"><%=loginAdmin.getContent()%>
                        </h5>
                        <%}%>
                        <div class="col-md-6 g-recaptcha" data-callback="recaptchaCallback"
                             data-sitekey="<%=ReCAPTCHAConfiguration.SITE_KEY%>">
                        </div>
                        <label for="remember">
                            <input class="checkbox" id="remember" type="checkbox"
                                <%if(loginAdmin!= null && loginAdmin.getRemember() != null
                                && loginAdmin.getRemember().equals("on")){%>
                                   checked
                                <%} else if(rememberAccount != null){%>
                                   checked
                                <%}%>
                            >
                            <span>Giữ đăng nhập trên thiết bị này</span>
                        </label>
                        <a href="reset.jsp" class="forgot-btn pull-right">Quên mật khẩu?</a>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-block btn-primary">Đăng nhập</button>
                    </div>
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
<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
<script src="https://www.google.com/recaptcha/api.js?hl=en"></script>

</body>
</html>