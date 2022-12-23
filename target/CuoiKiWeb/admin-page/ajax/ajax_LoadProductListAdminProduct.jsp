<%@ page import="vn.edu.hcmuaf.fit.beans.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.category.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %><%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 12/11/2022
  Time: 9:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Product> products =  (List<Product>) request.getAttribute("product");%>
  <%for (Product p : products) {%>
  <li class="item">
    <div class="item-row">
      <div class="item-col fixed item-col-check">
        <label class="item-check" id="select-all-items">
          <input type="checkbox" class="checkbox">
          <span></span>
        </label>
      </div>
      <div class="item-col fixed item-col-img md">
        <a href="">
          <img src="<%=p.getMain_img_link()%>" width=40px
               height=40px>
        </a>
      </div>
      <div class="item-col fixed pull-left item-col-title">
        <div class="item-heading">Tên sản phẩm</div>
        <div>
          <a>
            <h4 class="item-title"><%=p.getProd_name()%>
            </h4>
          </a>
        </div>
      </div>
      <div class="item-col item-col-sales">
        <div class="item-heading">Mã sản phẩm</div>
        <div class="sales" style="text-align: center"><%=p.getId()%>
        </div>
      </div>
      <div class="item-col item-col-stats no-overflow">
        <div class="item-heading">Đã bán</div>
        <div class="no-overflow"> null
        </div>
      </div>
      <div class="item-col item-col-category no-overflow">
        <div class="item-heading">Loại sản Phẩm</div>
        <div class="no-overflow">
          <% String cate = "";
            List<Category> category = CategoryService.getInstance().getCateWithProductID(p.getId());
            for (Category c : category) {
              cate += c.getCate_name() + ", ";
            }%>
          <a><%=cate.substring(0, cate.length() - 2)%>
          </a>
        </div>
      </div>
      <div class="item-col item-col-author">
        <div class="item-heading">Trạng Thái</div>
        <div class="no-overflow" style="text-align: center">
          <a><%=p.getProd_status() == 1 ? "Hiển thị" : "Đã ẩn"%></a>
        </div>
      </div>
      <div class="item-col item-col-date">
        <div class="item-heading">Ngày thêm</div>
        <div class="no-overflow"><%=p.getReleased_date()%>
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
                if (role.getTable().equals("product") && role.getPermission().equals("delete")) {%>
              <li>
                <a class="remove" href="#" data-toggle="modal"
                   data-target="#confirm-modal" id="delete<%=p.getId()%>">
                  <i class="fa fa-trash-o"></i>
                </a>
              </li>
              <%}
                if (role.getTable().equals("product") && role.getPermission().equals("update")) {%>
              <li>
                <a class="edit" href="item-editor.jsp?id=<%=p.getId()%>">
                  <i class="fa fa-pencil"></i>
                </a>
              </li>
              <%}
              }%>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </li>
  <%}%>
