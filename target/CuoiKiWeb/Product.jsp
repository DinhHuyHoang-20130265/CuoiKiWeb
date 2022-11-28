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
    <link rel="stylesheet" href="./assets/css/product.css">
    <link rel="stylesheet" href="./assets/css/productdetail.css">
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
        .sortby {
            float: left;
        }

        .sortby label {
            display: none;
        }

        .sort-left {
            margin-bottom: 20px;
        }

        .sortby2 {
            display: block;
        }

        .sortby {
            float: left;
        }
    }

    /* tablet */
    @media (min-width: 740px) and (max-width: 1023px) {
        .card:hover .hover-icon {
            display: none;
        }
    }

    /* mobile */
    @media (max-width: 739px) {
        .card:hover .hover-icon {
            display: none;
        }
    }
</style>

<body>
<jsp:include page="Layout/_LayoutHeader.jsp"></jsp:include>
<!-- product -->
<div class="product">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-12 hidden-xs hidden-sm">
                <div class="product__filter">
                    <div class="product__filter-price">
                        <h4 class="product__filter-heading">
                            <h7>-</h7>
                            Khoảng giá <i class="fi-rs-minus" id="minus-1"></i> <i class="fi-rs-plus hidden"
                                                                                   id="plus-1"></i>
                        </h4>
                        <ul id="khoanggia" class="product__filter-ckeckbox">
                            <li class="product__filter-item">
                                <label class="form-check-label" for="kg0">
                                    <input type="radio" class="form-check-input checkGia" id="kg0" name="optradio"
                                           value="-1"><span>Tất
                      cả</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="kg1">
                                    <input type="radio" class="form-check-input checkGia" id="kg1" name="optradio"
                                           value="0-100000"><span>Dưới 100,000đ</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="kg2">
                                    <input type="radio" class="form-check-input checkGia" id="kg2" name="optradio"
                                           value="100000-200000"><span>100,000đ - 200,000đ</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="kg3">
                                    <input type="radio" class="form-check-input checkGia" id="kg3" name="optradio"
                                           value="200000-300000"><span>200,000đ - 300,000đ</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="kg4">
                                    <input type="radio" class="form-check-input checkGia" id="kg4" name="optradio"
                                           value="300000-400000"><span>300,000đ - 400,000đ</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="kg5">
                                    <input type="radio" class="form-check-input checkGia" id="kg5" name="optradio"
                                           value="400000-100000000"><span>Trên 400,000đ</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                    <div class="product__filter-trademark">
                        <h4 class="product__filter-heading">
                            <h7>-</h7>
                            Màu sắc<i class="fi-rs-minus" id="minus-2"></i> <i class="fi-rs-plus hidden"
                                                                               id="plus-2"></i>
                        </h4>

                        <ul id="color" class="color-box">
                            <li class="product__filter-item">
                                <label class="form-check-label">
                                    <div class="foo black th1"></div>
                                    <div class="foo dark_grey"></div>
                                    <div class="foo grey"></div>
                                    <div class="foo light_blue"></div>
                                    <div class="foo blue"></div>
                                    <div class="foo dark_blue"></div>
                                    <div class="foo dark_green"></div>
                                </label>
                                <label class="form-check-label">
                                    <div class="foo green"></div>
                                    <div class="foo purple"></div>
                                    <div class="foo pink"></div>
                                    <div class="foo yellow"></div>
                                    <div class="foo orange"></div>
                                    <div class="foo red"></div>
                                    <div class="foo brown"></div>
                                </label>
                            </li>
                        </ul>
                    </div>
                    <div class="product__filter-size">
                        <h4 class="product__filter-heading">
                            <h7>-</h7>
                            Kích cỡ <i class="fi-rs-minus" id="minus-3"></i> <i class="fi-rs-plus hidden"
                                                                                id="plus-3"></i>
                        </h4>
                        <ul id="size" class="product__filter-ckeckbox">
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size1">
                                    <input type="checkbox" class="form-check-input checksize" id="size1" name="option2"><span>S</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size2">
                                    <input type="checkbox" class="form-check-input checksize" id="size2" name="option2"><span>M</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size3">
                                    <input type="checkbox" class="form-check-input checksize" id="size3" name="option2"><span>L</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size4">
                                    <input type="checkbox" class="form-check-input checksize" id="size4" name="option2"><span>XL</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size5">
                                    <input type="checkbox" class="form-check-input checksize" id="size5" name="option2"><span>2XL</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size6">
                                    <input type="checkbox" class="form-check-input checksize" id="size6" name="option2"><span>28</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size7">
                                    <input type="checkbox" class="form-check-input checksize" id="size7" name="option2"><span>29</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size8">
                                    <input type="checkbox" class="form-check-input checksize" id="size8" name="option2"><span>30</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size9">
                                    <input type="checkbox" class="form-check-input checksize" id="size9" name="option2"><span>31</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size10">
                                    <input type="checkbox" class="form-check-input checksize" id="size10"
                                           name="option2"><span>32</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size11">
                                    <input type="checkbox" class="form-check-input checksize" id="size11"
                                           name="option2"><span>34</span>
                                </label>
                            </li>
                            <li class="product__filter-item">
                                <label class="form-check-label" for="size12">
                                    <input type="checkbox" class="form-check-input checksize" id="size12"
                                           name="option2"><span>36</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-12">
                <div class="sort-wrap row">
                    <div class="sort-left col-12 col-lg-6">
                        <h1 class="coll-name">Tất cả sản phẩm</h1>
                    </div>
                    <div class="sort-right col-12 col-lg-6">
                        <div class="sortby">
                            <label>Sắp xếp theo:</label>
                            <div class="dropdown">
                                <button type="button" class="btn btn-dark dropdown-toggle" id="dropdownMenuButton"
                                        data-toggle="dropdown">
                                    Sản phẩm nổi bật
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item isactive" id="sort0">Sản phẩm nổi bật</a>
                                    <a class="dropdown-item" id="sort1">Giá: Tăng dần</a>
                                    <a class="dropdown-item" id="sort2">Giá: Giảm dần</a>
                                    <a class="dropdown-item" id="sort3">Tên A->Z</a>
                                    <a class="dropdown-item" id="sort4">Tên Z->A</a>
                                    <a class="dropdown-item" id="sort5">Cũ nhất</a>
                                    <a class="dropdown-item" id="sort6">Mới nhất</a>
                                    <a class="dropdown-item" id="sort7">Bán chạy nhất</a>
                                </div>
                            </div>
                        </div>
                        <div class="sortby2 hidden" style="float: right;">
                            <div class="dropdown">
                                <button class="btn btn-dark dropdown-toggle" id="filter">
                                    Lọc sản phẩm
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row-product" id="products">
                </div>
                <div class="loadmore" id="loadMore">
                    <a style="cursor: pointer;" class="loadmore-btn">Tải thêm</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- bộ lọc mobile -->
