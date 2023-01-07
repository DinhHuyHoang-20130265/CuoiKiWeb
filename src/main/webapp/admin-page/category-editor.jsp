
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.category.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductImage" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 1/7/2023
  Time: 8:06 AM
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> Trang Quản Lý </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->
    <link rel="stylesheet" href="css/vendor.css">
    <style>
        .product__filter-item {
            margin-right: 25px;
        }

        .input-file {
            color: transparent;
            width: 100%;
            height: 100%;
        }

        .input-file::before {
            content: 'Upload ảnh';
            color: black;
            display: inline-block;
            outline: none;
            white-space: nowrap;
            -webkit-user-select: none;
            cursor: pointer;
            font-weight: 600;
            font-size: 10pt;
            margin-left: 30px;
            margin-right: 30px;
        }

        .input-file:hover::before {
            border-color: black;
        }

        .input-file:active {
            outline: 0;
        }

        .input-file::-webkit-file-upload-button {
            visibility: hidden;
        }
    </style>
    <!-- Theme initialization -->
    <script>
        var themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
            {};
        var themeName = themeSettings.themeName || '';
        if (themeName) {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app-' + themeName + '.css">');
        } else {
            document.write('<link rel="stylesheet" id="theme-style" href="css/app.css">');
        }
    </script>
    <script src="ckeditor/ckeditor.js"></script>
    <script src="ckfinder/ckfinder.js"></script>
</head>

