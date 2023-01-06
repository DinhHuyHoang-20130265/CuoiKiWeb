<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductReview" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/6/2023
  Time: 5:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ProductReview productReview = (ProductReview) request.getAttribute("review");
    UserInformation information = (UserInformation) request.getAttribute("info");
%>
<div class="modal-body">
    <div class="zoom-anim-dialog modal--view" id="modal-view">
        <div class="comments__autor">
            <img class="comments__avatar"
                 src="<%=information.getAvatar_link() == null ? "" : information.getAvatar_link()%>" alt="">
            <span class="comments__name"><%=information.getFull_name()%></span>
            <span class="comments__time"><%=productReview.getReview_date()%></span>
        </div>
        <p class="comments__text"><%=productReview.getReview_desc()%>
        </p>
        <div class="comments__actions">
            <div class="comments__rate" style="text-align: center">
                                        <span style="font-size: 18px">
                                            <% int count = productReview.getVote_star();
                                                for (int j = 0; j < count; j++) { %>
                                        <i class="home-product-item__star--gold fas fa-star"></i>
                                        <%}%>
                                        <% int count1 = 5 - productReview.getVote_star();
                                            for (int j = 0; j < count1; j++) { %>
                                        <i class="fas fa-star"></i>
                                        <%}%>
                                            <%=productReview.getVote_star()%>/5</span>
            </div>
        </div>
    </div>
</div>
