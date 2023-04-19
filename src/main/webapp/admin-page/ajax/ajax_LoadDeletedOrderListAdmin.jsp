<%@ page import="vn.edu.hcmuaf.fit.beans.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SiteUser" %>
<%@ page import="vn.edu.hcmuaf.fit.services.AccountService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 4/18/2023
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("Deletedorders");
    NumberFormat formatter = NumberFormat.getInstance(new Locale("vn", "VN"));
    if (orders != null) {
        for (Order order : orders) {
            SiteUser siteUser = AccountService.getInstance().getAccountById(order.getCustomer_id()); %>
<tr class="order" id="order<%=order.getOrd_id()%>">
    <td class="cursor-pointer">
        <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
             width="20" height="20">
        </svg>
    </td>
    <td class="no-wrap pl-0">
        <a href="order-details.jsp?id=<%=order.getOrd_id()%>">#<%=order.getOrd_id()%>
        </a>
        <div class="d-inline-block">
                                                    <span class="ml-1">
                                                        <svg class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                                                             width="14" height="14">
                                                                    <svg
                                                                            viewBox="0 0 20 20">
                                                                        <path
                                                                                d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                                                                        </path>
                                                                    </svg></svg>
                                                    </span>
        </div>
    </td>
    <td class="order-date"><%=order.getOrd_date()%>
    </td>
    <td class="max-width-200px">
        <div class="trigger">
                                                    <span>
                                                        <div class="order_list_customer">
                                                            <p class="mb-0 px-2 align-items-center word-break">
                                                                <span class="omni-shorten-text"
                                                                      title="<%=(siteUser == null || siteUser.getUsername() == null) ? order.getCustomer_id() : siteUser.getUsername()%>"><%=(siteUser == null || siteUser.getUsername() == null) ? order.getCustomer_id() : siteUser.getUsername()%></span>
                                                            </p>
                                                        </div>
                                                    </span>
        </div>
    </td>
    <td>
        <div class="status-component">
            <%if (order.getPayment_status() == 0) { %>
            <span class="circle-status mr-2 circle-status-purchase-4"></span>
            <span class="badges--purchase-order-status-4">Chưa thanh toán</span>
            <% } else { %>
            <span class="circle-status mr-2 circle-status-confirmed"></span>
            <span class="badges--purchase-order-status-3">Đã thanh toán</span>
            <% }%>
        </div>
    </td>
    <td>
        <div class="d-flex">
            <div class="status-component">
                <%if (order.getDelivered() == -1) { %>
                <span class="circle-status mr-2 circle-status-shipment_notyet"></span><span
                    class="badges--shipment-cod-status-2">
                                                                    Chưa giao hàng</span>
                <% } else if (order.getDelivered() == 0) { %>
                <span class="circle-status mr-2 circle-status-shipment_ontheway"></span><span
                    class="badges--order-payment-status-5">
                                                                    Đang giao hàng</span>
                <% } else { %>
                <span class="circle-status mr-2 circle-status-shipment_done"></span><span
                    class="badges--carrier-status-4">
                                                                    Đã giao hàng</span>
                <% }%>
            </div>
        </div>
    </td>
    <td>
        <div class="d-flex">
            <div class="status-component">
                <%if (order.getStatus() == 0) { %>
                <span
                        class="circle-status mr-2 circle-status-cancel"></span><span
                    class="badges--order-status-cancel">
                                                                    Chưa xác nhận</span>
                <% } else { %>
                <span
                        class="circle-status mr-2 circle-status-complete"></span><span
                    class="badges--carrier-status-4">
                                                                    Đã xác nhận</span>
                <% }%>
            </div>
        </div>
    </td>
    <td>
        <div class="d-flex">
            <div class="status-component">
                <%if (order.getIsCanceled() == 0) { %>
                <span
                        class="circle-status mr-2 circle-status-cancel"></span><span
                    class="badges--order-status-cancel">
                                                                    Đã Hủy</span>
                <% } else { %>
                <span
                        class="circle-status mr-2 circle-status-complete"></span><span
                    class="badges--carrier-status-4">
                                                                    Đang hoạt động</span>
                <% }%>
            </div>
        </div>
    </td>
    <td class="text-right"><%=formatter.format(order.getTotal())%>
    </td>
    <td>
        <%
            AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
            for (AdminRole role : admin.getRole()) {
                if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("order") && role.getPermission().equals("delete")) {
        %>
        <a style="cursor: pointer" class="rollback" href="#" data-toggle="modal"
           data-target="#confirm-modal"
           id="rollback<%=order.getOrd_id()%>">
            <i class="fa fa-recycle" style="color: green" title="Khôi phục đơn hàng"></i>
        </a>
        <a style="cursor: pointer" class="remove" href="#" data-toggle="modal"
           data-target="#confirm-modal"
           id="remove<%=order.getOrd_id()%>">
            <i class="fa fa-trash" style="color: red" title="Xóa đơn khỏi hệ thống"></i>
        </a>
        <% }
        }
        %>
    </td>
</tr>
<% }
}%>
