<%@ page import="vn.edu.hcmuaf.fit.beans.contact.Contact" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: PV
  Date: 5/27/2023
  Time: 4:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Contact> loadContact = (List<Contact>) request.getAttribute("loadContact"); %>
<% if (loadContact != null)
    for (Contact contact : loadContact) { %>
<tr class="order" id="order<%=contact.getEmail()%>">
    <td class="cursor-pointer">
        <svg class="svg-next-icon animate-transition svg-next-icon-size-20 svg-next-icon-rotate-90"
             width="20" height="20">
        </svg>
    </td>
    <td class="no-wrap pl-0">
        <a href="contact-details.jsp?id=<%=contact.getId()%>">#<%=contact.getId()%>
        </a>
        <div class="d-inline-block">
            <span class="ml-1">
                <svg class="svg-next-icon ui-icon--notes position-top-minus-one svg-next-icon-size-14"
                     width="14" height="14">
                    <svg viewBox="0 0 20 20">
                        <path
                                d="M6 11V9h8v2H6zm0 4v-2h8v2H6zm0-8V5h4v2H6zm9.707-1.707l-3-3C12.52 2.105 12.267 2 12 2H5c-.553 0-1 .448-1 1v14c0 .552.447 1 1 1h10c.553 0 1-.448 1-1V6c0-.265-.105-.52-.293-.707z">
                        </path>
                    </svg></svg>
            </span>
        </div>
    </td>
    <td class="order-date"><%=contact.getCreated_date()%></td>
    <td style="max-width:300px">
        <div class="trigger">
            <span>
                <div class="order_list_customer">
                    <p class="mb-0 px-2 align-items-center word-break">
                        <span class="omni-shorten-text"
                              title="<%=contact.getName()%>>"><%=contact.getName()%></span>
                    </p>
                </div>
            </span>
        </div>
    </td>
    <td style="max-width:300px">
        <div class="trigger">
            <span>
                <div class="order_list_customer">
                    <p class="mb-0 px-2 align-items-center word-break">
                        <span class="omni-shorten-text"
                              title="<%=contact.getEmail()%>>"><%=contact.getEmail()%></span>
                    </p>
                </div>
            </span>
        </div>
    </td>
    <td>
        <div class="trigger">
            <span>
                <div class="order_list_customer">
                    <p class="mb-0 px-2 align-items-center word-break">
                        <span class="omni-shorten-text"
                              title="<%=contact.getPhone()%>>"><%=contact.getPhone()%></span>
                    </p>
                </div>
            </span>
        </div>
    </td>
    <td>
        <div class="trigger">
            <span>
                <div class="order_list_customer">
                    <p class="mb-0 px-2 align-items-center word-break">
                        <span class="omni-shorten-text"
                              title="<%=contact.getContent()%>>"><%=contact.getContent()%></span>
                    </p>
                </div>
            </span>
        </div>
    </td>
    <td>
        <div class="d-flex">
            <div class="status-component">
                <%if (contact.getStatus() == 0) { %>
                <span class="circle-status mr-2 circle-status-cancel"></span><span
                    class="badges--order-status-cancel">
                        Chưa trả lời</span>
                <% } else { %>
                <span
                        class="circle-status mr-2 circle-status-complete"></span><span
                    class="badges--carrier-status-4">
                         Đã trả lời</span>
                <% }%>
            </div>
        </div>
    </td>
    <td>
<%--        <%--%>
<%--            for (AdminRole role : admin.getRole()) {--%>
<%--                if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("order") && role.getPermission().equals("delete")) {--%>
<%--        %>--%>
        <a style="cursor: pointer" class="remove" href="#" data-toggle="modal"
           data-target="#confirm-modal"
           id="remove<%=contact.getId()%>">
            <i class="fa fa-trash" style="color: red"></i>
        </a>
<%--        <%--%>
<%--                }--%>
<%--            }--%>
<%--        %>--%>
    </td>
</tr>
<%}%>
