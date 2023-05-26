<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.services.*" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.contact.Contact" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
  <meta charset="utf-8"/>
  <meta http-equiv="x-ua-compatible" content="ie=edge"/>
  <title>Trang Quản Lý</title>
  <meta name="description" content=""/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <!-- Place favicon.ico in the root directory -->
  <link rel="stylesheet" href="css/vendor.css"/>
  <link rel="stylesheet" href="css/orders-list.css"/>
  <style>
    .input-group-btn {
      display: flex;
    }
  </style>
  <!-- Theme initialization -->
  <script>
    var themeSettings = localStorage.getItem("themeSettings")
            ? JSON.parse(localStorage.getItem("themeSettings"))
            : {};
    var themeName = themeSettings.themeName || "";
    if (themeName) {
      document.write(
              '<link rel="stylesheet" id="theme-style" href="css/app-' +
              themeName +
              '.css">'
      );
    } else {
      document.write(
              '<link rel="stylesheet" id="theme-style" href="css/app.css">'
      );
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
    boolean check = true;
//    for (AdminRole role : admin.getRole()) {
//      if (role.getTable().equals("contact") || role.getTable().equals("admin")) {
//        if (role.getPermission().equals("update") || role.getPermission().equals("admin"))
//          check = true;
//      }
//    }
    if (!check) {
      response.sendRedirect("index.jsp");
    } else {
%>
<div class="main-wrapper">
  <div class="app" id="app">
    <jsp:include page="Layout/_LayoutAdminHeader.jsp"></jsp:include>
    <jsp:include page="Layout/_LayoutAdminSideBar.jsp"></jsp:include>
    <article class="content item-editor-page">
      <div class="title-block">
        <h3 class="title"> Thông tin liên hệ
          <span class="sparkline bar" data-type="bar"></span>
        </h3>
      </div>
      <%
        Contact contact = null;
        if (request.getParameter("id") != null)
          contact = ContactService.getInstance().getContentById(request.getParameter("id"));
      %>
      <form name="item" method="post" enctype="multipart/form-data">
        <input type="text" id="idEdit"
               value="<%=request.getParameter("id") == null ? "" : request.getParameter("id")%>"
               style="display: none">
        <input type="text" id="userid"
               value="<%=((AdminUser) request.getSession().getAttribute("userAdmin")).getId()%>"
               style="display:none;">
        <div class="card card-block">
          <div class="form-group row">
            <label class="col-sm-2 form-control-label text-xs-right"> Họ tên : </label>
            <div class="col-sm-10">
              <input type="text" class="form-control boxed" name="name"
                     id="name" value="<%=(contact != null) ? contact.getName() : ""%>"
                     readonly>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 form-control-label text-xs-right"> Email : </label>
            <div class="col-sm-10">
              <input type="text" class="form-control boxed" name="name"
                     id="name" value="<%=(contact != null) ? contact.getEmail() : ""%>"
                     readonly>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 form-control-label text-xs-right"> Số điện thoại : </label>
            <div class="col-sm-10">
              <input type="text" class="form-control boxed" name="name"
                     id="name" value="<%=(contact != null) ? contact.getPhone() : ""%>"
                     readonly>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 form-control-label text-xs-right"> Mô tả: </label>
            <div class="col-sm-10">
                <textarea id="content"
                       style="width: 100%; height: 300px !important;
                        white-space: inherit;
                        font-size: 17px;"
                       readonly>
            <%=(contact != null) ? contact.getContent() : ""%>
                </textarea>
            </div>
          </div>
<%--        Reply--%>
          <div class="col-sm-10 col-sm-offset-2">
          <button type="button" id="reply" class="btn btn-primary">Trả lời</button>
        </div>
          <div class="form-group row" id="reply-content"
               style="display: none;">
            <label class="col-sm-2 form-control-label text-xs-right"> Reply: </label>
            <div class="col-sm-10">
                    <textarea id="editor"
                              class="form-control boxed"
                              style="width: 100%; height: 300px !important;
                              white-space: inherit;
                              font-size: 17px;"
                              placeholder="Nhập reply của bạn ở đây...."></textarea>
              <script>
                CKEDITOR.replace('editor');
              </script>
            </div>
            <div class="col-sm-10 col-sm-offset-2">
              <button type="submit" class="btn btn-primary">Xác nhận</button>
            </div>
          </div>
<%--   End reply--%>
        </div>
      </form>
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
<input type="text" id="ordId" value="<%=request.getParameter("id")%>" style="display:none;">
<script>
  (function (i, s, o, g, r, a, m) {
    i["GoogleAnalyticsObject"] = r;
    (i[r] =
            i[r] ||
            function () {
              (i[r].q = i[r].q || []).push(arguments);
            }),
            (i[r].l = 1 * new Date());
    (a = s.createElement(o)), (m = s.getElementsByTagName(o)[0]);
    a.async = 1;
    a.src = g;
    m.parentNode.insertBefore(a, m);
  })(
          window,
          document,
          "script",
          "https://www.google-analytics.com/analytics.js",
          "ga"
  );
  ga("create", "UA-80463319-4", "auto");
  ga("send", "pageview");
</script>
<script src="./js/jquery-3.6.1.min.js"></script>
<script src="./js/vendor.js"></script>
<script src="./js/app.js"></script>
<script>
    $("#reply").click(function (e){
        e.preventDefault();
        $('#reply-content').css('display','flex');
        $('#reply').css('display','none');
    })
</script>
<script>
  $("button[type='submit']").click(function (e) {
    e.preventDefault();
    const id = $("#idEdit").val();
    const content = CKEDITOR.instances.editor.getData();
    $.ajax({
      url: "../ReplyContactController",
      type: "GET",
      data: {
        id: id,
        content: content
      },
      success: function () {
        if (id.length < 1)
          alert("Trả lời contact thành công");
      }
    })
  })

</script>
</body>

</html>
<%
    }
  }
%>