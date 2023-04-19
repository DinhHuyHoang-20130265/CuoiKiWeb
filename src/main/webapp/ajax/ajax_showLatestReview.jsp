<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductReview" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserInformation" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserInformationService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 1/5/2023
  Time: 12:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ProductReview comment = (ProductReview) request.getAttribute("product_review");
    UserInformation userInfo = UserInformationService.getInstance().getUserInfo(comment.getReview_by());
%>
<div class="comment" id="result_<%=comment.getReview_id()%>">
    <img class="comment-img" src="<%=userInfo.getAvatar_link()%>" alt="">
    <div class="comment__content">
        <div class="comment__content-heding">
            <h4 class="comment__content-name"><%=userInfo.getFull_name()%>
            </h4>
            <span class="comment__content-time"><%=comment.getReview_date()%></span>
            <%
                SiteUser user = (SiteUser) request.getSession().getAttribute("user");
                if (user != null) {
                    if (user.getId().equals(comment.getReview_by())) {
            %>
            <a class="remove" id="remove<%=comment.getReview_id()%>"
               style="cursor: pointer; color: darkred; margin-left: 440px; margin-top: 3px; font-size: 12px"><i class="fa fa-trash"></i></a>
            <% }
            } %>
        </div>
        <div class="home-product-item__rating"
             style="font-size: 14px;transform-origin: left;margin-bottom: 5px">
            <% int count = comment.getVote_star();
                for (int j = 0; j < count; j++) { %>
            <i class="home-product-item__star--gold fas fa-star"></i>
            <%}%>
            <% int count1 = 5 - comment.getVote_star();
                for (int j = 0; j < count1; j++) { %>
            <i class="fas fa-star"></i>
            <%}%>
        </div>
        <div class="comment__content-content">
            <span><%=comment.getReview_desc()%></span>
        </div>
    </div>
</div>
