<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.cart.CartKey" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.cart.Cart" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
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
    <link rel="stylesheet" href="./assets/css/pay.css">
    <link rel="stylesheet" href="./assets/css/pay1.css">
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

    /* Mobile & tablet  */
    @media (max-width: 1023px) {
        .summary {
            display: block;
        }
    }

    /* tablet */
    @media (min-width: 740px) and (max-width: 991px) {
        .summary-content.hidden .col-6 {
            max-width: 50% !important;
            justify-content: normal;
        }

        .summary-content.hidden .col-6 img {
            width: 150px;
        }

        .summary-content.hidden .col-6.col-8 {
            justify-content: end;
            right: 20px;
        }

        .summary-content.hidden .col-6.col-8 h5 {
            margin-bottom: 0;
            margin-right: 125px;
        }

        .summary-content.hidden .col-6 .notice {
            left: 152px;
        }
    }

    /* mobile */
    @media (max-width: 739px) {
        .summary-content.hidden .col-6 {
            max-width: 50% !important;
            justify-content: normal;
        }

        .summary-content.hidden .col-6 img {
            width: 150px;
        }

        .summary-content.hidden .col-6.col-8 {
            justify-content: end;
            right: 20px;
        }

        .summary-content.hidden .col-6.col-8 h5 {
            margin-bottom: 0;
            margin-right: 125px;
        }

        .summary-content.hidden .col-6 .notice {
            left: 152px;
        }
    }

    .summary-heading-price .dropdown {
        rotate: -90deg;
        transition: transform 0.4s;
    }
</style>