<div class="overlay2 hidden"></div>
<div class="filter-mobile">
    <div class="product__filter">
        <div class="product__filter-price">
            <h4 class="product__filter-heading">
                <h7>-</h7>
                Khoảng giá <i class="fi-rs-minus" id="minus-4"></i> <i class="fi-rs-plus hidden" id="plus-4"></i>
            </h4>
            <ul id="khoanggia1" class="product__filter-ckeckbox">
                <li class="product__filter-item">
                    <label class="form-check-label" for="radio1">
                        <input type="radio" class="form-check-input checkGia" id="radio1" name="optradio"
                               value="-1"><span>Tất
                cả</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="radio2">
                        <input type="radio" class="form-check-input checkGia" id="radio2" name="optradio"
                               value="0-100000"><span>Dưới
                100,000đ</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="radio3">
                        <input type="radio" class="form-check-input checkGia" id="radio3" name="optradio"
                               value="100000-200000"><span>100,000đ -
                200,000đ</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="radio4">
                        <input type="radio" class="form-check-input checkGia" id="radio4" name="optradio"
                               value="200000-300000"><span>200,000đ -
                300,000đ</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="radio5">
                        <input type="radio" class="form-check-input checkGia" id="radio5" name="optradio"
                               value="300000-400000"><span>300,000đ -
                400,000đ</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="radio6">
                        <input type="radio" class="form-check-input checkGia" id="radio6" name="optradio"
                               value="400000-10000000"><span>Trên
                400,000đ</span>
                    </label>
                </li>
            </ul>
        </div>
        <div class="product__filter-trademark">
            <h4 class="product__filter-heading">
                <h7>-</h7>
                Màu sắc<i class="fi-rs-minus" id="minus-2"></i> <i class="fi-rs-plus hidden" id="plus-2"></i>
            </h4>

            <ul id="color" class="color-box">
                <li class="product__filter-item">
                    <label class="form-check-label">
                        <div type="button" class="foo black"></div>
                        <div class="foo dark_grey"></div>
                        <div class="foo grey"></div>
                        <div class="foo light_blue"></div>
                        <div class="foo blue"></div>
                        <div class="foo dark_blue"></div>
                        <div class="foo dark_green"></div>
                    </label>
                    <label class="form-check-label">
                        <div class="foo green"></div>
                        <div class="foo purple"></div>
                        <div class="foo pink"></div>
                        <div class="foo yellow"></div>
                        <div class="foo orange"></div>
                        <div class="foo red"></div>
                        <div class="foo brown"></div>
                    </label>
                </li>
            </ul>
        </div>
        <div class="product__filter-size">
            <h4 class="product__filter-heading">
                <h7>-</h7>
                Kích cỡ <i class="fi-rs-minus" id="minus-6"></i> <i class="fi-rs-plus hidden" id="plus-6"></i>
            </h4>
            <ul id="size" class="product__filter-ckeckbox">
                <li class="product__filter-item">
                    <label class="form-check-label" for="check1">
                        <input type="checkbox" class="form-check-input checksize" id="check1"
                               name="option2"><span>S</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check2">
                        <input type="checkbox" class="form-check-input checksize" id="check2"
                               name="option2"><span>M</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check3">
                        <input type="checkbox" class="form-check-input checksize" id="check3"
                               name="option2"><span>L</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check4">
                        <input type="checkbox" class="form-check-input checksize" id="check4"
                               name="option2"><span>XL</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check5">
                        <input type="checkbox" class="form-check-input checksize" id="check5"
                               name="option2"><span>2XL</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check6">
                        <input type="checkbox" class="form-check-input checksize" id="check6"
                               name="option2"><span>28</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check7">
                        <input type="checkbox" class="form-check-input checksize" id="check7"
                               name="option2"><span>29</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check8">
                        <input type="checkbox" class="form-check-input checksize" id="check8"
                               name="option2"><span>30</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check9">
                        <input type="checkbox" class="form-check-input checksize" id="check9"
                               name="option2"><span>31</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check10">
                        <input type="checkbox" class="form-check-input checksize" id="check10"
                               name="option2"><span>32</span>
                    </label>
                </li>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check11">
                        <input type="checkbox" class="form-check-input checksize" id="check11"
                               name="option2"><span>34</span>
                    </label>
                </li>
                <li class="product__filter-item">
                    <label class="form-check-label" for="check12">
                        <input type="checkbox" class="form-check-input checksize" id="check12"
                               name="option2"><span>36</span>
                    </label>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- end bộ lộc mobile -->
