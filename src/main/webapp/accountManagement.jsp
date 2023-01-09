<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.order.Order" %>
<%@ page import="vn.edu.hcmuaf.fit.services.OrderService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
    <link rel="stylesheet" href="./assets/css/account.css">
    <link rel="stylesheet" href="./assets/css/reponsive1.css">
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

    .wrapper {
        margin-top: 30px;
    }
</style>
<body>
<%

    //----------------------Kiểm tra thử đăng nhập hay chưa--------------------//
    if (request.getSession().getAttribute("user") == null) {
        // Sendredirect tới login
        response.sendRedirect("Login.jsp");

    } else {
        SiteUser user = (SiteUser) request.getSession().getAttribute("user");
%>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<!-- content -->
<% UserInformation information = UserInformationService.getInstance().getUserInfoById((user.getId()));%>
<div class="container">
    <div class="wrapper">
        <div class="row">
            <div class="col-4">
                <div class="heading">
                    <img src="<%=UserInformationService.getInstance().getUserInfo(user.getId()).getAvatar_link() != null ? UserInformationService.getInstance().getUserInfo(user.getId()).getAvatar_link() : "./assets/img/product/noavatar.png"%>"
                         alt="" class="heading-img">
                    <span class="heading-name_acc"><%=UserInformationService.getInstance().getUserInfo(user.getId()).getFull_name()%></span>
                </div>
                <div class="menu-manager">
                    <div class="my-profile" onclick="hienThiDoiThongTin()">
                        <div class="my-profile-title">
                            <div class="my-profile-icon"><i class="fas fa-user"></i></div>
                            <div class="my-profile-name">Hồ sơ của tôi</div>
                        </div>
                    </div>
                    <div class="my-order" onclick="hienThiDonHang()">
                        <div class="my-order-title active">
                            <div class="my-order-icon"><i class="fas fa-shopping-bag"></i></div>
                            <div class="my-order-name">Đơn hàng của tôi</div>
                        </div>
                    </div>
                    <div class="my-password" onclick="hienThiDoiMatKhau()">
                        <div class="my-password-title">
                            <div class="my-password-icon"><i class="fas fa-key"></i></div>
                            <div class="my-password-name">Đổi mật khẩu</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-8" id="user_info">
                <div class="detial__my-profile undisplay">
                    <form class="heading-edit-account" method="POST" enctype="multipart/form-data">
                        <h2>Hồ sơ của tôi</h2>
                        <div class="form-group">
                            <label for="full_name" class="form-label">Tên đầy đủ</label>
                            <input id="full_name" name="full_name" type="text" placeholder="VD: User1"
                                   class="form-control"
                                   value="<%=information.getFull_name()%>">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input id="email" name="email" type="text" placeholder="VD: email@domain.com"
                                   class="form-control"
                                   value="<%=information.getEmail()%>">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label for="address" class="form-label">Địa chỉ</label>
                            <input id="address" name="address" type="text" placeholder="VD: 86/2/3 Bình Thạnh TP HCM"
                                   class="form-control"
                                   value="<%=information.getAddress()%>">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label for="phone_number" class="form-label">Số điện thoại</label>
                            <input id="phone_number" name="phone_number" type="text" placeholder="VD: 089..."
                                   class="form-control"
                                   value="<%=information.getPhone_number()%>">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label for="avatar" class="form-label">Cập nhật ảnh đại diện</label>
                            <input id="avatar" name="avatar" type="file" class="form-control">
                            <span class="form-message"></span>
                        </div>
                        <input type="text" name="filename" id="fileName" value="" style="display:none;">
                        <button class="form-submit" id="submit1">Lưu</button>
                    </form>
                </div>
                <%--Pass--%>
                <div class="detail__confirm-password undisplay">
                    <form class="change-pass" method="post">
                        <div id="content-form">
                            <div class="heading-edit-password">
                                <h2>Đổi lại mật khẩu</h2>
                            </div>
                            <div class="form-group form-group-old-password">
                                <div style="display:flex;justify-content: space-between;">
                                    <label for="password_old" class="form-label">Mật khẩu cũ</label>
                                </div>
                                <input id="password_old" name="password" type="password" placeholder="Nhập mật khẩu"
                                       class="form-control" required>
                                <span class="form-message"></span>
                            </div>
                            <div class="form-group form-group-new-password">
                                <div style="display:flex;justify-content: space-between;">
                                    <label for="password_new" class="form-label">Mật khẩu mới</label>
                                </div>
                                <input id="password_new" name="password-new" type="password" placeholder="Nhập mật khẩu"
                                       class="form-control" required>
                                <span class="form-message"></span>
                            </div>
                            <div class="form-group form-group-confirm-password">
                                <div style="display:flex;justify-content: space-between;">
                                    <label for="password_confirm" class="form-label">Mật khẩu mới</label>
                                </div>
                                <input id="password_confirm" name="password-confirm" type="password"
                                       placeholder="Nhập mật khẩu"
                                       class="form-control" required>
                                <span class="form-message"></span>
                            </div>
                            <button class="form-submit" id="submit2">Lưu</button>
                        </div>
                    </form>
                </div>
                <div class="detail__my-order">
                    <div class="heading-edit-password">
                        <h2>Đơn hàng của bạn</h2>
                    </div>
                    <div class="detail__my-order-content">
                        <form>
                            <div class="my-order-heading">
                                <div class="row">
                                    <div class="col-2">MĐH</div>
                                    <div class="col-3">Ngày</div>
                                    <div class="col-3">Tổng tiền</div>
                                    <div class="col-2">Trạng thái</div>
                                    <div class="col-2">Chi tiết</div>
                                </div>
                            </div>
                            <%
                                List<Order> orders = OrderService.getInstance().getOrderListByUserId(user.getId());
                                NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
                            %>
                            <div class="my-order-body">
                                <%
                                    if (orders != null) {
                                        for (Order oder : orders) { %>
                                <div class="row bd-bottom">
                                    <div class="col-2">#<%=oder.getOrd_id()%>
                                    </div>
                                    <div class="col-3"><%=oder.getOrd_date()%>
                                    </div>
                                    <div class="col-3"><%=format.format(oder.getTotal())%>
                                    </div>
                                    <div class="col-2">
                                        <div class="fa-3x" style="font-size: 1.5em !important;">
                                            <% if (oder.getIsCanceled() == 0) { %>
                                            <i class="fa fa-times" aria-hidden="true" style="color: red"
                                               title="Đơn đã bị hủy"></i>
                                            <% } else if (oder.getStatus() == 0) { %>
                                            <i class="fas fa-spinner fa-spin" aria-hidden="true" style="color: blue"
                                               title="Chờ xác nhận đơn hàng"></i>
                                            <% } else if (oder.getStatus() == 1) {
                                                if (oder.getDelivered() == 0) { %>
                                            <i class="fas fa-shipping-fast" style="color: blue;"
                                               title="Đang giao hàng"></i>
                                            <% } else if (oder.getDelivered() == 1) { %>
                                            <i class="fas fa-check"
                                               style="margin-right: 0px !important;color: #006500;"
                                               title="Đã giao hàng"></i>
                                            <% } else { %>
                                            <i class="fas fa-pallet"
                                               style="margin-right: 0px !important;color: yellow;"
                                               title="Đơn hàng chuẩn bị giao"></i>
                                            <% }
                                            }
                                            %>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <a style="cursor: pointer" class="toggleModal"
                                           id="modal<%=oder.getOrd_id()%>"
                                        >Xem</a>
                                    </div>
                                </div>
                                <% }
                                } %>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end content -->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Chi tiết đơn hàng</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        </div>
    </div>
</div>
<!-- end modal -->
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/main.js"></script>
<script src="./assets/js/validator.js"></script>
<script>
    function hienThiDoiMatKhau() {
        $(".detail__confirm-password").removeClass("undisplay");
        $(".detail__confirm-password").addClass("display");
        $(".my-password-title").addClass("active");
        $(".my-profile-title").removeClass("active");
        $(".my-order-title").removeClass("active");
        $(".detial__my-profile").addClass("undisplay");
        $(".detial__my-profile").removeClass("display");
    }

    function hienThiDoiThongTin() {
        $(".detial__my-profile").removeClass("undisplay");
        $(".detial__my-profile").addClass("display");
        $(".my-profile-title").addClass("active");
        $(".my-password-title").removeClass("active");
        $(".my-order-title").removeClass("active");
        $(".detail__confirm-password").addClass("undisplay");
        $(".detail__confirm-password").removeClass("display");
    }

    function hienThiDonHang() {
        $(".detial__my-profile").addClass("undisplay");
        $(".detial__my-profile").removeClass("display");
        $(".my-profile-title").removeClass("active");
        $(".my-password-title").removeClass("active");
        $(".detail__confirm-password").addClass("undisplay");
        $(".detail__confirm-password").removeClass("display");
        $(".my-order-title").addClass("active");
    }

    $("#avatar").on('change', function (e) {
        const value = $(this).val();
        let name = "";
        if (value.indexOf("\\") != -1)
            name = value.substring(value.lastIndexOf("\\") + 1);
        else
            name = value.substring(value.lastIndexOf("/") + 1);
        uploadFile(name, e)
    })

    function uploadFile(name, event) {
        event.stopPropagation();
        event.preventDefault();
        const files = event.target.files;
        const data = new FormData();
        $.each(files, function (key, value) {
            data.append(key, value);
        });
        postFilesData(name, data);
    }

    function postFilesData(name, data) {
        $.ajax({
            url: '/CuoiKiWeb_war/UpDownImageAvatarController',
            type: 'POST',
            data: data,
            cache: false,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data, textStatus, jqXHR) {
                $("#fileName").val(name);
                console.log($("#fileName").val())
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $("#fileName").val(name);
                console.log($("#fileName").val())
            }
        });
    }

    $("#submit1").click(function (e) {
        e.preventDefault();
        const full_name = $("#full_name").val();
        const email = $("#email").val();
        const address = $("#address").val();
        const phone_number = $("#phone_number").val();
        const filename = $("#fileName").val();
        if (full_name == null || email == null || address == null || phone_number == null) {
            alert("Không được để trống các trường");
        } else {
            $.ajax({
                url: "UpdateUserController",
                type: "GET",
                data: {
                    full_name: full_name,
                    email: email,
                    address: address,
                    phone_number: phone_number,
                    filename: filename
                },
                success: function (data) {
                    alert(data);
                },
                error: function (data) {
                    alert(data);
                }
            })
        }
    })
    $("#submit2").click(function (e) {
        e.preventDefault();
        const password_old = $("#password_old").val();
        const password_new = $("#password_new").val();
        const password_confirm = $("#password_confirm").val();
        if (password_old == null || password_old.length < 1) {
            alert("Mật khẩu cũ không được để trống")
        } else {
            if (password_new == null || password_confirm == null || password_new.length < 6 || password_confirm < 6) {
                alert("Không được để trống các trường");
            } else if (password_new !== password_confirm) {
                alert("Mật khẩu mơí và nhập lại không giống nhau");
            } else {
                $.ajax({
                    url: "ChangePasswordController",
                    type: "POST",
                    data: {
                        password_old: password_old,
                        password_new: password_new,
                        password_confirm: password_confirm
                    }, success: function (response) {
                        if (response.includes("complete")) {
                            alert("Đổi mật khẩu thành công");
                            window.location.href = "http://localhost:8080/CuoiKiWeb_war/Login.jsp";
                        } else {
                            alert(response);
                        }
                    }
                });
            }
        }
    })
    $(".toggleModal").each(function () {
        $(this).click(function (e) {
            e.preventDefault();
            const idToggle = $(this).attr("id").substring(5);
            $.ajax({
                type: "post",
                url: "QuickViewOrderController",
                data: {
                    idToggle: idToggle
                },
                success: function (data) {
                    console.log(data)
                    $(".modal-content").html(data);
                    $("#myModal").modal('toggle');
                }
            });
        })
    })
</script>
</body>

</html>
<%}%>