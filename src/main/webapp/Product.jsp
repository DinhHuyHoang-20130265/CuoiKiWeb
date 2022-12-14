<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
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
    <link rel="stylesheet" href="./assets/uicons-regular-straight/css/uicons-regular-straight.css">
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
</head>

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
                                    <div class="foo black"><input type="checkbox" class="checkcolor" value="black"
                                                                  style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo dark_grey"><input type="checkbox" class="checkcolor"
                                                                      value="darkgrey"
                                                                      style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo grey"><input type="checkbox" class="checkcolor" value="grey"
                                                                 style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo light_blue"><input type="checkbox" class="checkcolor"
                                                                       value="lightblue"
                                                                       style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo blue"><input type="checkbox" class="checkcolor" value="blue"
                                                                 style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo dark_blue"><input type="checkbox" class="checkcolor"
                                                                      value="darkblue"
                                                                      style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo dark_green"><input type="checkbox" class="checkcolor"
                                                                       value="darkgreen"
                                                                       style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                </label>
                                <label class="form-check-label">
                                    <div class="foo green"><input type="checkbox" class="checkcolor" value="green"
                                                                  style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo purple"><input type="checkbox" class="checkcolor" value="purple"
                                                                   style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo pink"><input type="checkbox" class="checkcolor" value="pink"
                                                                 style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo yellow"><input type="checkbox" class="checkcolor" value="yellow"
                                                                   style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo orange"><input type="checkbox" class="checkcolor" value="orange"
                                                                   style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo red"><input type="checkbox" class="checkcolor" value="red"
                                                                style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
                                    <div class="foo brown"><input type="checkbox" class="checkcolor" value="brown"
                                                                  style="opacity: 0; width: 20px;height: 20px;float: left;">
                                    </div>
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
                        <h1 class="coll-name"><%=request.getParameter("category").equals("all") ? "Tất cả sản phẩm" : CategoryService.getInstance().getCateWithID(request.getParameter("category")).getCate_name()%>
                        </h1>
                    </div>
                    <div class="sort-right col-12 col-lg-6">
                        <div class="sortby">
                            <label>Sắp xếp theo:</label>
                            <div class="dropdown">
                                <select id="dropdownSelect" class="form-select form-select-lg mb-3"
                                        aria-label=".form-select-lg example"
                                        style="margin-bottom: 0 !important; height: 30px; width: 145px; font-size: 14px;">
                                    <option selected value="0">Sản phẩm nổi bật</option>
                                    <option value="1">Giá: Tăng dần</option>
                                    <option value="2">Giá: Giảm dần</option>
                                    <option value="3">Tên A->Z</option>
                                    <option value="4">Tên Z->A</option>
                                    <option value="5">Cũ nhất</option>
                                    <option value="6">Mới nhất</option>
                                    <option value="7">Bán chạy nhất</option>
                                </select>
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
                    <!-- loadProduct o day -->
                </div>
                <div class="loadmore" id="loadMore">
                    <a style="cursor: pointer;" class="loadmore-btn">Tải thêm</a>
                </div>
                <input id="page" name="page" value="1" style="display: none">
                <input id="category" name="category" value="<%=request.getParameter("category")%>"
                       style="display: none">
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
                               value="-1"><span>Tất cả</span>
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
                        <div class="foo black"><input type="checkbox" class="checkcolor" value="black"
                                                      style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                        <div class="foo dark_grey"><input type="checkbox" class="checkcolor" value="darkgrey"
                                                          style="opacity: 0; width: 20px;height: 20px;float: left;">
                        </div>
                        <div class="foo grey"><input type="checkbox" class="checkcolor" value="grey"
                                                     style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                        <div class="foo light_blue"><input type="checkbox" class="checkcolor" value="lightblue"
                                                           style="opacity: 0; width: 20px;height: 20px;float: left;">
                        </div>
                        <div class="foo blue"><input type="checkbox" class="checkcolor" value="blue"
                                                     style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                        <div class="foo dark_blue"><input type="checkbox" class="checkcolor" value="darkblue"
                                                          style="opacity: 0; width: 20px;height: 20px;float: left;">
                        </div>
                        <div class="foo dark_green"><input type="checkbox" class="checkcolor" value="darkgreen"
                                                           style="opacity: 0; width: 20px;height: 20px;float: left;">
                        </div>
                    </label>
                    <label class="form-check-label">
                        <div class="foo green"><input type="checkbox" class="checkcolor" value="green"
                                                      style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                        <div class="foo purple"><input type="checkbox" class="checkcolor" value="purple"
                                                       style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                        <div class="foo pink"><input type="checkbox" class="checkcolor" value="pink"
                                                     style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                        <div class="foo yellow"><input type="checkbox" class="checkcolor" value="yellow"
                                                       style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                        <div class="foo orange"><input type="checkbox" class="checkcolor" value="orange"
                                                       style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                        <div class="foo red"><input type="checkbox" class="checkcolor" value="red"
                                                    style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
                        <div class="foo brown"><input type="checkbox" class="checkcolor" value="brown"
                                                      style="opacity: 0; width: 20px;height: 20px;float: left;"></div>
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
        <div id="modal-content" class="modal-content">
        </div>
    </div>
