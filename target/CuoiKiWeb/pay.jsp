<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.cart.CartKey" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.cart.Cart" %>
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
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<div class="content">
    <div class="wrap">
        <div class="container">
            <form action="">
                <div class="row">
                    <div class="summary col-lg-6 col-12 hidden">
                        <div class="summary-heading">
                            <div class="summary-heading-title">
                                <h4>Thông tin đơn hàng</h4>
                            </div>
                            <div class="summary-heading-price">
                                <h4>840.000<i class="fas fa-chevron-down"
                                              style="margin-left: 20px;margin-right: 5px;transform:rotate(90deg);transition: transform 0.4s;"></i>
                                </h4>
                            </div>
                        </div>
                        <div class="summary-content hidden">
                            <div class="sliderbar">
                                <div class="sliderbar-content">
                                    <div class="row row-sliderbar">
                                        <div class="col-6">
                                            <img src="./assets/imgProduct/images/men/2.jpg" alt="" width="80%">
                                            <span class="notice">1</span>
                                        </div>
                                        <div class="col-6 col-8">
                                            <h5 class="cart-name" style="display: flex;align-items: center;">Áo len
                                                <div class="foo light_blue"></div>
                                                <p class="size_choosed" style="font-size: 12px;">XL</p>
                                            </h5>
                                            <span>420,000₫</span>
                                        </div>
                                    </div>
                                    <div class="row row-sliderbar">
                                        <div class="col-6">
                                            <img src="./assets/imgProduct/images/men/2.jpg" alt="" width="80%">
                                            <span class="notice">1</span>
                                        </div>
                                        <div class="col-6 col-8">
                                            <h5 class="cart-name" style="display: flex;align-items: center;">Áo len sọc
                                                phối màu
                                                <div class="foo red"></div>
                                                <p class="size_choosed" style="font-size: 12px;">S</p>
                                            </h5>
                                            <span>420,000₫</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="slider-footer">
                                    <div class="subtotal">
                                        <div class="row row-sliderbar-footer">
                                            <div class="col-6"><span>Tạm tính:</span></div>
                                            <div class="col-6 text-right"><span>840,000₫</span></div>
                                        </div>
                                        <div class="row row-sliderbar-footer">
                                            <div class="col-6"><span>Phí vận chuyển</span></div>
                                            <div class="col-6 text-right"><span>30,000₫</span></div>
                                        </div>
                                    </div>
                                    <div class="total">
                                        <div class="row row-sliderbar-footer">
                                            <div class="col-6"><span>Tổng cộng:</span></div>
                                            <div class="col-6 text-right"><span>870,000₫</span></div>
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
                                            <input type="radio" id="cash" name="select-btn" value="cash">
                                            <label for="cash"> Thanh toán bằng tiền mặt khi nhận hàng(COD)</label><br>
                                            <input type="radio" id="visa" name="select-btn" value="visa">
                                            <label for="visa"> Thanh toán bằng thẻ Visa</label><br>
                                            <input type="radio" id="bank" name="select-btn" value="bank">
                                            <label for="bank"> Thanh toán bằng thẻ ngân hàng</label><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                <div class="main-customer-info">
                                    <div class="main-customer-info-img">
                                        <img src="./assets/img/product/noavatar.png" alt="" width="60px" height="60px">
                                    </div>
                                </div>
                                <div class="fieldset">
                                    <div class="fieldset-address form-group">
                                        <label for="diachi" class="form-label">Địa chỉ</label>
                                        <input id="diachi" type="text" class="form-control">
                                        <span class="form-message"></span>
                                    </div>
                                    <div class="fieldset-name form-group">
                                        <label for="hoten" class="form-label">Họ tên</label>
                                        <input id="hoten" type="text" class="form-control">
                                        <span class="form-message"></span>
                                    </div>
                                    <div class="fieldset-phone form-group">
                                        <label for="sdt" class="form-label">Số điện thoại</label>
                                        <input id="sdt" type="text" class="form-control">
                                        <span class="form-message"></span>
                                    </div>
