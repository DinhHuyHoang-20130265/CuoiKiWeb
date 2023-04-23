<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.services.StaticAnalyzeService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> Trang Quản Lý </title>
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

    //----------------------Kiểm tra thử đăng nhập hay chưa--------------------//
    if (request.getSession().getAttribute("userAdmin") == null) {
        // Sendredirect tới login
        response.sendRedirect("login.jsp");

    } else {
        AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
%>
<div class="main-wrapper">
    <div class="app" id="app">
        <jsp:include page="Layout/_LayoutAdminHeader.jsp"></jsp:include>
        <jsp:include page="Layout/_LayoutAdminSideBar.jsp"></jsp:include>
        <article class="content static-tables-page">
            <div class="title-block">
                <h1 class="title"> Bảng thống kê </h1>
            </div>
            <section class="section">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title-block">
                                    <h3 class="title"> Sản phẩm được xem nhiều nhất </h3>
                                </div>
                                <section class="example">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Lượt xem</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            List<Map<String, Object>> list = StaticAnalyzeService.getInstance().MostSeen();
                                            int i = 0;%>
                                        <%
                                            for (Map<String, Object> item : list) {
                                                i++;
                                                if (i > 5)
                                                    break;
                                                else { %>
                                        <tr>
                                            <th scope="row"><%=i%>
                                            </th>
                                            <td><%=(String) item.get("id")%>
                                            </td>
                                            <td><%=(String) item.get("prod_name")%>
                                            </td>
                                            <td><%= item.get("view_count")%>
                                            </td>
                                        </tr>
                                        <% } %>
                                        <%
                                            }
                                            if (i < 5) {
                                                for (int j = i; j < 6; j++) { %>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <%
                                                }
                                            } %>

                                        </tbody>
                                    </table>
                                </section>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title-block">
                                    <h3 class="title"> Sản phẩm được mua nhiềU nhất </h3>
                                </div>
                                <section class="example">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Lượt mua</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            List<Map<String, Object>> list1 = StaticAnalyzeService.getInstance().MostBuy();
                                            i = 0;%>
                                        <%
                                            for (Map<String, Object> item : list1) {
                                                i++;
                                                if (i > 5)
                                                    break;
                                                else { %>
                                        <tr>
                                            <th scope="row"><%=i%>
                                            </th>
                                            <td><%=(String) item.get("prod_id")%>
                                            </td>
                                            <td><%=(String) item.get("prod_name")%>
                                            </td>
                                            <td><%=item.get("sumquan")%>
                                            </td>
                                        </tr>
                                        <%
                                            } %>
                                        <%
                                            } %>
                                        <% if (i < 5) {
                                            for (int j = i; j < 6; j++) {%>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <% }
                                        } %>

                                        </tbody>
                                    </table>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title-block">
                                    <h3 class="title"> Sản phẩm tồn kho </h3>
                                </div>
                                <section class="example">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Số lượng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            List<Map<String, Object>> list2 = StaticAnalyzeService.getInstance().MostStorage();
                                            i = 0;%>
                                        <%
                                            for (Map<String, Object> item : list2) {
                                                i++;
                                                if (i > 5)
                                                    break;
                                                else { %>
                                        <tr>
                                            <th scope="row"><%=i%>
                                            </th>
                                            <td><%=(String) item.get("id")%>
                                            </td>
                                            <td><%=(String) item.get("prod_name")%>
                                            </td>
                                            <td><%=item.get("quantity")%>
                                            </td>
                                        </tr>
                                        <%
                                            } %>
                                        <%
                                            }
                                            if (i < 5) {
                                                for (int j = i; j < 6; j++) {
                                        %>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <% }
                                        } %>

                                        </tbody>
                                    </table>
                                </section>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-block">
                                <div class="card-title-block">
                                    <h3 class="title"> Người dùng có lượt mua nhiều nhất </h3>
                                </div>
                                <section class="example">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã người dùng</th>
                                            <th>Tên người dùng</th>
                                            <th>Số sản phẩm đã mua</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            List<Map<String, Object>> list3 = StaticAnalyzeService.getInstance().MostBuyFromUser();
                                            i = 0;%>
                                        <%
                                            for (Map<String, Object> item : list3) {
                                                i++;
                                                if (i > 5)
                                                    break;
                                                else { %>
                                        <tr>
                                            <th scope="row"><%=i%>
                                            </th>
                                            <td><%=(String) item.get("customer_id")%>
                                            </td>
                                            <td><%=(String) item.get("full_name")%>
                                            </td>
                                            <td><%=item.get("buy")%>
                                            </td>
                                        </tr>
                                        <%
                                            } %>
                                        <%
                                            }
                                            if (i < 5) {
                                                for (int j = i; j < 6; j++) {%>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <% }
                                        } %>

                                        </tbody>
                                    </table>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </article>
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
</body>
</html>
<%}%>