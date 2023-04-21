<%@ page import="vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 4/21/2023
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<PromotionCode> codes = (List<PromotionCode>) request.getAttribute("codes");
  NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
  for (PromotionCode code : codes) {%>
<li class="item">
  <div class="item-row">
    <div class="item-col fixed item-col-check">
      <label class="item-check" id="select-all-items">
        <input type="checkbox" class="checkbox">
        <span></span>
      </label>
    </div>
    <div class="item-col fixed item-col-sales" style="text-align: left; max-width: 130px;min-width: 130px;">
      <div class="item-heading">ID mã KM</div>
      <div>
        <a>
          <h4 class="item-title"><%=code.getCode_id()%>
          </h4>
        </a>
      </div>
    </div>
    <div class="item-col fixed item-col-sales"
         style="min-width:100px; text-align: center; max-width: 100px">
      <div class="item-heading">Tên mã KM</div>
      <div>
        <a>
          <h4 class="item-title"><%=code.getName_code()%>
          </h4>
        </a>
      </div>
    </div>
    <div class="item-col fixed pull-left item-col-category"
         style="min-width: 130px; max-width: 130px; margin-left: 40px;">
      <div class="item-heading">Mô tả mã KM</div>
      <div>
        <a>
          <h4 class="item-title"><%=code.getDesc_code()%>
          </h4>
        </a>
      </div>
    </div>
    <div class="item-col fixed pull-left item-col-category"
         style="min-width: 150px; max-width: 150px; margin-left: 20px">
      <div class="item-heading">Loại mã</div>
      <div>
        <a>
          <h4 class="item-title"><%=code.getType_code()%>
          </h4>
        </a>
      </div>
    </div>
    <div class="item-col item-col-stats" style="margin-left: -10px">
      <div class="item-heading">Giảm giá</div>
      <div class="sales" style="text-align: center"><%=format.format(code.getDiscount_money())%>đ
      </div>
    </div>
    <div class="item-col item-col-author" style="text-align: center">
      <div class="item-heading">Trạng thái</div>
      <div class="no-overflow">
        <a><%=code.getStatus() == 1 ? "Hiển thị" : "Đã ẩn"%>
        </a>
      </div>
    </div>
    <div class="item-col item-col-date no-overflow">
      <div class="item-heading">Ngày bắt đầu</div>
      <div class="no-overflow"><%=code.getStart_date()%>
      </div>
    </div>
    <div class="item-col item-col-date">
      <div class="item-heading">Ngày kết thúc</div>
      <div class="no-overflow" style="text-align: center">
        <%=code.getEnd_date()%>
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
            <% AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
              for (AdminRole role : admin.getRole()) {
                if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("sales") && role.getPermission().equals("delete")) {
            %>
            <li>
              <a class="remove" href="#" data-toggle="modal"
                 data-target="#confirm-modal" id="delete<%=code.getCode_id()%>">
                <i class="fa fa-trash-o"></i>
              </a>
            </li>
            <%
              }
              if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("sales") && role.getPermission().equals("update")) {
            %>
            <li>
              <a class="edit" href="promotion-editor.jsp?id=<%=code.getCode_id()%>">
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