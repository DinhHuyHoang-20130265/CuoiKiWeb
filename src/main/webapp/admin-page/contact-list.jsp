<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.OrderService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.AccountService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.contact.Contact" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ContactService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Trang Quản Lý</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
    <!-- Place favicon.ico in the root directory -->
    <link rel="stylesheet" href="css/vendor.css"/>
    <link rel="stylesheet" href="css/orders-list.css"/>
    <style>
        .input-group-btn {
            display: flex;
        }
        .overtext{
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
            height: 50px !important;
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
        for (AdminRole role : admin.getRole()) {
            if (role.getTable().equals("contact") || role.getTable().equals("admin")) {
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
                            <h3 class="title">
                                Danh sách liên hệ
                            </h3>
                            <br>
                            <a
                                    href="reply-contact.jsp"
                        class="btn btn-primary btn-sm rounded-s"> Liên hệ đã trả lời
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="omni-tabs-wrapper">
                    <ul role="tablist" class="omni-tabs false">
                        <li class="omni-tab-container">
                            <a class="omni-tab omni-tab-selected"><span class="text-black">Tất cả liên hệ</span></a>
                        </li>
                    </ul>
                    <div>
                        <div class="position-relative">
                            <div class="order-list--table table-list--config">
                                <div class="ui-table-listing-container">
                                    <table class="ui-table" id="appendItem">
                                        <thead>
                                        <tr>
                                            <th class="table-header--check">
                                                <div class="hrv-next-input-checkbox z-index-20">
                                                    <label
                                                            class="hrv-next-label--switch hrv-next-label--empty"></label>
                                                </div>
                                            </th>
                                            <th class="table-header--id"><span>Mã</span></th>
                                            <th class="table-header--datetime">
                                                <span>Ngày tạo</span>
                                            </th>
                                            <th class="table-header--name">
                                                <span>Họ tên</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span id="cspot-orders-trangthaithanhtoan">Email</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span id="cspot-orders-trangthaigiaohang">Số điện thoại</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span id="cspot-orders-trangthaidonhang">Nội dung</span>
                                            </th>
                                            <th class="table-header--status">
                                                <span id="cspot-orders-trangthaidonhang">Trạng thái</span>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <% int numb = -1;
                                            List<Contact> list = ContactService.getInstance().loadContactWithPage(1);
                                            numb = Math.min(list.size(), 6);
                                            if (list != null)
                                                for (int i = 0; i < numb; i++) {%>
                                        <tr class="order" id="order<%=list.get(i).getEmail()%>">
                                            <td class="cursor-pointer">
                                                <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
                                                     width="20" height="20">
                                                </svg>
                                            </td>
                                            <td class="no-wrap pl-0">
                                                <a href="contact-detail.jsp?id=<%=list.get(i).getId()%>">#<%=list.get(i).getId()%>
                                                </a>
                                                <div class="d-inline-block">
                                                    <span class="ml-1">
                                                        <svg class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                                                             width="14" height="14">
                                                            <svg viewBox="0 0 20 20">
                                                                <path
                                                                        d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                                                                </path>
                                                            </svg></svg>
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="order-date"><%=list.get(i).getCreated_date()%></td>
                                            <td style="max-width:300px">
                                                <div class="trigger">
                                                    <span>
                                                        <div class="order_list_customer">
                                                            <p class="mb-0 px-2 align-items-center word-break">
                                                                <span class="omni-shorten-text"
                                                                      title="<%=list.get(i).getName()%>>"><%=list.get(i).getName()%></span>
                                                            </p>
                                                        </div>
                                                    </span>
                                                </div>
                                            </td>
                                            <td style="max-width:300px">
                                                <div class="trigger">
                                                    <span>
                                                        <div class="order_list_customer">
                                                            <p class="mb-0 px-2 align-items-center word-break">
                                                                <span class="omni-shorten-text"
                                                                      title="<%=list.get(i).getEmail()%>>"><%=list.get(i).getEmail()%></span>
                                                            </p>
                                                        </div>
                                                    </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="trigger">
                                                    <span>
                                                        <div class="order_list_customer">
                                                            <p class="mb-0 px-2 align-items-center word-break">
                                                                <span class="omni-shorten-text"
                                                                      title="<%=list.get(i).getPhone()%>>"><%=list.get(i).getPhone()%></span>
                                                            </p>
                                                        </div>
                                                    </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="trigger"
                                                style="
                                                max-height: 50px;
                                                overflow: scroll;">
                                                    <span>
                                                        <div class="order_list_customer">
                                                            <p class="mb-0 px-2 align-items-center word-break overtext">
                                                                <span class="omni-shorten-text"
                                                                      title="<%=list.get(i).getContent()%>>"><%=list.get(i).getContent()%></span>
                                                            </p>
                                                        </div>
                                                    </span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="status-component">
                                                        <%if (list.get(i).getStatus() == 0) { %>
                                                        <span class="circle-status mr-2 circle-status-cancel"></span><span
                                                            class="badges--order-status-cancel">
                                                                    Chưa trả lời</span>
                                                        <% } else { %>
                                                        <span
                                                                class="circle-status mr-2 circle-status-complete"></span><span
                                                            class="badges--carrier-status-4">
                                                                    Đã trả lời</span>
                                                        <% }%>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <%
                                                    for (AdminRole role : admin.getRole()) {
                                                        if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("contact") && role.getPermission().equals("delete")) {
                                                %>
                                                <a style="cursor: pointer" class="remove" href="#" data-toggle="modal"
                                                   data-target="#confirm-modal"
                                                   id="remove<%=list.get(i).getId()%>">
                                                    <i class="fa fa-trash" style="color: red"></i>
                                                </a>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                        <%
                                            }%>
                                        </tbody>
                                    </table>
                                </div>
                                <nav class="text-right">
                                    <ul class="pagination">
                                        <li class="page-item">
                                            <a class="page-link" style="text-decoration: none;" id="btn_prev">
                                                Trước </a>
                                        </li>
                                        <li class="page-item active">
                                            <a class="page-link" id="page" style="text-decoration: none;">1</a>
                                        </li>
                                        <a class="page-link" id="btn_next" style="text-decoration: none;"> Kế tiếp </a>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
        <div class="modal fade" id="confirm-modal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fa fa-warning"></i> Lưu ý</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc muốn xóa liên hệ này không ?</p>
                        <p>Sau khi hủy sẽ không thể hoàn tác</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="yesButton" class="btn btn-primary" data-dismiss="modal">
                            Có
                        </button>
                        <button type="button" class="btn btn-secondary no" data-dismiss="modal">
                            Không
                        </button>
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
    function deleteContact() {
        $(".remove").each(function () {
            const id = $(this).attr("id").substring(6);
            const page = parseInt($("#page").text());
            $(this).on("click", function (e) {
                e.preventDefault();
                $("#yesButton").click(function () {
                    $.ajax({
                        url: "../DeleteContactAdminController",
                        type: "post",
                        data: {
                            id: id,
                            page: page,
                        },
                        success: function (data) {
                            $("#appendItem tbody").html(data);
                            console.log("Xóa thành công");
                        }
                    })
                })
            })
        })
    }
    deleteContact();

    $(document).ready(function () {

        $("#btn_prev").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) - 1;
            if (page > 0) {
                $.ajax({
                    url: "../LoadContactListAdmin",
                    type: "post",
                    data: {
                        page: page,
                    },
                    success: function (data) {
                        $("#appendItem tbody").html(data);
                        $("#page").text(page)
                        deleteContact();
                    }
                })
            }
        })
        $("#btn_next").on("click", function (e) {
            e.preventDefault();
            const page = parseInt($("#page").text()) + 1;
            $.ajax({
                url: "../LoadContactListAdmin",
                type: "post",
                data: {
                    page: page,
                },
                success: function (data) {
                    if ($.trim(data)) {
                        $("#appendItem tbody").html(data);
                        $("#page").text(page)
                        deleteContact();
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
<% }
}%>