<!-- end product -->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<!-- modal -->
<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">
                        <div class="mb-2 main-img-2">
                            <img src="./assets/imgProduct/images/men/1.jpg" alt="" id="img-main"
                                 xoriginal="./assets/imgProduct/images/men/1.jpg"/>
                        </div>
                        <ul class="all-img-2">
                            <li class="img-item-2">
                                <img src="./assets/imgProduct/images/men/1.jpg" alt="" onclick="changeImg('one')"
                                     id="one"/>
                            </li>
                            <li class="img-item-2">
                                <img src="./assets/imgProduct/images/men/1-a.jpg" alt="" onclick="changeImg('two')"
                                     id="two"/>
                            </li>
                            <li class="img-item-2">
                                <img src="./assets/imgProduct/images/men/1-b.jpg" alt="" onclick="changeImg('three')"
                                     id="three"/>
                            </li>
                            <li class="img-item-2">
                                <img src="./assets/imgProduct/images/men/1-c.jpg" alt="" onclick="changeImg('four')"
                                     id="four"/>
                            </li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <div class="info-product">
                            <h3 class="product-name">
                                <a href="" title="">Áo len sọc lớn màu</a>
                            </h3>
                            <div class="status-product">Trạng thái: <b>Còn hàng</b></div>
                            <div class="infor-oder">Loại sản phẩm: <b>Đồ Nam</b></div>
                            <div class="price-product">
                                <div class="special-price">
                                    <span>540.000đ</span>
                                </div>
                                <div class="price-old">
                                    Giá gốc:
                                    <del>650.000đ</del>
                                    <span class="discount">(-20%)</span>
                                </div>
                            </div>
                            <div class="product-description">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur ducimus vero
                                quibusdam adipisci
                                dolore id veritatis tempore ipsa obcaecati alias libero, minus sequi nam corrupti esse
                                nulla eum,
                                similique deleniti?
                            </div>
                            <div class="product__color d-flex" style="align-items: center">
                                <div class="title" style="font-size: 16px; margin-right: 10px">
                                    Màu:
                                </div>
                                <div class="select-swap d-flex">
                                    <div class="circlecheck">
                                        <input type="radio" id="f-option" class="circle-1" name="selector" checked/>
                                        <label for="f-option"></label>
                                        <div class="outer-circle"></div>
                                    </div>
                                    <div class="circlecheck">
                                        <input type="radio" id="g-option" class="circle-2" name="selector"/>
                                        <label for="g-option"></label>
                                        <div class="outer-circle"></div>
                                    </div>
                                    <div class="circlecheck">
                                        <input type="radio" id="h-option" class="circle-3" name="selector"/>
                                        <label for="h-option"></label>
                                        <div class="outer-circle"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="product__size d-flex" style="align-items: center">
                                <div class="title" style="font-size: 16px; margin-right: 10px">
                                    Kích thước:
                                </div>
                                <div class="select-swap">
                                    <div class="swatch-element" data-value="38">
                                        <input type="radio" class="variant-1" id="swatch-1-38" name="mau" value="trung"
                                               onclick="check()"/>
                                        <label for="swatch-1-38" class="sd"><span>38</span></label>
                                    </div>
                                    <div class="swatch-element" data-value="39">
                                        <input type="radio" class="variant-1" id="swatch-1-39" name="mau" value="thanh"
                                               onclick="check()"/>
                                        <label for="swatch-1-39" class="sd"><span>39</span></label>
                                    </div>
                                    <div class="swatch-element" data-value="40">
                                        <input type="radio" class="variant-1" id="swatch-1-40" name="mau" value="hieu"
                                               onclick="check()"/>
                                        <label for="swatch-1-40" class="sd"><span>40</span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="product__wrap">
                                <div class="product__amount">
                                    <label>Số lượng: </label>
                                    <input type="button" value="-" class="control" onclick="tru()"/>
                                    <input type="text" value="1" class="text-input" id="text_so_luong"
                                           onkeypress="validate(event)"/>
                                    <input type="button" value="+" class="control" onclick="cong()"/>
                                </div>
                            </div>
                            <div class="product__shopnow">
                                <button class="shopnow2">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="btn-default btn-close" data-dismiss="modal">
                <i class="fas fa-times-circle"></i>
            </button>
        </div>
    </div>
</div>
<!-- end modal -->
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.bundle.min.js"></script>
<script src="./assets/js/main.js"></script>
<script src="./assets/js/product.js"></script>
<script src="./assets/js/generateProduct.js"></script>
</body>

</html>