<!-- thankyou.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thank You</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f6f8fa;
            text-align: center;
            padding-top: 80px;
        }
        .container {
            background-color: white;
            display: inline-block;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .btn {
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.2s ease-in-out;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Cảm ơn bạn đã mua hàng!</h1>
    <p>Chúng tôi sẽ xử lý đơn hàng của bạn sớm nhất có thể.</p>
    <a href="${pageContext.request.contextPath}/" class="btn">Quay lại trang chủ</a>
</div>
</body>
</html>
