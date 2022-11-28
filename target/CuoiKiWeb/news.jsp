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
  <link rel="icon" href="./assets/img/logo/main.png" type="image/x-icon" />
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
      </div>
    </div>
  </div>
  <div class="loadmore">
    <a class="loadmore-btn" id="loadMore" style="cursor: pointer;">Tải thêm</a>
  </div>
  <!-- end content -->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
  <script src="./assets/js/jquery-3.6.1.min.js"></script>
  <script src="./assets/js/bootstrap.min.js"></script>
  <script src="./assets/js/main.js"></script>
  <script>
    $(document).ready(async function () {
      //var object = $.parseJSON(JSON.stringify(await $.getJSON('./assets/js/news.json')));
      var object = $.parseJSON(`[
      {
          "id": "n01",
          "date": "10/22/22",
          "title": "Post hình check-in, rinh quà hấp dẫn",
          "content": "Tin vui không thể bỏ lỡ cho các FRIENDs của P&T vào tháng 11 này!",
          "imglink": "news/1"
      },
      {
          "id": "n02",
          "date": "10/22/22",
          "title": "Happy halloween with friends",
          "content": "Món quà bí mật sẽ được bật mí và dành tặng các FRIENDS…",
          "imglink": "news/2"
      },
      {
          "id": "n03",
          "date": "9/29/22",
          "title": "Thu cũ đổi mới - Giảm ngay 20% ",
          "content": "Cơ hội lý tưởng để “reset” tủ đồ của bạn mà vẫn đảm bảo “kinh tế” với chương trình “Thu cũ đổi mới”…",
          "imglink": "news/3"
      },
      {
          "id": "n04",
          "date": "9/28/22",
          "title": "Khai tiệc sinh nhật, bật tung bất ngờ",
          "content": "Đón tuổi mới thật hoành tráng, P&T đã sẵn sàng “tiếp đãi” FRIENDs bữa tiệc sinh nhật với chuỗi hoạt động …",
          "imglink": "news/4"
      },
      {
          "id": "n05",
          "date": "9/14/22",
          "title": "Special Offer | Cơn lốc đồng giá",
          "content": "Tin vui cho hội nghiện shopping, CHỈ VỚI 99K là bạn đã sở hữu được ngay những cực phẩm từ P&T…",
          "imglink": "news/5"
      },
      {
          "id": "n06",
          "date": "8/30/22",
          "title": "Hoài niệm tuổi thơ",
          "content": "Trung Thu đang dần xuất hiện trong từng ngõ phố, mùa trăng năm nay, P&T chân thành bày tỏ tấm lòng...",
          "imglink": "news/6"
      },
      {
          "id": "n07",
          "date": "8/20/22",
          "title": "Mừng đại lễ 2/9 rộn ràng ưu đãi",
          "content": "Cơ hội “vàng” nâng cấp ngoại hình mùa lễ hội đã đến, chuẩn bị nhanh “wish list” của bạn để không bỏ lỡ chương trình ưu đãi siêu hấp dẫn ",
          "imglink": "news/7"
      },
      {
          "id": "n08",
          "date": "8/2/22",
          "title": "Mua sắm thả ga - Mua đồ siêu chất",
          "content": "Cơ hội “vàng” dành riêng cho các FRIENDs để sở hữu các items “thiên biến vạn hóa” đẹp quên sầu mùa tựu trường",
          "imglink": "news/8"
      },
      {
          "id": "n09",
          "date": "7/8/22",
          "title": "Khai trương cửa hàng tại Thủ Dầu Một",
          "content": "Sau bao ngày chờ đợi, cửa hàng mới của P&T tại Quang Trung - Thủ Dầu Một sẽ chính thức khai trương",
          "imglink": "news/9"
      },
      {
          "id": "n10",
          "date": "6/19/22",
          "title": "Thưởng thức canh cá sale up to 15%",
          "content": "P&T sale lớn toàn bộ sản phẩm nhân dịp “Cá tháng Tư” với mức sale lên đến 15% cho FRIENDs khi mua sắm qua hình thức trực tuyến",
          "imglink": "news/10"
      }
  ]`);
      var listItem = document.querySelector('#news');
      function initRender() {
        var listNews = object.map(function (newItem) {
          return `<div class="col-lg-3 col-md-6 col-sm-12 mb-20 moreBox" style="margin-bottom: 20px; display:none">
                      <a href="newDetail.jsp" class="product__new-item">
                        <div class="card" style="width: 100%">
                          <img class="card-img-top" src="./assets/imgNews/${newItem.imglink}-min.jpg" alt="Card image cap"
                          style="width:247px; height:150px"  >
                          <div class="card-body">
                            <p style="font-size:12px"><i class="far fa-clock" style="margin-right:2px"></i>${newItem.date}</p>
                            <h5 class="card-title custom__name-product title-news">
                              ${newItem.title}
                            </h5>
                            <p class="card-text custom__name-product" style="font-weight: 400;">${newItem.content}</p>
                          </div>
                      </div>
                      </a>
                    </div>`
        });
        var renderList = listNews.join('');
        listItem.innerHTML = renderList;
      }
      function defaultLoadmore() {
        $(".moreBox").slice(0, 4).show();
        $("#loadMore").click(function (e) {
          e.preventDefault();
          $(".moreBox:hidden").slice(0, 4).show();
          if ($(".moreBox:hidden").length == 0) {
            $("#loadMore").fadeOut('slow');
          }
        });
      }
      initRender();
      defaultLoadmore();
    });
  </script>
</body>

</html>