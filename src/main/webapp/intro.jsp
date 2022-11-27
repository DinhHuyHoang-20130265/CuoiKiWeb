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
    <link rel="stylesheet" href="./assets/css/intro.css">
    <link rel="icon" href="./assets/img/logo/main.png" type="image/x-icon"/>
</head>
<style>
    .title-heading {
        margin: 0;
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

    .content-page p {
        font-size: 16px;
        padding: 5px 0;
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
<!-- content intro-->
<div class="content" style="margin-top: 30px">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="page-title">
                    <h1 class="title-head">
                        Giới thiệu
                    </h1>
                </div>
                <hr>
                <div class="content-page">
                    <div class="page-title">
                        <p>
                          <span style="text-align: center; font-size: 13px; line-height: 50%;">
                            Góp mặt trên thị trường Việt Nam từ năm 2021, P&T SHOP với định hướng không ngừng phát triển
                            để trở thành một trong những cửa hàng cung cấp các sản
                            phẩm giày đá bóng chính hãng tốt nhất Việt Nam</span>
                        </p>
                    </div>
                    <div class="tam-nhin">
                        <div class="left">
                            <h2 class="h2-title">
                                <strong>Tầm nhìn</strong>
                            </h2>
                            <p>
                                Tại P&T SHOP, chúng tôi luôn hướng đến việc cải tiến chất lượng
                                trải nghiệm của khách hàng thông qua việc đa dạng hóa các loại sản phẩm,
                                đầu tư nghiên cứu để đưa ra những tư vấn phù hợp với từng khách hàng một
                            </p>
                            <button class="button">Xem thêm</button>
                        </div>
                        <div class="right">
                            <img src="assets\img\logo\4.png" alt="nothing" style="width:400px;height:400px;">
                        </div>
                    </div>
                    <div class="su-menh">
                        <h2 class="h2-title">
                            <strong>II/ Sứ mệnh</strong>
                        </h2>
                        <p>
                            Đặt khách hàng làm trung tâm. Đáp ứng hiệu quả nhất mọi nhu cầu vì lợi ích khách hàng và
                            chất lượng dịch vụ
                            Đặt nhân sự là yếu tố quyết định và là nền tảng của sự phát triển. Không ngừng đào tạo và
                            xây dựng đội ngũ kế thừa.
                            Chia sẽ các quyền lợi với các thành viên trong công ty, cùng xây dựng và phát triển vì mục
                            tiêu chung của công ty.
                        </p>
                        <div class="ctner">
                            <div class="sm-container">
                                <div class="left">
                                    <div class="cont-txt">
                                        <h3>
                                            <strong>1. Trải nghiệm hoàn hảo</strong>
                                        </h3>
                                        <P>
                                            Thông qua việc tư vấn, hỗ trợ khách hàng tận tâm và nhanh nhất có thể.
                                        </P>
                                        <button class="button">Xem thêm</button>
                                    </div>
                                </div>
                                <div class="right">
                                    <img src="assets\img\logo\4.png" alt="nothing" style="float: right;">
                                </div>
                            </div>

                            <div class="sm-container">
                                <div class="left">
                                    <img src="assets\img\logo\4.png" alt="nothing" style="float: left;">
                                </div>
                                <div class="right">
                                    <div class="cont-txt">
                                        <h3>
                                            <strong>2. Sản phẩm chính hãng</strong>
                                        </h3>
                                        <P>
                                            Sản phẩm được P&T SHOP mua trực tiếp từ công ty và các trang web
                                            uy tín của Nike, adidas,
                                            Puma v.v… nên các bạn có thể yên tâm về nguồn gốc sản phẩm.
                                        </P>
                                        <button class="button">Xem thêm</button>
                                    </div>
                                    `
                                </div>
                            </div>
                            <div class="sm-container">
                                <div class="left">
                                    <div class="cont-txt">
                                        <h3>
                                            <strong>3. Chế độ dịch vụ</strong>
                                        </h3>
                                        <P>
                                            Những sản phẩm giày đá banh tại P&T SHOP được bảo hành 3 tháng,
                                            hỗ trợ trả góp 0% lãi suất qua Fundiin, Freeship toàn quốc
                                            khi khách hàng thanh toán chuyển khoản trước, tặng vớ & balo khi mua giày.
                                        </P>
                                        <button class="button">Xem thêm</button>
                                    </div>
                                </div>
                                <div class="right">
                                    <img src="assets\img\logo\4.png" alt="nothing" style="float: right;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <h2 class="h2-title">
                        <strong>III/ Cửa hàng của P&T SHOP</strong>
                    </h2>
                    <p>
                        Bạn có thể gặp chúng tôi ở:
                        <br>
                        <b>P&T SHOP Store I: 86 Đinh Bộ Lĩnh, P. 26 Q. Bình Thạnh, TP. HCM | ĐT: 0123456789</b>
                        <br>
                        <b>P&T SHOP Store II: 26 Đinh Bộ Lĩnh, P. 26 Q. Bình Thạnh, TP. HCM | ĐT: 0123456789</b>
                        <br>

                    </p>
                    <hr>
                    <p>
                        Thời gian hoạt động của shop: từ 9h tới 21h hàng ngày và cả 7 ngày trong tuần
                        . Rất vui được đón tiếp các bạn.
                        <br>
                        Xin cảm ơn các bạn đã tin tưởng và ủng hộ P&T SHOP.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end intro-->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/main.js"></script>
</body>
</html>