<body>
<%

    //----------------------Kiểm tra thử đăng nhập hay chưa--------------------//
    if (request.getSession().getAttribute("userAdmin") == null) {
        // Sendredirect tới login
        response.sendRedirect("login.jsp");

    } else {
%>
<div class="main-wrapper">
    <div class="app" id="app">
        <jsp:include page="Layout/_LayoutAdminHeader.jsp"></jsp:include>
        <jsp:include page="Layout/_LayoutAdminSideBar.jsp"></jsp:include>
        <article class="content item-editor-page">
            <div class="title-block">
                <%if (request.getParameter("id") != null) {%>
                <h3 class="title"> Sửa sản phẩm
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%} else {%>
                <h3 class="title"> Thêm sản phẩm
                    <span class="sparkline bar" data-type="bar"></span>
                </h3>
                <%}%>
            </div>
            <%
                Product p = null;
                if (request.getParameter("id") != null)
                    p = ProductService.getInstance().getProductHiddenAndDetails(request.getParameter("id"));
            %>
            <form name="item" method="post" enctype="multipart/form-data">
                <input type="text" id="idEdit"
                       value="<%=request.getParameter("id") == null ? "" : request.getParameter("id")%>"
                       style="display: none">
                <input type="text" id="userid"
                       value="<%=((AdminUser) request.getSession().getAttribute("userAdmin")).getId()%>"
                       style="display:none;">
                <div class="card card-block">
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Tên sản phẩm: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="name"
                                   id="name" value="<%=(p != null) ? p.getProd_name() : ""%>" placeholder="Nhập tên">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Giá: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="price" id="price"
                                   value="<%=(p != null) ? p.getPrice() : ""%>" placeholder="Nhập giá">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Nhập loại danh mục cha: </label>
                        <div class="col-sm-10" style="">
                            <select class="c-select form-control" name="select-cate" id="select-cate"
                                    onfocus='this.size=5;' onblur='this.size=1;'
                                    onchange='this.size=1; this.blur();'>
                                <%
                                    List<Category> cate = CategoryService.getInstance().getAllCate();
                                    Category cat = null;
                                    if (p != null) {
                                        for (Category c : p.getCategories()) {
                                            if (c.getParent_id() == null)
                                                cat = c;
                                        }
                                    }
                                    ;
                                %>
                                <%for (Category c : cate) {%>
                                <option value="<%=c.getId()%>" <%=(cat != null && c.getId().equals(cat.getId())) ? "selected" : ""%>><%=c.getCate_name()%>
                                </option>
                                <%}%>
                                <option value="other">Khác</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Hiển thị: </label>
                        <div class="col-sm-10" style="">
                            <select class="c-select form-control" id="select-status">
                                <% int status = 0;
                                    if (p != null)
                                        status = p.getProd_status();%>
                                <option value="1" <%=(status == 1) ? "selected" : ""%>>Hiển
                                    thị
                                </option>
                                <option value="0" <%=(status == 0) ? "selected" : ""%>>Ẩn
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Mô tả: </label>
                        <div class="col-sm-10">
                            <textarea id="editor">
                                <%=(p != null) ? p.getContent() : ""%>
                            </textarea>
                            <script>
                                CKEDITOR.replace('editor');
                            </script>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Hình ảnh: </label>
                        <div class="col-sm-10">
                            <div class="images-container">
                                <% int i = 0;
                                    if (p != null) {
                                        if (p.getMain_img_link() != null) {%>
                                <div class="image-container">
                                    <div class="image" id="container<%=i%>">
                                        <div class="controls">
                                            <a id="remove<%=i%>" class="control-btn remove"
                                               style="display: flex !important;width: 136px;justify-content: center;align-items: center;">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>
                                        <img class='img-product-review' src='<%=p.getMain_img_link()%>'
                                             style='height: 100%'>
                                    </div>
                                </div>
                                <%
                                            i++;
                                        }
                                    }
                                %>
                                <% if (p != null) {
                                    if (p.getImages() != null) {
                                        for (ProductImage img : p.getImages()) { %>
                                <div class="image-container">
                                    <div class="image" id="container<%=i%>">
                                        <div class="controls">
                                            <a id="remove<%=i%>" class="control-btn remove"
                                               style="display: flex !important;width: 136px;justify-content: center;align-items: center;">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>
                                        <img class='img-product-review' src='<%=img.getProd_img_link()%>'
                                             style='height: 100%'>
                                    </div>
                                </div>
                                <%
                                                i++;
                                            }
                                        }
                                    }
                                %>
                                <div class="image-container">
                                    <div class="image" id="container<%=i%>">
                                        <input type="file" id="image<%=i%>" name="files" class="input-file"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="text" id="deletedFile" value="" style="display: none">
                    <div class="form-group row">
                        <div class="col-sm-10 col-sm-offset-2">
                            <%if (request.getParameter("id") != null) {%>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                            <% } else {%>
                            <button type="submit" class="btn btn-primary">Thêm</button>
                            <%}%>
                        </div>
                    </div>
                </div>
            </form>
        </article>
    </div>
</div>
<!-- Reference block for JS -->
<div class="ref" id="ref">
    <div class="color-primary"></div>
    <div class="chart">
        <div class="color-primary"></div>
        <div class="color-secondary"></div>
    </div>
</div>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
    ga('create', 'UA-80463319-4', 'auto');
    ga('send', 'pageview');
</script>
<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
<script>
    $('.foo').click(function () {
        $(this).toggleClass('active');
    })
    $('.size').click(function () {
        $(this).toggleClass('active');
    })
</script>
<script>
    $('.form-control').on('change', function () {
        if ($(this).val() == 'other') {
            $(this).after('<input placeholder="Nhập..." type="text" name="' + $(this).attr('name') + '" class="otherInput form-control boxed" style="width:50% !important; margin-top:5px;border: 1px solid #ced4da;border-radius: 0.25rem;"/>');
        } else {
            if ($(this).next().is('input.otherInput')) {
                $(this).next().remove();
            }
            ;
        }
        ;
    });
</script>
<script>
    const idProduct = $("#idEdit").val();
    if (idProduct.length > 0) {
        $(".remove").each(function () {
            const id = this.id.substring(6);
            removeFilesData(id)
        })
    } else {
        removeFilesData(1)
    }

    function reloadUpLoadFile() {
        $(".input-file").each(function () {
            $(this).on('change', function (e) {
                const idName = $(this).attr("id");
                const id = idName.substr(5);
                const value = $(this).val();
                let name = "";
                if (value.indexOf("\\") != -1)
                    name = value.substring(value.lastIndexOf("\\") + 1);
                else
                    name = value.substring(value.lastIndexOf("/") + 1);
                uploadFile(id, name, e)
            })
        });
    }

    $(".input-file").each(function () {
        $(this).on('change', function (e) {
            const idName = $(this).attr("id");
            const id = idName.substr(5);
            const value = $(this).val();
            let name = "";
            if (value.indexOf("\\") != -1)
                name = value.substring(value.lastIndexOf("\\") + 1);
            else
                name = value.substring(value.lastIndexOf("/") + 1);
            uploadFile(id, name, e)
        })
    });

    function uploadFile(id, name, event) {
        event.stopPropagation();
        event.preventDefault();
        const files = event.target.files;
        const data = new FormData();
        $.each(files, function (key, value) {
            data.append(key, value);
        });
        postFilesData(id, name, data);
    }

    function removeFilesData(idDelete) {
        $("#remove" + idDelete).on("click", function (e) {
            e.preventDefault();
            const id = this.id.substring(6);
            const src = $("#container" + id + " .img-product-review").attr("src");
            let imageName = "";
            if (src.indexOf("\\") != -1)
                imageName = src.substring(src.lastIndexOf("\\") + 1);
            else
                imageName = src.substring(src.lastIndexOf("/") + 1);
            $("#container" + id).parent().remove();
            const value = $("#deletedFile").val();
            if (value.length > 0)
                $("#deletedFile").val($("#deletedFile").val() + imageName + ",");
            else
                $("#deletedFile").val(imageName + ",");
            console.log($("#deletedFile").val());
        });
    }

    function postFilesData(id, name, data) {
        let bool = false;
        $(".img-product-review").each(function () {
            let nameFile = $(this).attr("src");
            if (nameFile.indexOf(name) != -1) {
                bool = true;
            }
        })
        if (bool === false) {
            $.ajax({
                url: '/CuoiKiWeb_war/UpDownImageProductController',
                type: 'POST',
                data: data,
                cache: false,
                dataType: 'json',
                processData: false,
                contentType: false,
                success: function (data, textStatus, jqXHR) {
                    //success
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $("#container" + id).prepend("<img class='img-product-review' src='http://localhost:8080/CuoiKiWeb_war/assets/imgProduct/images/" + name + "' style='height: 100%'>");
                    $(".images-container #container" + id).prepend(`<div class="controls">
                                            <a id="remove` + id + `" class="control-btn remove" style="display: flex !important;width: 136px;justify-content: center;align-items: center;">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>`)
                    $(".images-container").append(` <div class="image-container">
                                    <div class="image" id="container` + (parseInt(id) + 1) + `">
                                        <input type="file" id="image` + (parseInt(id) + 1) + `" name="files" class="input-file"/>
                                    </div>
                                </div>
                     `)
                    let value = $("#deletedFile").val();
                    if (value.indexOf(name) !== -1) {
                        value = value.replace(name + ",", "");
                        $("#deletedFile").val(value);
                    }
                    console.log($("#deletedFile").val());
                    reloadUpLoadFile();
                    removeFilesData(id);

                }
            });
        } else {
            alert("Bạn đã upload ảnh này rồi !")
        }
    }
</script>
<script>
    $("button[type='submit']").click(function (e) {
        e.preventDefault();
        const userID = $("#userid").val();
        const quantity = $("#quantity").val();
        const id = $("#idEdit").val();
        const name = $("#name").val();
        const price = $("#price").val();
        const size = $("input[type='checkbox']:checked.checksize");
        let stringSize = [];
        size.each(function () {
            stringSize.push($(this).parent().children("span").text());
        });
        let stringColor = [];
        const color = $("input[type='checkbox']:checked.checkcolor");
        color.each(function () {
            stringColor.push(this.value);
        });
        const idCate = $('#select-cate').find(":selected").val();
        const status = $("#select-status").find(":selected").val();
        const desc = $('#description').val();
        const content = CKEDITOR.instances.editor.getData();
        let imgFile = []
        $(".img-product-review").each(function () {
            let nameFile = $(this).attr("src");
            if (nameFile.indexOf("\\") != -1)
                imgFile.push(nameFile.substring(nameFile.lastIndexOf("\\") + 1));
            else
                imgFile.push(nameFile.substring(nameFile.lastIndexOf("/") + 1));
        })
        const removed = $("#deletedFile").val();
        const oldImg = removed.substring(0, removed.length - 1);
        $.ajax({
            url: "/CuoiKiWeb_war/EditInsertProductController",
            type: "GET",
            data: {
                userid: userID,
                quantity: quantity,
                oldImg: oldImg,
                id: id,
                name: name,
                price: price,
                status: status,
                size: stringSize,
                color: stringColor,
                idCate: idCate,
                desc: desc,
                content: content,
                imgFile: imgFile,
            },
            success: function () {
                if (id.length < 1)
                    alert("Thêm sản phẩm thành công");
                else
                    alert("Cập nhật sản phẩm thành công");
                window.location.href = "items-list.jsp"
            }
        })
    })
</script>
</body>

</html>
<%
    }
%>