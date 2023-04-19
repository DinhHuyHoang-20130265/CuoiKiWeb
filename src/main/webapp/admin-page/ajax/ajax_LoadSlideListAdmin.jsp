<%@ page import="vn.edu.hcmuaf.fit.DAO.SlideDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.slide.Slide" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 1/7/2023
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Slide> slides = (List<Slide>) request.getAttribute("loadSlide");%>
<%for (Slide list : slides) { %>
<li class="item" id="item<%=list.getSlide_id()%>">
    <div class="item-row">
        <div class="item-col fixed item-col-check">
            <label class="item-check" id="select-all-items">
                <input type="checkbox" class="checkbox">
                <span></span>
            </label>
        </div>
        <div class="item-col item-col-title" style="text-align: center;margin: 0;">
            <div class="item-heading">Mã slide</div>
            <div class="sales" style="text-align: center">#<%=list.getSlide_id()%>
            </div>
        </div>
        <div class="item-col item-col-sales" style="text-align: center; max-width: 150px">
            <div class="item-heading">Mô tả</div>
            <div class="sales" style="text-align: center">
                <%=list.getSlide_desc()%>
            </div>
        </div>
        <div class="item-col fixed item-col-img md"
             style="padding: 0 !important; max-width: 200px; text-align: center;">
            <div class="item-heading">Ảnh</div>
            <div>
                <a href="">
                    <img src="<%=list.getSlide_link()%>" width=60px
                         height=40px alt="">
                </a>
            </div>
        </div>
        <div class="item-col item-col-author" style="text-align: center;margin: 0 20px;">
            <div class="item-heading">Trạng Thái</div>
            <div class="no-overflow" style="text-align: center">
                <%if (list.getSlide_status() == 1) {%>
                <a> Hiển thị </a>
                <%} else {%>
                <a> Đã Ẩn </a>
                <%}%>
            </div>
            <input type="text" id="status<%=list.getSlide_id()%>"
                   value="<%=list.getSlide_status()%>"
                   style="display: none">
        </div>
        <div class="item-col fixed item-col-actions-dropdown">
            <div class="item-actions-dropdown">
                <a class="item-actions-toggle-btn">
                                    <span class="inactive">
                                        <i class="fa fa-cog"></i>
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
                                if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("slider") && role.getPermission().equals("delete")) {
                        %>
                        <li>
                            <a class="remove" id="remove<%=list.getSlide_id()%>"
                               data-toggle="modal"
                               data-target="#confirm-modal" style="cursor: pointer">
                                <i class="fa fa-trash-o "></i>
                            </a>
                        </li>
                        <%
                            }
                            if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("slider") && role.getPermission().equals("update")) {
                        %>
                        <li>
                            <a class="edit"
                               href="slide-editor.jsp?id=<%=list.getSlide_id()%>">
                                <i class="fa fa-pencil"></i>
                            </a>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</li>
<%}%>