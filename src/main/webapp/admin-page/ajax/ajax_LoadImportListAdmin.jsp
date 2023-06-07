<%@ page import="vn.edu.hcmuaf.fit.beans.import_product.ImportProduct" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ImportProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<ImportProduct> imports = (List<ImportProduct>) request.getAttribute("imports");%>
<%
    for (ImportProduct importProduct : imports) {
        AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
%>
<tr class="item">
    <td>
        <%= importProduct.getId() %>
    </td>
    <td>
        <%= importProduct.getId_prod() %>
    </td>
    <td>
        <%= importProduct.getProd_name() %>
    </td>
    <td>
        <%= importProduct.getQuantity() %>
    </td>
    <td>
        <%= importProduct.getImport_by() %>
    </td>
    <td>
        <%= importProduct.getDate_import() %>
    </td>
    <td>
        <div class="item-actions-dropdown">
            <div class="item-actions-block">
                <ul class="item-actions-list">
                    <% for (AdminRole role : admin.getRole()) {
                        if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("import") && role.getPermission().equals("delete")) { %>
                    <li style="list-style: none">
                        <a class="remove" id="remove<%= importProduct.getId() %>"
                           data-toggle="modal"
                           data-target="#confirm-modal" style="cursor: pointer">
                            <i class="fa fa-trash-o" style="color: red"></i>
                        </a>
                    </li>
                    <% }
                    } %>
                </ul>
            </div>
        </div>
    </td>
</tr>
<% } %>

