<%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 6/8/2023
  Time: 10:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kết quả giao dịch</title>
</head>
<body>
<input id="result" type="text" value="<%=request.getSession().getAttribute("payment_status")%>" style="display: none">

<script src="./assets/js/jquery-3.6.1.min.js"></script>
<script>
    if ($("#result").val() === "Success") {
        let access_token
        $.ajax({
            url: "./API/Login",
            type: "post",
            success: function (data) {
                access_token = data.access_token
                $.ajax({
                    url: "./API/Register",
                    data: {
                        access_token: access_token
                    },
                    type: "post",
                    success: function (data) {
                    },
                    error: function (data) {
                        console.log(data)
                    }
                })
            },
            error: function (data) {
                console.log(data)
            }
        })
        alert("Thanh toán thành công, cảm ơn bạn đã mua hàng tại P&T Shop !")
        window.location.href = 'index.jsp'
    } else if ($("#result").val() === "Failed") {
        alert("Thanh toán thất bại !")
        window.location.href = 'pay.jsp'
    } else {
        alert("Có lỗi xảy ra trong quá trình giao dịch !")
        window.location.href = 'pay.jsp'
    }

</script>
</body>
</html>