<%--                                    <div class="fieldset-phone form-group">--%>
<%--                                        <label for="tinhtp" class="form-label">Tỉnh/Thành Phố</label>--%>
<%--                                        <select id="tinhtp" type="text" class="form-control">--%>
<%--                                            <option value="tinh_tp">Chọn Tỉnh/ thành phố</option>--%>
<%--                                            <option value="254">Hà Nội</option>--%>
<%--                                            <option value="255">Hồ Chí Minh</option>--%>
<%--                                            <option value="256">An Giang</option>--%>
<%--                                            <option value="257">Bà Rịa - Vũng Tàu</option>--%>
<%--                                            <option value="258">Bắc Ninh</option>--%>
<%--                                            <option value="259">Bắc Giang</option>--%>
<%--                                            <option value="260">Bình Dương</option>--%>
<%--                                            <option value="261">Bình Định</option>--%>
<%--                                            <option value="262">Bình Phước</option>--%>
<%--                                            <option value="263">Bình Thuận</option>--%>
<%--                                            <option value="264">Bến Tre</option>--%>
<%--                                            <option value="265">Bắc Cạn</option>--%>
<%--                                            <option value="266">Cần Thơ</option>--%>
<%--                                            <option value="267">Khánh Hòa</option>--%>
<%--                                            <option value="268">Thừa Thiên Huế</option>--%>
<%--                                            <option value="269">Lào Cai</option>--%>
<%--                                            <option value="270">Quảng Ninh</option>--%>
<%--                                            <option value="271">Đồng Nai</option>--%>
<%--                                            <option value="272">Nam Định</option>--%>
<%--                                            <option value="273">Cà Mau</option>--%>
<%--                                            <option value="274">Cao Bằng</option>--%>
<%--                                            <option value="275">Gia Lai</option>--%>
<%--                                            <option value="276">Hà Giang</option>--%>
<%--                                            <option value="277">Hà Nam</option>--%>
<%--                                            <option value="278">Hà Tĩnh</option>--%>
<%--                                            <option value="279">Hải Dương</option>--%>
<%--                                            <option value="280">Hải Phòng</option>--%>
<%--                                            <option value="281">Hoà Bình</option>--%>
<%--                                            <option value="282">Hưng Yên</option>--%>
<%--                                            <option value="283">Kiên Giang</option>--%>
<%--                                            <option value="284">Kon Tum</option>--%>
<%--                                            <option value="285">Lai Châu</option>--%>
<%--                                            <option value="285">Lai Châu</option>--%>
<%--                                            <option value="287">Lạng Sơn</option>--%>
<%--                                            <option value="288">Long An</option>--%>
<%--                                            <option value="289">Nghệ An</option>--%>
<%--                                            <option value="290">Ninh Bình</option>--%>
<%--                                            <option value="291">Ninh Thuận</option>--%>
<%--                                            <option value="292">Phú Thọ</option>--%>
<%--                                            <option value="293">Phú Yên</option>--%>
<%--                                            <option value="294">Quảng Bình</option>--%>
<%--                                            <option value="295">Quảng Nam</option>--%>
<%--                                            <option value="296">Quảng Ngãi</option>--%>
<%--                                            <option value="297">Quảng Trị</option>--%>
<%--                                            <option value="298">Sóc Trăng</option>--%>
<%--                                            <option value="299">Sơn La</option>--%>
<%--                                            <option value="300">Tây Ninh</option>--%>
<%--                                            <option value="301">Thái Bình</option>--%>
<%--                                            <option value="302">Thái Nguyên</option>--%>
<%--                                            <option value="303">Thanh Hoá</option>--%>
<%--                                            <option value="304">Tiền Giang</option>--%>
<%--                                            <option value="305">Trà Vinh</option>--%>
<%--                                            <option value="306">Tuyên Quang</option>--%>
<%--                                            <option value="307">Vĩnh Long</option>--%>
<%--                                            <option value="308">Vĩnh Phúc</option>--%>
<%--                                            <option value="309">Yên Bái</option>--%>
<%--                                            <option value="310">Đắk Lắk</option>--%>
<%--                                            <option value="311">Đồng Tháp</option>--%>
<%--                                            <option value="312">Đà Nẵng</option>--%>
<%--                                            <option value="313">Đắc Nông</option>--%>
<%--                                            <option value="314">Hậu Giang</option>--%>
<%--                                            <option value="315">Bạc Liêu</option>--%>
<%--                                            <option value="316">Điện Biên</option>--%>
<%--                                        </select>--%>
<%--                                        <span class="form-message"></span>--%>
<%--                                    </div>--%>
<%--                                    <div class="fieldset-phone form-group">--%>
<%--                                        <label for="quanhuyen" class="form-label">Quận/Huyện</label>--%>
<%--                                        <select id="quanhuyen" type="text" class="form-control">--%>
<%--                                            <option value="quan_huyen">Chọn Quận/Huyện</option>--%>
<%--                                        </select>--%>
<%--                                        <span class="form-message"></span>--%>
<%--                                    </div>--%>
<%--                                    <div class="fieldset-phone form-group">--%>
<%--                                        <label for="phuongxa" class="form-label">Phường/Xã</label>--%>
<%--                                        <select id="phuongxa" type="text" class="form-control">--%>
<%--                                            <option value="phuong_xa">Chọn Phường/Xã</option>--%>
<%--                                        </select>--%>
<%--                                        <span class="form-message"></span>--%>
<%--                                    </div>--%>
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
                                    <button class="btn-pay form-submit">Thanh toán</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-12 hidden-sm hidden-xs" style="background-color:#f3f3f3;">
                        <% Cart cart = (Cart) request.getSession().getAttribute("cart");
                            NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
                        <% if (cart != null) {
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
                                        <%--                                        <span>420,000₫</span>--%>
                                        <%if (cart.getData().get(p).getSales() != null) {%>
                                        <span><%=format.format(cart.getData().get(p).getPrice() * 0.01 * (100 - cart.getData().get(p).getSales().getDiscount_rate()))%>₫ - (-<%=cart.getData().get(p).getSales().getDiscount_rate()%>%)</span>
                                        <%} else {%>
                                        <span><%=format.format(cart.getData().get(p).getPrice())%>₫</span>
                                        <%}%>
                                    </div>
                                </div>
                                <%--                                <div class="row row-sliderbar">--%>
                                <%--                                    <div class="col-4">--%>
                                <%--                                        <img src="./assets/imgProduct/images/men/2.jpg" alt="" width="80%">--%>
                                <%--                                        <span class="notice">1</span>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="col-6">--%>
                                <%--                                        <h5 class="cart-name" style="margin-bottom: 0;">Áo len sọc phối màu</h5>--%>
                                <%--                                        <div class="foo red"></div>--%>
                                <%--                                        <p class="size_choosed" style="font-size: 12px;">S</p>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="col-2">--%>
                                <%--                                        <span>420,000₫</span>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                            </div>
                            <%
                                    }
                                }
                            %>
                            <div class="slider-footer">
                                <div class="subtotal">
                                    <div class="row row-sliderbar-footer">
                                        <div class="col-6"><span>Tạm tính:</span></div>
                                        <div class="col-6 text-right"><span><%=format.format(cart.total())%>₫</span></div>
                                    </div>
                                    <div class="row row-sliderbar-footer">
                                        <div class="col-6"><span>Phí vận chuyển</span></div>
                                        <div class="col-6 text-right"><span>30,000₫</span></div>
                                    </div>
                                </div>
                                <div class="total">
                                    <div class="row row-sliderbar-footer">
                                        <div class="col-6"><span>Tổng cộng:</span></div>
                                        <div class="col-6 text-right"><span><%=format.format(cart.total() + 30000)%>₫</span></div>
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
                                        <input type="radio" id="cash" name="select-btn" value="cash">
                                        <label for="cash"> Thanh toán bằng tiền mặt khi nhận hàng(COD)</label><br>
                                        <input type="radio" id="visa" name="select-btn" value="visa">
                                        <label for="visa"> Thanh toán bằng thẻ Visa</label><br>
                                        <input type="radio" id="bank" name="select-btn" value="bank">
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
            Validator.isEmail('#email'),
            Validator.isRequired('#password'),
            Validator.minLength('#password', 6),
            Validator.isRequired('#password_confirmation'),
        ],
        onSubmit: function (data) {
            console.log(data);
        }
    });
</script>
</body>

</html>