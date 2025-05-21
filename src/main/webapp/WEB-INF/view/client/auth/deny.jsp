<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Không đủ quyền truy cập</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        h1 {
            color: #dc3545;
            font-size: 2.5rem;
        }
        p {
            margin: 20px 0;
            font-size: 1.2rem;
        }
        button {
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h1>🚫 Không đủ quyền truy cập</h1>
    <p>Bạn không có quyền truy cập vào trang này.</p>
    <button onclick="history.back()">Quay lại</button>

</body>
</html>
