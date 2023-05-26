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
                     id="name" value="
                  <%=(contact != null) ? contact.getName() : ""%>
123"
                     readonly>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 form-control-label text-xs-right"> Email : </label>
            <div class="col-sm-10">
              <input type="text" class="form-control boxed" name="name"
                     id="name" value="123
                  <%=(contact != null) ? contact.getEmail() : ""%>
"
                     readonly>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 form-control-label text-xs-right"> Số điện thoại : </label>
            <div class="col-sm-10">
              <input type="text" class="form-control boxed" name="name"
                     id="name" value="123
                  <%=(contact != null) ? contact.getPhone() : ""%>
"
                     readonly>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 form-control-label text-xs-right"> Mô tả: </label>
            <div class="col-sm-10">
                <textarea id="content"
                       style="width: 100%; height: 400px !important;
                        white-space: inherit;
                        font-size: 17px;"
                       readonly>
<%--           Có lẽ phụ huynh nào cũng từng xuất hiện trong bài văn của con mình với vẻ ngoài và tính tình hoàn toàn không giống mình nhưng lại rất giống nhau.--%>

<%--Ngày mới ra trường, khi chấm bài kiểm tra tập làm văn lớp sáu với đề bài "kể lại một việc tốt em đã làm", tôi đã ngạc nhiên khi hầu như cả lớp chỉ làm có hai việc tốt, một là dẫn bà cụ qua đường, hai là nhặt được chiếc ví và trả lại người mất.--%>

<%--Điều khiến tôi không biết nên cười hay nên khóc là bà cụ trong bài nào cũng đứng ở ngã tư, cũng "tóc bạc phơ, dáng người gầy gầy, lưng cong cong, đôi mắt hiền từ". Chiếc ví nào cũng nhặt được trên đường đi học về, cũng "màu nâu đậm, hình vuông, bên trong có chứa nhiều giấy tờ quan trọng và một số tiền lớn".--%>

<%--Chẳng lẽ cả lớp 40 em lại gặp đúng một bà cụ, nhặt được cùng một chiếc ví? Tất nhiên ai cũng biết là không thể. Đó là một minh chứng cho việc học sinh bị lệ thuộc vào văn mẫu.--%>

<%--Thực trạng trên ở các lớp nhỏ, lên đến các lớp lớn hơn, khi chuyển sang các dạng văn khó hơn như nghị luận xã hội, nghị luận văn học, đề bài cũng phong phú hơn. Các em không thể chỉ học thuộc một vài bài văn mẫu tả cha mẹ, thầy cô, việc tốt, kỷ niệm vui buồn nữa mà phải phân tích, trình bày quan điểm của mình về các sự việc, hiện tượng trong xã hội hoặc các tư tưởng, đạo lý, tác phẩm văn học.--%>

<%--Tưởng chừng văn mẫu sẽ không còn đất dụng võ ở các khối lớp lớn cấp hai, cấp ba, nhưng chúng vẫn chi phối rất nhiều khi học sinh học thuộc những mở bài với cấu trúc giới thiệu tác giả, tác phẩm, vấn đề nghị luận... Đối với đoạn thơ đó, câu chuyện đó, nhiều em biết cần phải thuộc được những câu văn phân tích có sẵn để dễ lấy điểm hơn.--%>

<%--Tôi từng đọc được bình luận của học trò: "Đề thi thì ghi nêu cảm nhận của em, nhưng đáp án lại chấm theo ý của thầy cô". Thực ra, không phải chúng tôi chấm theo ý của thầy cô mà là chấm theo khung đáp án của Bộ, và để có điểm, ý tứ trong bài văn của các em phải phù hợp với đáp án. Đa số học sinh đều lựa chọn cách nhanh nhất để làm được điều đó, đó là học từ văn mẫu.--%>

<%--Không phải đến thế hệ giáo viên chúng tôi, văn mẫu mới trở thành đề tài gây nhiều tranh cãi trong việc dạy và học. Văn mẫu có cả "công" và "tội".--%>

<%--Văn mẫu trước hết là những bài văn hay. Đọc một bài văn hay, con người có thể nâng tầm nhận thức và thẩm mĩ, có thể nảy sinh những cảm xúc bồi đắp tâm hồn, được gợi cảm hứng để làm điều tốt đẹp. Học sinh có thể nhìn vào đó học hỏi được cách triển khai bài của mình, cách dẫn dắt ý, dùng từ ngữ, gạn lọc ý tâm đắc hoặc diễn đạt sáng tạo. Nó giúp ích rất nhiều cho khả năng viết của các em.--%>
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
                              placeholder="Nhập reply của bạn ở đây...."></textarea>
              <script>
                CKEDITOR.replace('editor');
              </script>
            </div>
            <div class="col-sm-10 col-sm-offset-2">
              <button type="submit" class="btn btn-primary">Xác nhận</button>
            </div>
          </div>
<%--     reply--%>
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