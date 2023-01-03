<%@ page import="vn.edu.hcmuaf.fit.beans.news.News" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.NewsService" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/12/2022
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<News> loadAllNews = (List<News>) request.getAttribute("loadAllNews");%>
<% for (News news : loadAllNews) {%>
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
                <p class="card-text custom__name-product" style="font-weight: 400;"><%=news.getDescription()%>></p>
            </div>
        </div>
    </a>
</div>
<%}%>
