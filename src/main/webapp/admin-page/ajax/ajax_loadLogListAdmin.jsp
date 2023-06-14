<%@ page import="vn.edu.hcmuaf.fit.beans.Log.LogAdmin" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<LogAdmin> loadLogs = (List<LogAdmin>) request.getAttribute("loadLogs");
    if (loadLogs != null)
        for (LogAdmin log : loadLogs) {%>
<li class="item log-row
<%=log.getId()%>
">
    <div class="item-row">
        <div class="item-row">
            <div class="item-col fixed item-col-check">
                <label class="item-check" id="select-all-items">
                    <input type="checkbox" class="checkbox">
                    <span></span>
                </label>
            </div>
            <div class="item-col fixed item-col-img md"
                 style="justify-content: center;min-width: 100px;margin: 0 10px;">
                <span>#<%=log.getId()%></span>
            </div>
            <div class="item-col fixed pull-left item-col-title"
                 style="padding: 0 !important; max-width: 100px; text-align: center;">
                <div class="item-heading">Level</div>
                <div>
                    <a>
                        <h4 class="item-title"><%=log.getLevel()%>
                        </h4>
                    </a>
                </div>
            </div>
            <div class="item-col item-col-sales" style="text-align: center;margin: 0 5px;">
                <div class="item-heading">Loại Thông Báo</div>
                <div class="sales" style="text-align: center"><%=log.getType()%>
                </div>
            </div>
            <div class="item-col item-col-author" style="text-align: center;margin: 0 10px;">
                <div class="item-heading">Thông báo</div>
                <div class="no-overflow" style="text-align: center">
                    <%=log.getMessage()%>
                </div>
            </div>
            <div class="item-col item-col-date" style="text-align: center;margin: 0 20px;">
                <div class="item-heading">Ngày thêm</div>
                <div class="no-overflow"><%=log.getCreated_date()%>
                </div>
            </div>
            <div class="item-col fixed item-col-actions-dropdown" style="margin-left: auto !important;">
                <div class="item-actions-dropdown " >
                    <a class="item-actions-toggle-btn ">
                                <span class="inactive">
                                    <i class="fa fa-cog" style="margin-top: 5px;"></i>
                                </span>
                        <span class="active">
                                    <i class="fa fa-chevron-circle-right" style="margin-top: 5px"></i>
                                </span>
                    </a>
                    <div class="item-actions-block" style="margin-top: 1px">
                        <ul class="item-actions-list" style="margin-top: 1px;">
                            <%
                                AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
                                for (AdminRole role : admin.getRole()) {
                                    if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("log") && role.getPermission().equals("delete")) {
                            %>
                            <li>
                                <a class="remove" id="remove<%=log.getId()%>"
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
    </div>
</li>
<%}%>
