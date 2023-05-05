<%@ page import="vn.edu.hcmuaf.fit.beans.LogAdmin" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<LogAdmin> loadLogs = (List<LogAdmin>) request.getAttribute("loadLogs");
    if (loadLogs != null)
        for (LogAdmin log : loadLogs) {%>
<li class="item log-row
<%=log.getId()%>
">
    <div class="item-row log-container">
        <div class="log-item">
            <div class="log-pic"></div>
            <div class="log-content">
                <div class="log-msg">
                    <div class="log-txt" style="text-align: left">
                        <%=log.getMessage()%>
                    </div>
                </div>
                <div class="log-date">
                    <div class="" style="text-align: left;">
                        <div class="">
                            <i>
                                Ngày <%=log.getCreated_date()%>
                            </i>
                        </div>
                    </div>
                </div>
            </div>
<%--            <div class="log-undisplay"></div>--%>
            <div class="item-col fixed item-col-actions-dropdown log-btn"
                 style="margin-left: auto !important;"
            >
                <div class="item-actions-dropdown " >
                    <a class="item-actions-toggle-btn ">
                                    <span class="inactive">
                                        <i class="fa fa-cog" style="margin-top: 5px;display: none"></i>
                                    </span>
                        <span class="active">
                                        <i class="fa fa-chevron-circle-right" style="margin-top: 5px"></i>
                                    </span>
                    </a>
                    <div class="item-actions-block" style="margin-top: 1px">
                        <ul class="item-actions-list" style="margin-top: 1px;">
                            <%--                        <%--%>
                            <%--                          for (AdminRole role : admin.getRole()) {--%>
                            <%--                            if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("log") && role.getPermission().equals("delete")) {--%>
                            <%--                        %>--%>
                            <li>
                                <a class="remove" id="remove<%=log.getId()%>"
                                   data-toggle="modal"
                                   data-target="#confirm-modal" style="cursor: pointer">
                                    <i class="fa fa-trash-o "></i>
                                </a>
                            </li>
                            <%--                        <%--%>
                            <%--                            }--%>
                            <%--                          }--%>
                            <%--                        %>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</li>
<%}%>