</div>
<!-- end modal -->
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.bundle.min.js"></script>
<script src="./assets/js/main.js"></script>
<script src="./assets/js/product.js"></script>
<script>
    $(document).ready(function () {
        loadproduct();
        load("1");
        $("input[type='radio']").each(function () {
            this.addEventListener("change", function (e) {
                filter(e);
            })
        })
        $("input[type='checkbox']").each(function () {
            this.addEventListener("change", function (e) {
                filter(e);
            })
        })
        $("#dropdownSelect").change(function (e) {
            filter(e);
        })
    });

    function filter(e) {
        e.preventDefault();
        const category = $("#category").val();
        const price = $("input[type='radio']:checked.checkGia").val();
        const size = $("input[type='checkbox']:checked.checksize");
        const orderby = $("#dropdownSelect").find(':selected').val();
        let stringSize = "";
        size.each(function () {
            stringSize += "'" + $(this).parent().children("span").text() + "',";
        });
        let stringColor = "";
        const color = $("input[type='checkbox']:checked.checkcolor");
        color.each(function () {
            stringColor += "'" + this.value + "',";
        });
        $.ajax({
            type: 'post',
            url: "FilterProductController",
            data: {
                price: price,
                orderby: orderby,
                color: stringColor,
                size: stringSize,
                page: "1",
                category: category
            },
            success: function (data) {
                $("#products").html(data);
                $("#page").val("2");
                load("1");
            }
        });
    }

    function loadproduct() {
        const page = $("#page").val();
        const category = $("#category").val();
        const price = $("input[type='radio']:checked.checkGia").val();
        const size = $("input[type='checkbox']:checked.checksize");
        const orderby = $("#dropdownSelect").find(':selected').val();
        let stringSize = "";
        size.each(function () {
            stringSize += "'" + $(this).parent().children("span").text() + "',";
        });
        let stringColor = "";
        const color = $("input[type='checkbox']:checked.checkcolor");
        color.each(function () {
            stringColor += "'" + this.value + "',";
        });
        $.ajax({
            type: 'post',
            url: "LoadMoreProductController",
            data: {
                page: page,
                category: category,
                price: price,
                orderby: orderby,
                color: stringColor,
                size: stringSize
            },
            success: function (data) {
                $("#products").append(data);
                const page = $("#page").val();
                load(page);
                $("#page").val((parseInt(page) + 1) + "");
            }
        });
    }

    $("#loadMore").on('click', function () {
        loadproduct();
    });

    function load(a) {
        const value = document.getElementsByClassName("quickviewProduct")
        for (let i = (parseInt(a) - 1) * 6; i < value.length; i++) {
            value.item(i).addEventListener('click', function (e) {
                e.preventDefault();
                const idQuickview = this.id;
                $.ajax({
                    type: "post",
                    url: "QuickViewController",
                    data: {
                        idQuickview: idQuickview
                    },
                    success: function (data) {
                        $("#modal-content").html(data);
                        $("#myModal").modal('toggle');
                        addcart()
                        $(".circlecheck").each(function () {
                            const $this = $(this);
                            const id = $this.find("input").attr("id");
                            const color = id.substring(0, id.indexOf("-"));
                            const style = document.createElement('style');
                            style.type = 'text/css';
                            style.innerHTML = `
                            .circlecheck input[type=radio].circle-` + color + `:checked ~ .outer-circle {
                                border: 3px solid ` + color + `;
                            }

                            .circlecheck input[type=radio].circle-` + color + ` ~ .outer-circle {
                                border-color: ` + color + `;
                            }
                            .circlecheck input[type=radio].circle-` + color + `:checked ~ .outer-circle::before {
                                background: ` + color + `;
                            }
                            `;
                            document.getElementsByTagName('head')[0].appendChild(style);
                        })
                    }
                });
            })
        }
    }
    function addwishlist() {
        $(".card .btn-add-to-cart").click(function (e) {
            e.preventDefault();
            const id = this.id;
            if(id == null) {
                alert("Không thể đưa vào danh sách yêu thích")
            }
            else {
                $.ajax(({
                    url: "AddWishListController",
                    type: "get",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        $(".header__second__cart--icon").each(function () {
                            $(this).text(data);
                        })
                        $(".home-product-item__action").html(`<i class="home-product-item__like-icon-fill fas fa-heart"></i>`)
                    }
                }))
            }
        })
    }
    function addcart() {
        $(".shopnow2").click(function (e) {
            e.preventDefault();
            const idAdd = this.id;
            const amount = $("#text_so_luong-10").val();
            const size = $(".swatch-element input[type='radio']:checked").val();
            const color = $(".circlecheck input[type='radio']:checked").attr("id");
            if (size == null || color == null) {
                alert("Yêu cầu nhập đầy đủ thông tin")
            } else {
                $.ajax({
                    url: "AddCartController",
                    type: "get",
                    data: {
                        idAdd: idAdd,
                        size: size,
                        color: color,
                        amount : amount
                    },
                    success: function (data) {
                        $(".header__second__cart--notice").each(function () {
                            $(this).text(data)
                        })
                        $(".product__shopnow").html(`<a class="notify" style="color:green; font-size: 16px; font-weight: 600;"><i class="fas fa-check" style="color: green"></i> Thêm sản phẩm vào giỏ hàng thành công !</a>`)
                    }
                })
            }
        })
    }
</script>
</body>

</html>