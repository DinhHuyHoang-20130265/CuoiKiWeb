<%@ page import="vn.edu.hcmuaf.fit.beans.import_product.ImportProduct" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ImportProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<ImportProduct> imports = (List<ImportProduct>) request.getAttribute("imports");%>
<div id="appendItem">
    <%
        for (ImportProduct importProduct : imports) {
    %>
    <li class="item">
        <div class="item-row">
            <div class="item-col fixed item-col-check">
                <label class="item-check" id="select-all-items">
                    <input type="checkbox" class="checkbox">
                    <span></span>
                </label>
            </div>
            <div class="item-col fixed pull-left item-col-title"
                 style="max-width: 125px !important;">
                <div class="item-heading">Mã nhập hàng</div>
                <div>
                    <a>
                        <h4 class="item-title"><%=importProduct.getId()%>
                        </h4>
                    </a>
                </div>
            </div>
            <div class="item-col item-col-sales" style="text-align: left!important;">
                <div class="item-heading">Mã sản phẩm</div>
                <div class="sales" style="text-align: left; padding-left:20px">
                    <%=importProduct.getId_prod()%>
                </div>
            </div>
            <div class="item-col item-col-category">
                <div class="item-heading">Tên sản phẩm</div>
                <div class="sales" style="text-align: left; margin-left: -69px">
                    <%=importProduct.getProd_name()%>
                </div>
            </div>
            <div class="item-col item-col-category" style="max-width: 125px; margin-left: -50px">
                <div class="item-heading">Số lượng nhập</div>
                <div class="sales" style="text-align: left; margin-left: -50px">
                    <%=importProduct.getQuantity()%>
                </div>
            </div>
            <div class="item-col item-col-author" style="max-width: 220px;">
                <div class="item-heading">Người nhập</div>
                <div class="no-overflow" style="text-align: center">
                    <a>
                        <%=importProduct.getImport_by()%>
                    </a>
                </div>
            </div>
            <div class="item-col item-col-author" style="max-width: 100px;">
                <div class="item-heading">Ngày nhập</div>
                <div class="no-overflow" style="text-align: center">
                    <a>
                        <%=importProduct.getDate_import()%>
                    </a>
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
                                    if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("import") && role.getPermission().equals("delete")) {
                            %>
                            <li>
                                <a class="remove" id="remove<%=importProduct.getId()%>"
                                   data-toggle="modal"
                                   data-target="#confirm-modal" style="cursor: pointer">
                                    <i class="fa fa-trash-o "></i>
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
</div>