<body>
<%
    SiteUser user = (SiteUser) request.getSession().getAttribute("user");
    Cart cart = (Cart) request.getSession().getAttribute("cart");
    UserInformation userInformation = null;
    if (user == null)  {
        response.sendRedirect("Login.jsp");
    } else {
        userInformation = UserInformationService.getInstance().getUserInfo(user.getId());
%>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<div class="content">
    <div class="wrap">
        <div class="container">
            <form action="">
                <div class="row">
                    <div class="col-lg-6 col-12">
                        <div class="main">
                            <div class="main-header">
                                <a href="">
                                    <h1>P&T SHOP</h1>
                                </a>
                            </div>
                            <div class="main-content">
                                <div class="main-title">
                                    <h2>Thông tin giao hàng</h2>
                                </div>
                                <input class="user_id" value="<%=user.getId()%>" style="display: none">
                                <div class="main-customer-info">
                                    <div class="main-customer-info-img">
                                        <img src="<%=userInformation.getAvatar_link()%>" alt="" width="60px" height="60px">
                                    </div>
                                </div>
                                <div class="fieldset">
                                    <div class="fieldset-address form-group">
                                        <input id="error" type="text" class="error" value="" style="display: none">
                                        <label for="diachi" class="form-label">Địa chỉ</label>
                                        <input id="diachi" type="text" class="form-control"
                                               value="<%=userInformation.getAddress()%>">
                                        <span class="form-message"></span>
                                    </div>
                                    <div class="fieldset-name form-group">
                                        <input id="error" type="text" class="error" value="" style="display: none">
                                        <label for="hoten" class="form-label">Họ tên</label>
                                        <input id="hoten" type="text" class="form-control"
                                               value="<%=userInformation.getFull_name()%>">
                                        <span class="form-message"></span>
                                    </div>
                                    <div class="fieldset-address form-group">
                                        <input id="error" type="text" class="error" value="" style="display: none">
                                        <label for="email" class="form-label">Email</label>
                                        <input id="email" type="text" class="form-control"
                                               value="<%=userInformation.getEmail()%>">
                                        <span class="form-message"></span>
                                    </div>
                                    <div class="fieldset-phone form-group">
                                        <input id="error" type="text" class="error" value="" style="display: none">
                                        <label for="sdt" class="form-label">Số điện thoại</label>
                                        <input id="sdt" type="text" class="form-control"
                                               value="<%=userInformation.getPhone_number()%>">
                                        <span class="form-message"></span>
                                    </div>
                                    <textarea id="textbox" type="text" class="form-control"
                                              placeholder="Ghi chú đơn hàng...."></textarea>
                                </div>
                            </div>
                            <div class="main-footer">
                                <div class="continue">
                                    <a>
                                        <i class="fi-rs-angle-left"></i>
                                        Giỏ hàng
                                    </a>
                                </div>
                                <div class="pay">
                                    <button type="submit" class="btn-pay form-submit">Thanh toán</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-12 hidden-sm hidden-xs" style="background-color:#f3f3f3;">
                        <%
                            NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
                            for (CartKey p : cart.getData().keySet()) {%>
                        <div class="sliderbar">
                            <div class="sliderbar-header">
                                <h2>Thông tin đơn hàng</h2>
                            </div>
                            <div class="sliderbar-content">
                                <div class="row row-sliderbar">
                                    <div class="col-4">
                                        <img src="<%=cart.getData().get(p).getMain_img_link()%>" alt="" width="80%">
                                        <span class="notice"><%=cart.getData().get(p).getQuantity_cart()%></span>
                                    </div>
                                    <div class="col-6">
                                        <h5 class="cart-name"
                                            style="margin-bottom: 0;"><%=cart.getData().get(p).getProd_name()%>
                                        </h5>
                                        <div class="foo " style="background: <%=p.getColor()%>"></div>
                                        <p class="size_choosed" style="font-size: 12px;"><%=p.getSize()%>
                                        </p>
                                    </div>
                                    <div class="col-2">
                                        <%if (cart.getData().get(p).getSales() != null) {%>
                                        <span><%=format.format(cart.getData().get(p).getPrice() * 0.01 * (100 - cart.getData().get(p).getSales().getDiscount_rate()))%>₫ - (-<%=cart.getData().get(p).getSales().getDiscount_rate()%>%)</span>
                                        <%} else {%>
                                        <span><%=format.format(cart.getData().get(p).getPrice())%>₫</span>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <div class="slider-footer">
                                <div class="subtotal">
                                    <div class="row row-sliderbar-footer">
                                        <div class="col-6"><span>Tạm tính:</span></div>
                                        <div class="col-6 text-right">
                                            <span><%=cart != null ? format.format(cart.total()) : 0%>₫</span></div>
                                    </div>
                                    <div class="row row-sliderbar-footer">
                                        <div class="col-6"><span>Phí vận chuyển</span></div>
                                        <div class="col-6 text-right"><span>30,000₫</span></div>
                                    </div>
                                </div>
                                <div class="total">
                                    <div class="row row-sliderbar-footer">
                                        <div class="col-6"><span>Tổng cộng:</span></div>
                                        <div class="col-6 text-right">
                                            <span><%=format.format(cart.total() + 30000)%>₫</span></div>
                                        <input class="total_input" value="<%=cart.total() + 30000%>"
                                               style="display: none">;
                                    </div>
                                </div>
                                <div class="salecode">
                                    <div class="row row-sliderbar-footer">
                                        <div class="col-6"><span>Nhập mã ưu đãi:</span></div>
                                        <textarea class="sale_code form-control"
                                                  placeholder="Nhập vào nếu có"></textarea>
                                        <button class="codebutt">Áp Dụng</button>
                                    </div>
                                </div>
                                <hr>
                                <div class="selection-pay">
                                    <div class="selection-pay-title">
                                        <h2>Chọn hình thức thanh toán</h2>
                                    </div>
                                    <div class="selection-btn">
                                        <input type="radio" id="cash" name="select-btn" value="0" checked>
                                        <label for="cash"> Thanh toán bằng tiền mặt khi nhận hàng(COD)</label><br>
                                        <input type="radio" id="bank" name="select-btn" value="1">
                                        <label for="bank"> Thanh toán bằng thẻ ngân hàng</label><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/validator.js"></script>
<script src="./assets/js/main.js"></script>
<script>
    Validator({
        form: '#form-2',
        formGroupSelector: '.form-group',
        errorSelector: '.form-message',
        rules: [
            Validator.isRequired('#hoten', 'Vui lòng nhập tên đầy đủ'),
            Validator.isRequired('#sdt'),
            Validator.isRequired('#diachi'),
            Validator.isEmail('#email')
        ],
        onSubmit: function (data) {
            console.log(data);
        }
    });

    $(".btn-pay").click(function (e) {
        e.preventDefault();
        const address = $("#diachi").val();
        const receive_name = $("#hoten").val();
        const email = $("#email").val();
        const phone_number = $("#sdt").val();
        const note = $("#textbox").val();
        const payment_method = $(".selection-btn input[type='radio']:checked").val();
        const total = $(".total_input").val();
        const customer_id = $(".user_id").val();
        if (address === '' || address == null) {
            alert("Bạn cần điền địa chỉ giao hàng")
        }
        if (receive_name === '' || receive_name == null) {
            alert("Bạn cần điền tên người nhận hàng")
        }
        if (email === '' || email == null) {
            alert("Bạn cần điền email")
        }
        if (phone_number === '' || phone_number == null) {
            alert("Bạn cần điền số điện thoại nhận hàng")
        }
        $.ajax({
            url: "CheckoutController",
            type: "post",
            data: {
                address: address,
                receive_name: receive_name,
                email: email,
                phone_number: phone_number,
                note: note,
                payment_method: payment_method,
                total: total,
                customer_id: customer_id
            },
            success: function (data) {
                alert(data);
                window.location.href = "http://localhost:8080/CuoiKiWeb_war/index.jsp"
            },
            error: function (data) {
                alert(data);
            }
        })
    })
</script>
</body>
</html>
<%}%>