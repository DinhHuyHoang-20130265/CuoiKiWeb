<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.news.NewsComment" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsCommentService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
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
    <link rel="stylesheet" href="./assets/css/newDetail.css">
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
        word-wrap: break-word;
        text-align: center;
    }

    .content-page p img {
        width: auto;
        height: auto;
        max-width: 100%;
        vertical-align: middle;
        height: initial !important;
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
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="page-title">
                    <h1 class="title-head" style="font-size: 30px">
                        <strong><%=NewsService.getInstance().getNewsById(request.getParameter("id")).getNews_title()%>
                        </strong>
                    </h1>
                </div>
                <div class="content-page">
                    <span class="time" style="font-size: 18px; color: #999;"><i class="far fa-clock"
                                                                                style="margin-right: 10px;"><%=NewsService.getInstance().getNewsById(request.getParameter("id")).getPosted_date()%></i></span>
                    <%=NewsService.getInstance().getNewsById(request.getParameter("id")).getContent()%>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- comment -->
<input type="text" id="newsid" value="<%=request.getParameter("id")%>" style="display: none">
<%List<NewsComment> loadNewsComment = NewsCommentService.getInstance().getNewsCommentByNews("1", request.getParameter("id"), "0");%>
<div class="container">
    <div class="col-md-12" id="fbcomment">
        <div class="header_comment">
            <div class="row">
                <div class="col-md-6 text-left">
                    <span class="count_comment"><%=NewsCommentService.getInstance().getAllCommentFromNews(request.getParameter("id")).size()%> bình luận</span>
                </div>
                <div class="col-md-6 text-right">
                    <span class="sort_title">Sắp xếp theo</span>
                    <select class="sort_by" id="sort_by">
                        <option value="0" selected>Mới nhất</option>
                        <option value="1">Cũ nhất</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="body_comment">
            <div class="row" style="justify-content: center;">
                <% if (request.getSession().getAttribute("user") == null) { %>
                <h5 style="text-align: center; margin: 10px; color: red; font-size: 16px">Bạn cần đăng nhập để bình
                    luận</h5>
                <% } else {
                    SiteUser user = (SiteUser) request.getSession().getAttribute("user");
                    UserInformation information = UserInformationService.getInstance().getUserInfoById((user.getId()));
                %>
                <input type="text" id="usercomment" value="<%=user.getId()%>" style="display: none">
                <div class="avatar_comment col-md-1">
                    <img src="<%=information.getAvatarImgLink() == null ? "http://localhost:8080/CuoiKiWeb_war/assets/imgNews/news/avatar.jpg" : information.getAvatarImgLink()%>"
                         alt="avatar">
                </div>
                <div class="box_comment col-md-11">
                    <textarea class="commentar" placeholder="Viết bình luận..." required></textarea>
                    <div class="box_post">
                        <div class="pull-right">
                            <button type="button" id="post">Đăng</button>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <div class="row">
                <div id="list_comment" class="col-md-12">
                    <% int numb = 6;%>
                    <% if (loadNewsComment != null) {
                        if (loadNewsComment.size() < 6) {
                            numb = loadNewsComment.size();
                        }
                        for (int i = 0; i < numb; i++) {
                            UserInformation userInfo = UserInformationService.getInstance().getUserInfo(loadNewsComment.get(i).getComment_by());%>
                    <div class="box_result row" id="box_result<%=loadNewsComment.get(i).getComment_id()%>">
                        <div class="avatar_comment col-md-1">
                            <img src="<%=userInfo.getAvatarImgLink() == null ? "http://localhost:8080/CuoiKiWeb_war/assets/imgNews/news/avatar.jpg" : userInfo.getAvatarImgLink()%>"
                                 alt="avatar"/>
                        </div>
                        <div class="result_comment col-md-11">
                            <h4><%=userInfo.getFullName()%>
                            </h4>
                            <p><%=loadNewsComment.get(i).getDescription()%>
                            </p>
                            <div class="tools_comment">
                                <span><%=loadNewsComment.get(i).getCommented_date()%></span>
                                <%
                                    SiteUser user = (SiteUser) request.getSession().getAttribute("user");
                                    if (user != null) {
                                        if (user.getId().equals(loadNewsComment.get(i).getComment_by())) {
                                %>
                                <a class="remove" id="remove<%=loadNewsComment.get(i).getComment_id()%>"
                                   style="cursor: pointer; float: right; color: darkred">Xóa comment của bạn</a>
                                <% }
                                } %>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <input type="text" id="page" value="2" style="display: none">
                <button class="show_more" type="button">Tải thêm bình luận</button>
            </div>
        </div>
    </div>
</div>
<!-- comment -->
<jsp:include page="Layout/_LayoutFooter.jsp"></jsp:include>
<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/main.js"></script>
<script>
    deletecomment();

    function deletecomment() {
        $(".remove").click(function (e) {
            e.preventDefault();
            const id = this.id.substring(6);
            $.ajax({
                url: "DeleteCommentController",
                type: "post",
                data: {
                    id: id,
                },
                success: function () {
                    $("#box_result" + id).remove();
                    $(".count_comment").text((parseInt($(".count_comment").text()) - 1) + " bình luận");
                }
            })
        });
    }

    $(".show_more").click(function (e) {
        e.preventDefault();
        const page = $("#page").val();
        const newsid = $("#newsid").val();
        const order_by = $("#sort_by option:selected").val()
        $.ajax({
            url: "LoadNewsCommentController",
            type: "post",
            data: {
                order_by: order_by,
                newsid: newsid,
                page: page
            },
            success: function (data) {
                $("#list_comment").append(data);
                $("#page").val(parseInt(page) + 1);
            }
        })
    })
    $('#sort_by').change(function () {
        const order_by = $(this).val();
        const page = "1";
        if ($(this).val() === "0") {
            const newsid = $("#newsid").val();
            $.ajax({
                url: "LoadNewsCommentController",
                type: "post",
                data: {
                    order_by: order_by,
                    newsid: newsid,
                    page: page
                },
                success: function (data) {
                    $("#list_comment").html(data);
                    $("#page").val("2");
                }
            });
        } else if ($(this).val() === "1") {
            const newsid = $("#newsid").val();
            $.ajax({
                url: "LoadNewsCommentController",
                type: "post",
                data: {
                    order_by: order_by,
                    newsid: newsid,
                    page: page
                },
                success: function (data) {
                    $("#list_comment").html(data);
                    $("#page").val("2");
                }
            });
        }
    });
    $("#post").click(function (e) {
        e.preventDefault();
        const id = $("#usercomment").val();
        const comment = $(".commentar").val();
        const newsid = $("#newsid").val();
        $.ajax({
            url: "CommentController",
            type: "post",
            data: {
                id: id,
                comment: comment,
                newsid: newsid
            },
            success: function (data) {
                $("#list_comment").prepend(data);
                $(".count_comment").text((parseInt($(".count_comment").text()) + 1) + " bình luận");
                deletecomment();
            }
        })
    })
</script>
</body>
</html>