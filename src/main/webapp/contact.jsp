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
    <link rel="stylesheet" href="./assets/css/reponsive1.css">
    <link rel="stylesheet" href="./assets/css/menu-contact.css">
    <link rel="icon" href="./assets/img/logo/main.png" type="image/x-icon"/>
</head>
<style>
    .title-heading {
        color: #36424b;
        font-size: 18px;
        font-weight: 500;
        padding: 0;
        margin-top: 0;
        margin-bottom: 10px;
        position: relative;
        text-transform: uppercase;
    }

    .contact-info {
        padding: 0;
    }

    .contact-info li {
        display: table;
        margin-bottom: 7px;
        font-size: 14px;
    }

    .text-contact {
        font-style: italic;
        color: #707e89;
        font-size: 12px;
    }

    .mapbox {
        border-top: 1px solid #e8e9f1;
        margin-top: 30px;
        height: 350px;
        overflow: hidden;
        border: 10px solid #e5e5e5;
        border-radius: 3px;
    }

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
    }

    /* tablet */
    @media (min-width: 740px) and (max-width: 1023px) {

        textarea {
            width: 100%;
        }

    }

    /* mobile */
    @media (max-width: 739px) {

    }
</style>
<body>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<div class="content" style="margin-top: 30px">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-12">
                <div class="info-shop">
                    <h3 class="title-heading">Thông tin liên hệ</h3>
                    <ul class="contact-info">
                        <li>P&T SHOP xin hân hạnh phục vụ quý khách với những bộ quần áo phục kiện rất nhiều khách
                            hàng
                            tại Việt Nam ưa thích và chọn lựa.
                        </li>
                        <li class="footer__item">
                            <p><i class="fas fa-search-location footer__item-icon"></i> Ho Chi Minh, Viet Nam</p>
                        </li>
                        <li class="footer__item">
                            <p><i class="fas fa-phone-square-alt footer__item-icon"></i> Số điện thoại: <a
                                    href="tel:0123456789">0123456789</a></p>
                        </li>
                        <li class="footer__item">
                            <p><i class="fas fa-envelope-square footer__item-icon"></i> Email: <a
                                    href="mailto:abc@gmail.com">abc@gmail.com</a></p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-8 col-12">
                <div class="page-login">
                    <h3 class="title-heading">Gửi thông tin</h3>
                    <span class="text-contact">Bạn hãy điền nội dung tin nhắn vào form dưới đây
                            và gửi cho chúng tôi. Chúng tôi sẽ trả lời bạn sau khi nhận được.
                        </span>
                    <form action=""
                          method="post"
                          class="form" id="form-1">
                        <div class="form-group">
                            <label for="fullname" class="form-label">Tên đầy đủ</label>
                            <input id="fullname" name="fullname" data-value="" type="text" placeholder="VD: User1"
                                   class="form-control">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input id="email" name="email" data-value="" type="text" placeholder="VD: email@domain.com"
                                   class="form-control">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="form-label">Điện thoại</label>
                            <input id="phone" pattern="[0-9]{10}" name="phone" data-value="" type="tel" placeholder="0912*******"
                                   class="form-control">
                            <span class="form-message"></span>
                        </div>
                        <label for="phone" class="form-label">Nội dung</label>
                        <div class="form-group">
                            <textarea name="noidung" id="noidung" data-value="" cols="131" rows="10"></textarea>
                            <span class="form-message"></span>
                        </div>
                        <button class="form-submit btn-blocker" style="border-radius: unset;">
                            Gửi tin nhắn
<%--                            <p class="fas fa-arrow-right"--%>
<%--                                style="font-size: 16px;margin-left: 10px;"--%>
<%--                                id="submit-btn">--%>
<%--                        </p>--%>
                        </button>
                    </form>
                </div>
            </div>
            <div class="col-12">
                <h3 style="text-align: center; margin-top:30px;border-top:1px solid #333;padding-top:10px">Bản đồ cửa
                    hàng</h3>
                <div class="mapbox">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.954111076736!2d106.7086283147493!3d10.81482379229551!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175289741790d39%3A0x95362685e34cec2f!2zQuG6v24gWGUgTWnhu4FuIMSQw7RuZyDEkGluaCBC4buZIEzEqW5o!5e0!3m2!1svi!2s!4v1637980933100!5m2!1svi!2s"
                            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/main.js"></script>
<script src="./assets/js/validator.js"></script>
<script>
    // Validator({
    //     form: '#form-1',
    //     formGroupSelector: '.form-group',
    //     errorSelector: '.form-message',
    //     rules: [
    //         Validator.isRequired('#fullname', 'Vui lòng nhập tên đầy đủ'),
    //         Validator.isRequired('#email'),
    //         Validator.isEmail('#email'),
    //         Validator.minLength('#password', 6),
    //         Validator.isRequired('#password_confirmation'),
    //         Validator.isRequired('input[name="gender"]'),
    //         Validator.isConfirmed('#password_confirmation', function () {
    //             return document.querySelector('#form-1 #password').value;
    //         }, 'Mật khẩu nhập lại không chính xác'),
    //         Validator.isRequired('#noidung')
    //     ],
    //     onSubmit: function (data) {
    //         // call api
    //         console.log(data);
    //     }
    // });
</script>
<script>
    function formSubmit(){
        const name_ipt = document.getElementById("fullname");
        const email_ipt = document.getElementById("email");
        const phone_ipt = document.getElementById("phone");
        const noidung_ipt = document.getElementById("noidung");
        const submit_btn = document.getElementsByClassName("form-submit");
        name_ipt.readOnly = true;
        email_ipt.readOnly = true;
        phone_ipt.readOnly = true;
        noidung_ipt.readOnly = true;
        submit_btn.disable = true;
    }
</script>
<script>
    $(".form-submit").click(function (evt){
        evt.preventDefault();
        const fullname = $("#fullname").val();
        const email = $("#email").val();
        const phone = $("#phone").val();
        const noidung = $("#noidung").val();
        if(fullname === null){
            alert("Không được để trống họ tên")
        } else if(fullname < 5){
            alert("Họ tên không hợp lệ")
        }
        if(email === null){
            alert("Không được để trống email")
        }
        if(phone === null){
            alert("Không được để trống số điện thoại")
        }
        if(noidung === null){
            alert("Nội dung không tồn tại")
        }
        formSubmit();
        console.log(fullname)
        console.log(phone)
        console.log(email)
        console.log(noidung)
        $.ajax({
            url: "UploadContentController",
            type: "post",
            data: {
                fullname: fullname,
                email: email,
                phone: phone,
                noidung: noidung,
            },
            success: function () {
                console.log("Bạn đã gửi contact thành công");
            },
            error: function () {
                console.log("Bạn đã gửi contact thất bại");
            }
        })
    });
</script>
</body>
</html>