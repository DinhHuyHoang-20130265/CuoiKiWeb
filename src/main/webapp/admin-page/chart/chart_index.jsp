<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ChartService" %><%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 4/14/2023
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<% Map<String, Integer> chart1 = ChartService.getInstance().SaledProductByNearest6Months();%>
<script>
    // drawing visits chart
    drawVisitsChart();

    function drawVisitsChart() {
        var dataVisits = [
            <% int i = 0;
            boolean check = false;
            for (String key : chart1.keySet()) {
            i++;
            if (i == chart1.keySet().size()) {
                check = true;
            }%>
            {x: '<%=key%>', y: <%=chart1.get(key)%>}<%=check ? "" : ","%>
            <% } %>

        ];
        <%int minValue = Integer.MAX_VALUE;
        for (int value : chart1.values()) {
            if (value < minValue) {
                minValue = value;
            }
        }%>
        Morris.Line({
            element: 'dashboard-visits-chart',
            data: dataVisits,
            xkey: 'x',
            ykeys: ['y'],
            ymin: 'auto <%=minValue%>',
            labels: ['Sales'],
            xLabels: "month",
            hideHover: 'auto',
            yLabelFormat: function (y) {
                // Only integers
                if (y === parseInt(y, 10)) {
                    return y;
                } else {
                    return '';
                }
            },
            resize: true,
            lineColors: [
                config.chart.colorSecondary.toString(),
            ],
            pointFillColors: [
                config.chart.colorPrimary.toString(),
            ]
        });
    }
</script>
