<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="java.util.List" %>
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
                        <h1 class="coll-name"><%=request.getParameter("category").equals("all") ? "Tất cả sản phẩm" : CategoryService.getInstance().getCateWithID(request.getParameter("category")).getCate_name()%>
                        </h1>
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
                <%SiteUser user = (SiteUser) request.getSession().getAttribute("user");%>
                <%List<Product> first6Product = ProductService.getInstance().loadProductWithCondition(1, 6, null, request.getParameter("category"), null, null, null, null);%>
                <div class="row row-product" id="products">
                    <% for (Product p : first6Product) {%>
                    <div class="col-lg-4 col-md-6 col-12 mb-20"
                         style="margin-bottom: 20px;">
                        <a href="./ProductDetail.jsp?id=<%=p.getId()%>" class="product__new-item">
                            <div class="card" style="width: 100%">
                                <div>
                                    <img class="card-img-top" src="<%=p.getMain_img_link()%>" alt="Card image cap">
                                    <form class="hover-icon hidden-sm hidden-xs" id="quick">
                                        <input type="hidden">
                                        <% if (user != null) {%>
                                        <a class="btn-add-to-cart" id="addListLike<%=p.getId()%>" title="Đưa vào danh sách yêu thích"
                                           style="margin-top: 10px">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                        <%}%>
                                        <a class="quickview"
                                           title="Xem nhanh" id="view<%=p.getId()%>">
                                            <i class="fas fa-search"></i>
                                        </a>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title custom__name-product">
                                        <%=p.getProd_name()%>
                                    </h5>
                                    <div class="product__price">
                                        <%if (p.getSales() != null) {%>
                                        <p class="card-text price-color product__price-old"><%=p.getPrice()%>đ</p>
                                        <p class="card-text price-color product__price-new"><%=Math.round(p.getPrice() * (1 - (p.getSales().getDiscount_rate()) * 0.01))%>
                                            đ</p>
                                        <%} else {%>
                                        <p class="card-text price-color product__price-old"></p>
                                        <p class="card-text price-color product__price-new"><%=p.getPrice()%>đ</p>
                                        <%}%>
                                    </div>
                                    <div class="home-product-item__action">
                            <span class="home-product-item__like home-product-item__like--liked">
                                <i class="home-product-item__like-icon-empty far fa-heart"></i>
                                <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                            </span>
                                        <div class="home-product-item__rating">
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="home-product-item__star--gold fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <span class="home-product-item__sold"><%= p.getView_count()%> Lượt xem</span>
                                    </div>
                                    <%if (p.getSales() != null) {%>
                                    <div class="sale-off">
                                        <span class="sale-off-percent"><%=p.getSales().getDiscount_rate()%>%</span>
                                        <span class="sale-off-label">GIẢM</span>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </a>
                    </div>
                    <%}%>
                </div>
                <div class="loadmore" id="loadMore">
                    <a style="cursor: pointer;" class="loadmore-btn">Tải thêm</a>
                </div>
                <input id="page" name="page" value="2" style="display: none">
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
    $("#loadMore").on('click', function (e) {
        e.preventDefault();
        const page = $("#page").val();
        const category = $("#category").val();
        $.ajax({
            type: 'post',
            url: "LoadMoreProductController",
            data: {
                page: page,
                category: category
            },
            success: function (data) {
                $("#products").append(data);
                $("#page").val((parseInt($("#page").val()) + 1) + "");
            }
        });
    })
    function click(e) {
        e.preventDefault();
        const idQuickview = $(this).id
        console.log(idQuickview)
        $.ajax({
            type: "post",
            url: "QuickViewController",
            data: {
                idQuickview: idQuickview
            },
            success: function (data) {
                $("#modal-content").html(data);
                $("#modal-content").modal('toggle');
            }
        });
    }
</script>
</body>

</html>