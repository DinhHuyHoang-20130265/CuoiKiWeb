<%@ page import="vn.edu.hcmuaf.fit.beans.promotion.Promotion" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 1/8/2023
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Promotion> promotions = (List<Promotion>) request.getAttribute("promotions");
  for (Promotion p : promotions) {%>
<li class="item">
  <div class="item-row">
    <div class="item-col fixed item-col-check">
      <label class="item-check" id="select-all-items">
        <input type="checkbox" class="checkbox">
        <span></span>
      </label>
    </div>
    <div class="item-col fixed item-col-sales" style="text-align: center">
      <div class="item-heading">Mã sản phẩm</div>
      <div>
        <a>
          <h4 class="item-title"><%=p.getProduct_id()%>
          </h4>
        </a>
      </div>
    </div>
    <div class="item-col fixed item-col-sales" style="text-align: center; max-width: 100px; margin-left: 50px">
      <div class="item-heading">Tên KM</div>
      <div>
        <a>
          <h4 class="item-title"><%=p.getName_prom()%>
          </h4>
        </a>
      </div>
    </div>
    <div class="item-col fixed pull-left item-col-category" style="max-width: 180px; margin-left: 40px;" >
      <div class="item-heading">Mô tả KM</div>
      <div>
        <a>
          <h4 class="item-title"><%=p.getDesc_prom()%>
          </h4>
        </a>
      </div>
    </div>
    <div class="item-col item-col-stats">
      <div class="item-heading">Tỉ lệ</div>
      <div class="sales" style="text-align: center"><%=p.getDiscount_rate()%>
      </div>
    </div>
    <div class="item-col item-col-author" style="text-align: center">
      <div class="item-heading">Trạng thái</div>
      <div class="no-overflow">
        <a><%=p.getStatus() == 1 ? "Hiển thị" : "Đã ẩn"%>
        </a>
      </div>
    </div>
    <div class="item-col item-col-date no-overflow">
      <div class="item-heading">Ngày bắt đầu</div>
      <div class="no-overflow"><%=p.getStart_date()%>
      </div>
    </div>
    <div class="item-col item-col-date" >
      <div class="item-heading">Ngày kết thúc</div>
      <div class="no-overflow" style="text-align: center">
        <%=p.getEnd_date()%>
      </div>
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
              <a class="remove" href="#" data-toggle="modal"
                 data-target="#confirm-modal" id="delete<%=p.getPromo_id()%>">
                <i class="fa fa-trash-o"></i>
              </a>
            </li>
            <li>
              <a class="edit" href="promotion-editor.jsp?id=<%=p.getPromo_id()%>">
                <i class="fa fa-pencil"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</li>
<%}%>
