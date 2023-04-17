<%@ page import="vn.edu.hcmuaf.fit.beans.product.ProductReview" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/6/2023
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<ProductReview> loadReview = (List<ProductReview>) request.getAttribute("loadReview"); %>
<% if (loadReview != null)
    for (ProductReview review : loadReview) { %>
<li class="item">
    <div class="item-row">
        <div class="item-col fixed item-col-check">
            <label class="item-check" id="select-all-items">
                <input type="checkbox" class="checkbox">
                <span></span>
            </label>
        </div>
        <div class="item-col fixed item-col-img md"
             style="justify-content: center;min-width: 150px">
            <span>#<%=review.getReview_prod()%></span>
        </div>
        <div class="item-col fixed pull-left item-col-title">
            <div class="item-heading">Người đánh giá</div>
            <div>
                <a>
                    <h4 class="item-title"><%=review.getReview_by()%>
                    </h4>
                </a>
            </div>
        </div>
        <div class="item-col item-col-sales">
            <div class="item-heading">Mã đánh giá</div>
            <div class="sales" style="text-align: center">#<%=review.getReview_id()%>
            </div>
        </div>
        <div class="item-col item-col-category no-overflow">
            <div class="item-heading">Tên sản phẩm</div>
            <div class="no-overflow" style="text-align: center">
                <a><%=ProductService.getInstance().getProductHiddenAndDetails(review.getReview_prod()).getProd_name()%>
                </a>
            </div>
        </div>
        <div class="item-col item-col-category no-overflow">
            <div class="item-heading">Số sao</div>
            <div class="no-overflow" style="text-align: center">
                <% int count = review.getVote_star();
                    for (int j = 0; j < count; j++) { %>
                <i class="home-product-item__star--gold fas fa-star"></i>
                <%}%>
                <% int count1 = 5 - review.getVote_star();
                    for (int j = 0; j < count1; j++) { %>
                <i class="fas fa-star"></i>
                <%}%>
            </div>
        </div>
        <div class="item-col item-col-author">
            <div class="item-heading">Trạng Thái</div>
            <div class="no-overflow" style="text-align: center">
                <%if (review.getReview_status() == 1) {%>
                <a> Hiển thị </a>
                <%} else {%>
                <a> Đã Ẩn </a>
                <%}%>
            </div>
            <input type="text" id="status<%=review.getReview_id()%>"
                   value="<%=review.getReview_status()%>"
                   style="display: none">
        </div>
        <div class="item-col item-col-date">
            <div class="item-heading">Ngày thêm</div>
            <div class="no-overflow"><%=review.getReview_date()%>
            </div>
        </div>
        <div class="item-col fixed item-col-actions-dropdown">
            <div class="item-actions-dropdown">
                <a class="item-actions-toggle-btn">
                    <span class="inactive"><i class="fa fa-cog"></i>
                    </span>
                    <span class="active">
                        <i class="fa fa-chevron-circle-right"></i>
                    </span>
                </a>
                <div class="item-actions-block">
                    <ul class="item-actions-list">
                        <%
                            AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
                            for (AdminRole role : admin.getRole()) {
                                if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("comment") && role.getPermission().equals("delete")) {
                        %>
                        <li>
                            <a class="remove" id="remove<%=review.getReview_id()%>"
                               data-toggle="modal"
                               data-target="#confirm-modal" style="cursor: pointer">
                                <i class="fa fa-trash"></i>
                            </a>
                        </li>
                        <%
                            }
                            if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("comment") && role.getPermission().equals("update")) {
                        %>
                        <li>
                            <a class="toggle" id="toggle<%=review.getReview_id()%>"
                               style="cursor: pointer">
                                <%
                                    if (review.getReview_status() == 1) { %>
                                <i class="fa fa-toggle-off" style="color: red"></i>
                                <% } else { %>
                                <i class="fa fa-toggle-on" style="color: green"></i>
                                <%} %>
                            </a>
                        </li>
                        <%
                                }
                            }
                        %>
                        <li>
                            <a class="info" id="info<%=review.getReview_id()%>"
                               style="cursor: pointer">
                                <i class="fa fa-info-circle"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</li>
<%}%>