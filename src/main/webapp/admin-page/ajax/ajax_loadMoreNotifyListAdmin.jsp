<%@ page import="vn.edu.hcmuaf.fit.beans.Notify_Admin" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Notify_Admin> loadMoreNotify = (List<Notify_Admin>) request.getAttribute("loadMoreNotify");
    if (loadMoreNotify != null)
        for (Notify_Admin notify : loadMoreNotify) {%>
<li class="item<%=notify.getId()%>">
    <div class="item-row">
        <div class="item-col fixed item-col-check" style="margin-left: 20px">
            <label class="item-check" id="select-all-items">
                <input type="checkbox" class="checkbox">
                <span></span>
            </label>
        </div>
        <div class="item-col fixed pull-left item-col-title"
             style="max-width: 115px !important;">
            <div class="item-heading">Mã thông báo</div>
            <div>
                <a>
                    <h4 class="item-title"><%=notify.getId()%>
                    </h4>
                </a>
            </div>
        </div>
        <div class="item-col item-col-sales" style="text-align: left!important;">
            <div class="item-heading">Mã đơn hàng</div>
            <div class="sales" style="text-align: left; padding-left:55px">
                <%=notify.getOrder_id()%>
            </div>
        </div>
        <div class="item-col item-col-category">
            <div class="item-heading">Thông báo</div>
            <div class="sales" style="text-align: left">
                <%=notify.getContent()%>
            </div>
        </div>
        <div class="item-col item-col-date" style="text-align: center;">
            <div class="item-heading">Ngày thêm</div>
            <div class="no-overflow"><%=notify.getCreated_date()%>
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
                        <%
                            AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
                            for (AdminRole role : admin.getRole()) {
                            if (role.getTable().equals("admin") && role.getPermission().equals("admin") || role.getTable().equals("notify") && role.getPermission().equals("delete")) {
                        %>
                        <li>
                            <a class="remove" id="remove<%=notify.getId()%>"
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
<%
        }%>