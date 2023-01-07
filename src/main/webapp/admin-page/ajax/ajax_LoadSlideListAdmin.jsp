<%@ page import="vn.edu.hcmuaf.fit.DAO.SlideDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.slide.Slide" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 1/7/2023
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Slide> slides =  (List<Slide>) request.getAttribute("loadSlide");%>
<%for(Slide list: slides) { %>
<li class="item" id="item<%=list.getSlide_id()%>">
  <div class="item-row">
    <div class="item-col fixed item-col-check">
      <label class="item-check" id="select-all-items">
        <input type="checkbox" class="checkbox">
        <span></span>
      </label>
    </div>
    <div class="item-col item-col-sales" style="text-align: center;margin: 0 50px;">
      <div class="item-heading">Mã slide</div>
      <div class="sales" style="text-align: center">#<%=list.getSlide_id()%>
      </div>
    </div>
    <div class="item-col fixed item-col-img md"
         style="padding: 0 !important; max-width: 200px; text-align: center;">
      <div class="item-heading">Ảnh</div>
      <div>
        <a href="">
          <img src="<%=list.getSlide_link()%>" width=40px
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
            <li>
              <a class="remove" id="remove<%=list.getSlide_id()%>"
                 data-toggle="modal"
                 data-target="#confirm-modal" style="cursor: pointer">
                <i class="fa fa-trash-o "></i>
              </a>
            </li>
            <li>
              <a class="info" id="info<%=list.getSlide_id()%>"
                 style="cursor: pointer">
                <i class="fa fa-info-circle"></i>
              </a>
            </li>
            <li>
              <a class="toggle" id="toggle<%=list.getSlide_id()%>"
                 style="cursor: pointer">
                <%
                  if (list.getSlide_status() == 1) { %>
                <i class="fa fa-toggle-off" style="color: #0b3d88"></i>
                <% } else { %>
                <i class="fa fa-toggle-on" style="color: green"></i>
                <%} %>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</li>
<%}%>