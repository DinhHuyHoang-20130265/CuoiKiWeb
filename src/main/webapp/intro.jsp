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
                        Gi???i thi???u
                    </h1>
                </div>
                <hr>
                <div class="content-page">
                    <div class="page-title">
                        <p>
                          <span style="text-align: center; font-size: 13px; line-height: 50%;">
                            G??p m???t tr??n th??? tr?????ng Vi???t Nam t??? n??m 2021, P&T SHOP v???i ?????nh h?????ng kh??ng ng???ng ph??t tri???n
                            ????? tr??? th??nh m???t trong nh???ng c???a h??ng cung c???p c??c s???n
                            ph???m gi??y ???? b??ng ch??nh h??ng t???t nh???t Vi???t Nam</span>
                        </p>
                    </div>
                    <div class="tam-nhin">
                        <div class="left">
                            <h2 class="h2-title">
                                <strong>T???m nh??n</strong>
                            </h2>
                            <p>
                                T???i P&T SHOP, ch??ng t??i lu??n h?????ng ?????n vi???c c???i ti???n ch???t l?????ng
                                tr???i nghi???m c???a kh??ch h??ng th??ng qua vi???c ??a d???ng h??a c??c lo???i s???n ph???m,
                                ?????u t?? nghi??n c???u ????? ????a ra nh???ng t?? v???n ph?? h???p v???i t???ng kh??ch h??ng m???t
                            </p>
                            <button class="button">Xem th??m</button>
                        </div>
                        <div class="right">
                            <img src="assets\img\logo\4.png" alt="nothing" style="width:400px;height:400px;">
                        </div>
                    </div>
                    <div class="su-menh">
                        <h2 class="h2-title">
                            <strong>II/ S??? m???nh</strong>
                        </h2>
                        <p>
                            ?????t kh??ch h??ng l??m trung t??m. ????p ???ng hi???u qu??? nh???t m???i nhu c???u v?? l???i ??ch kh??ch h??ng v??
                            ch???t l?????ng d???ch v???
                            ?????t nh??n s??? l?? y???u t??? quy???t ?????nh v?? l?? n???n t???ng c???a s??? ph??t tri???n. Kh??ng ng???ng ????o t???o v??
                            x??y d???ng ?????i ng?? k??? th???a.
                            Chia s??? c??c quy???n l???i v???i c??c th??nh vi??n trong c??ng ty, c??ng x??y d???ng v?? ph??t tri???n v?? m???c
                            ti??u chung c???a c??ng ty.
                        </p>
                        <div class="ctner">
                            <div class="sm-container">
                                <div class="left">
                                    <div class="cont-txt">
                                        <h3>
                                            <strong>1. Tr???i nghi???m ho??n h???o</strong>
                                        </h3>
                                        <P>
                                            Th??ng qua vi???c t?? v???n, h??? tr??? kh??ch h??ng t???n t??m v?? nhanh nh???t c?? th???.
                                        </P>
                                        <button class="button">Xem th??m</button>
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
                                            <strong>2. S???n ph???m ch??nh h??ng</strong>
                                        </h3>
                                        <P>
                                            S???n ph???m ???????c P&T SHOP mua tr???c ti???p t??? c??ng ty v?? c??c trang web
                                            uy t??n c???a Nike, adidas,
                                            Puma v.v??? n??n c??c b???n c?? th??? y??n t??m v??? ngu???n g???c s???n ph???m.
                                        </P>
                                        <button class="button">Xem th??m</button>
                                    </div>
                                    `
                                </div>
                            </div>
                            <div class="sm-container">
                                <div class="left">
                                    <div class="cont-txt">
                                        <h3>
                                            <strong>3. Ch??? ????? d???ch v???</strong>
                                        </h3>
                                        <P>
                                            Nh???ng s???n ph???m gi??y ???? banh t???i P&T SHOP ???????c b???o h??nh 3 th??ng,
                                            h??? tr??? tr??? g??p 0% l??i su???t qua Fundiin, Freeship to??n qu???c
                                            khi kh??ch h??ng thanh to??n chuy???n kho???n tr?????c, t???ng v??? & balo khi mua gi??y.
                                        </P>
                                        <button class="button">Xem th??m</button>
                                    </div>
                                </div>
                                <div class="right">
                                    <img src="assets\img\logo\4.png" alt="nothing" style="float: right;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <h2 class="h2-title">
                        <strong>III/ C???a h??ng c???a P&T SHOP</strong>
                    </h2>
                    <p>
                        B???n c?? th??? g???p ch??ng t??i ???:
                        <br>
                        <b>P&T SHOP Store I: 86 ??inh B??? L??nh, P. 26 Q. B??nh Th???nh, TP. HCM | ??T: 0123456789</b>
                        <br>
                        <b>P&T SHOP Store II: 26 ??inh B??? L??nh, P. 26 Q. B??nh Th???nh, TP. HCM | ??T: 0123456789</b>
                        <br>

                    </p>
                    <hr>
                    <p>
                        Th???i gian ho???t ?????ng c???a shop: t??? 9h t???i 21h h??ng ng??y v?? c??? 7 ng??y trong tu???n
                        . R???t vui ???????c ????n ti???p c??c b???n.
                        <br>
                        Xin c???m ??n c??c b???n ???? tin t?????ng v?? ???ng h??? P&T SHOP.
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