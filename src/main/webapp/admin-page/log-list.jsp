<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Log.LogAdmin" %>
<%@ page import="vn.edu.hcmuaf.fit.services.LogService" %>
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
    <style>
    .input-group-btn {
      display: flex;
    }
  </style>
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
    boolean check = true;
    for (AdminRole role : admin.getRole()) {
      if (role.getTable().equals("log") || role.getTable().equals("admin")) {
        check = true;
        break;
      }
    }
    if (!check) {
      response.sendRedirect("index.jsp");
    } else {

%>
<div class="main-wrapper">
  <div class="app" id="app">
    <jsp:include page="Layout/_LayoutAdminHeader.jsp"></jsp:include>
    <jsp:include page="Layout/_LayoutAdminSideBar.jsp"></jsp:include>
    <article class="content items-list-page">
      <div class="title-search-block">
        <div class="title-block">
          <div class="row">
            <div class="col-md-6">
              <h3 class="title"> Danh sách Thông báo </h3>
            </div>
          </div>
        </div>
      </div>
      <div class="card item">
        <ul class="item-list striped" id="items">
            <li class="item item-list-header">
                <div class="item-row">
                    <div class="item-col fixed item-col-check">
                        <label class="item-check" id="select-all-items">
                            <input type="checkbox" class="checkbox">
                            <span></span>
                        </label>
                    </div>
                    <div class="item-col item-col-header fixed item-col-img md"
                         style="min-width: 100px; text-align: center;margin: 0 10px;">
                        <div>
                            <span>Mã Thông Báo</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header item-col-title"
                         style="padding: 0 !important;max-width: 100px !important; text-align: center">
                        <div>
                            <span>Level</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header item-col-sales"
                         style="text-align: center;margin: 0 5px;">
                        <div>
                            <span>Loại Thông Báo</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header item-col-author"
                         style="text-align: center;margin: 0 10px;">
                        <div class="no-overflow">
                            <span>Thông báo</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header item-col-date"
                         style="text-align: center;margin: 0 20px;">
                        <div>
                            <span>Ngày thêm</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header fixed item-col-actions-dropdown"></div>
                </div>
            </li>
            <% int pageNumb = -1;
            List<LogAdmin> list = LogService.getInstance().loadLogWithPage(1,10);
            if (list.size() > 9)
              pageNumb = 9;
            else pageNumb = list.size();
          %>
          <div id="appendItem">
            <% if (list != null){
              for (int i = 0; i < pageNumb; i++) {%>
            <li class="item log-row<%=list.get(i).getId()%>">
              <div class="item-row">
                  <div class="item-col fixed item-col-check">
                      <label class="item-check" id="select-all-items">
                          <input type="checkbox" class="checkbox">
                          <span></span>
                      </label>
                  </div>
                  <div class="item-col fixed item-col-img md"
                       style="justify-content: center;min-width: 100px;margin: 0 10px;">
                      <span>#<%=list.get(i).getId()%></span>
                  </div>
                  <div class="item-col fixed pull-left item-col-title"
                       style="padding: 0 !important; max-width: 100px; text-align: center;">
                      <div class="item-heading">Level</div>
                      <div>
                          <a>
                              <h4 class="item-title"><%=list.get(i).getLevel()%>
                              </h4>
                          </a>
                      </div>
                  </div>
                  <div class="item-col item-col-sales" style="text-align: center;margin: 0 5px;">
                      <div class="item-heading">Loại Thông Báo</div>
                      <div class="sales" style="text-align: center"><%=list.get(i).getType()%>
                      </div>
                  </div>
                  <div class="item-col item-col-author" style="text-align: center;margin: 0 10px;">
                      <div class="item-heading">Thông báo</div>
                      <div class="no-overflow" style="text-align: center">
                          <%=list.get(i).getMessage()%>
                      </div>
                  </div>
                  <div class="item-col item-col-date" style="text-align: center;margin: 0 20px;">
                      <div class="item-heading">Ngày thêm</div>
                      <div class="no-overflow"><%=list.get(i).getCreated_date()%>
                      </div>
                  </div>
                <div class="item-col fixed item-col-actions-dropdown" style="margin-left: auto !important;">
                    <div class="item-actions-dropdown " >
                        <a class="item-actions-toggle-btn ">
                                <span class="inactive">
                                    <i class="fa fa-cog" style="margin-top: 5px;"></i>
                                </span>
                            <span class="active">
                                    <i class="fa fa-chevron-circle-right" style="margin-top: 5px"></i>
                                </span>
                        </a>
                        <div class="item-actions-block" style="margin-top: 1px">
                            <ul class="item-actions-list" style="margin-top: 1px;">
                                <%
                                  for (AdminRole role : admin.getRole()) {
                                    if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("log") && role.getPermission().equals("delete")) {
                                %>
                                <li>
                                    <a class="remove" id="remove<%=list.get(i).getId()%>"
                                       data-toggle="modal"
                                       data-target="#confirm-modal" style="cursor: pointer">
                                        <i class="fa fa-trash-o "></i>
                                    </a>
                                </li>
                                <%
                                    }
                                  }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
              </div>
            </li>
            <% }
            }%>
          </div>
        </ul>
      </div>
      <nav class="text-right">
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link" style="text-decoration: none;" id="btn_prev"> Trước </a>
          </li>
          <li class="page-item active">
            <a class="page-link" id="page" href="#" style="text-decoration: none;">1</a>
          </li>
          <a class="page-link" id="btn_next" style="text-decoration: none;"> Kế tiếp </a>
        </ul>
      </nav>
    </article>
    <div class="modal fade" id="confirm-modal">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">
              <i class="fa fa-warning"></i> Lưu ý
            </h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <p>Bạn có chắc muốn xoá lịch sử này ?</p>
          </div>
          <div class="modal-footer">
            <button type="button" id="yes" class="btn btn-primary yes" data-dismiss="modal">Có</button>
            <button type="button" id="no" class="btn btn-secondary no" data-dismiss="modal">Không</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
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
<script src="./js/jquery-3.6.1.min.js"></script>
<script src="./js/vendor.js"></script>
<script src="./js/app.js"></script>
<script>
  function reloadScript() {
    const $itemActions = $(".item-actions-dropdown");
    $(document).on('click', function (e) {
      if (!$(e.target).closest('.item-actions-dropdown').length) {
        $itemActions.removeClass('active');
      }
    });
    $('.item-actions-toggle-btn').on('click', function (e) {
      e.preventDefault();
      const $thisActionList = $(this).closest('.item-actions-dropdown');
      $itemActions.not($thisActionList).removeClass('active');
      $thisActionList.toggleClass('active');
    });
  }

  function deleteLog() {
    $(".remove").each(function () {
      const id = $(this).attr("id").substring(6);
      const page = parseInt($("#page").text());
      $(this).on("click", function (e) {
        e.preventDefault();
        $("button[type='button'].yes").on("click", function () {
          $.ajax({
            url: "../DeleteLogAdmin",
            type: "post",
            data: {
              id: id,
              page: page,
            },
            success: function (data) {
              $("#appendItem").html(data);
              console.log("Xóa thành công");
              reloadScript();
            }
          })
        })
      })
    })
  }

  deleteLog();
  $(document).ready(function () {
    $("#btn_prev").on("click", function (e) {
      e.preventDefault();
      const page = parseInt($("#page").text()) - 1;
      if (page > 0) {
        $.ajax({
          url: "../LoadLogAdmin",
          type: "post",
          data: {
            page: page,
          },
          success: function (data) {
            $("#appendItem").html(data);
            $("#page").text(page)
              deleteLog();
            reloadScript();
          }
        })
      }
    })
    $("#btn_next").on("click", function (e) {
      e.preventDefault();
      const page = parseInt($("#page").text()) + 1;
      $.ajax({
        url: "../LoadLogAdmin",
        type: "post",
        data: {
          page: page,
        },
        success: function (data) {
          console.log(data)
          if ($.trim(data)) {
            $("#appendItem").html(data);
            $("#page").text(page)
              deleteLog();
            reloadScript();
          }
        },
        error: function (data) {
          console.log(data)
        }
      })
    })
  })
</script>
</body>

</html>
<%
    }
  }
%>