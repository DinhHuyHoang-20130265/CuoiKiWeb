<%@ page import="vn.edu.hcmuaf.fit.beans.news.News" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsService" %>
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
    <link rel="stylesheet" href="./assets/css/news.css">
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
    @media (max-width: 1199px) {
        .card-img-top {
            width: 202px !important;
            height: 130px !important;
        }
    }

    @media (max-width: 991px) {
        .card-img-top {
            width: 314px !important;
            height: 170px !important;
        }
    }

    /* tablet */
    @media (min-width: 740px) and (max-width: 1023px) {
        .owl-item {
            width: 396px;
            padding: 16px 0;
        }
    }

    /* mobile */
    @media (max-width: 739px) {
        .owl-item {
            float: unset;
            padding: 16px 0;
        }
    }
</style>
<body>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<!-- content -->
<div class="">
    <div class="container">
        <div class="row mb-20" style="margin: 20px 0;" id="news">
            <%List<News> listNews = NewsService.getInstance().getListNewsByPage(1);%>
            <% if (listNews != null)
                for (News news : listNews) {%>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-20 moreBox" style="margin-bottom: 20px;">
                <a href="newDetail.jsp?id=<%=news.getNews_id()%>" class="product__new-item">
                    <div class="card" style="width: 100%">
                        <img class="card-img-top" src="<%=news.getNews_img_link()%>" alt="Card image cap"
                             style="width:247px; height:150px">
                        <div class="card-body">
                            <p style="font-size:12px"><i class="far fa-clock"
                                                         style="margin-right:2px"></i><%=news.getPosted_date()%>
                            </p>
                            <h5 class="card-title custom__name-product title-news">
                                <%=news.getNews_title()%>
                            </h5>
                            <p class="card-text custom__name-product"
                               style="font-weight: 400;"><%=news.getDescription()%>></p>
                        </div>
                    </div>
                </a>
            </div>
            <%}%>
        </div>
    </div>
</div>
<div class="loadmore">
    <a class="loadmore-btn" id="loadMore" style="cursor: pointer;">Tải thêm</a>
    <input type="text" id="page" value="2" style="display: none">
</div>
<!-- end content -->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/main.js"></script>
<script>
    $(document).ready(function () {
        $("#loadMore").click(function (e) {
            e.preventDefault();
            const page = $("#page").val();
            $.ajax({
                type: 'get',
                url: "LoadMoreNewsController",
                data: {
                    page: page
                },
                success: function (data) {
                    $("#news").append(data);
                    const page = $("#page").val();
                    $("#page").val((parseInt(page) + 1) + "");
                }
            })
        })
    })
</script>
</body>

</html>