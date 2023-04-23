<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ChartService" %><%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 4/14/2023
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<script>
    drawMorrisCharts();

    function drawMorrisCharts() {
        Morris.Line({
            element: 'morris-one-line-chart',
            data: [
                <%Map<String, Integer> orders = ChartService.getInstance().NumbOrderByNearest6Months();%>
                <% int j = 0;
               for (String key : orders.keySet()) {
               j++;%>
                {year: '<%=key%>', value: <%=orders.get(key)%>}<%=j==orders.keySet().size() ? "": ","%>
                <% } %>
            ],
            xkey: 'year',
            ykeys: ['value'],
            resize: true,
            lineWidth: 4,
            labels: ['T'],
            lineColors: [config.chart.colorPrimary.toString()],
            pointSize: 5,
        });

        <%Map<String, Integer> sales = ChartService.getInstance().TopSaleProductThisMonth();
        int i = 0;%>
        Morris.Donut({
            element: 'morris-donut-chart',
            data: [
                <%
                for (String key : sales.keySet()) {
                i++;%>
                {label: '<%=key%>', value: <%=sales.get(key)%>}<%=i==sales.keySet().size() ? "": ","%>
                <% } %>
            ],
            resize: true,
            colors: [
                tinycolor(config.chart.colorPrimary.toString()).lighten(10).toString(),
                tinycolor(config.chart.colorPrimary.toString()).darken(10).toString(),
                config.chart.colorPrimary.toString()
            ],
        });

        <%Map<String, Double> revenue = ChartService.getInstance().RevenueNearest6Months();
                int k = 0;%>
        Morris.Bar({
            element: 'morris-bar-chart',
            data: [
                <%
               for (String key : revenue.keySet()) {
               k++;%>
                {y: '<%=key%>', total: <%=revenue.get(key)%>}<%=k==revenue.keySet().size() ? "": ","%>
                <% } %>
            ],
            xkey: 'y',
            ykeys: ['total'],
            labels: ['total'],
            hideHover: 'auto',
            resize: true,
            barColors: [
                config.chart.colorPrimary.toString(),
                tinycolor(config.chart.colorPrimary.toString()).darken(10).toString()
            ],
        });
    }
</script>
