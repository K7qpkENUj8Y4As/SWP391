<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Quản lý đơn hàng</title>
    <style>
        :root {
            --primary-color: #d6336c;
            --secondary-color: #f06595;
            --accent-color: #ffdeeb;
            --bg-color: #fff8f8;
            --text-color: #444;
            --light-text: #777;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: var(--accent-color);
            color: var(--primary-color);
            font-weight: 600;
        }

        tr:hover:not(.details) {
            background-color: var(--accent-color);
        }

        .btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: var(--secondary-color);
        }

        .details {
            display: none;
            background-color: #fff0f5;
        }

        .details table {
            margin-top: 10px;
            background-color: white;
            border-radius: 10px;
            box-shadow: none;
        }

        .details th {
            background-color: var(--accent-color);
            color: var(--primary-color);
        }

        h4 {
            color: var(--primary-color);
            margin-bottom: 10px;
        }
    </style>

    <script>
        function toggleDetails(orderId) {
            var detailsRow = document.getElementById("details-" + orderId);
            if (detailsRow.style.display === "none" || detailsRow.style.display === "") {
                detailsRow.style.display = "table-row";
            } else {
                detailsRow.style.display = "none";
            }
        }
    </script>
</head>
<body>
<h2>Danh sách đơn hàng</h2>

<table>
    <tr>
        <th>Mã đơn</th>
        <th>Tổng tiền</th>
        <th>Trạng thái</th>
        <th>Ngày tạo</th>
        <th>Mã khách hàng</th>
        <th>Hành động</th>
    </tr>

    <c:forEach var="order" items="${orderList}">
        <tr>
            <td>${order.id}</td>
            <td>${order.totalPrice}</td>
            <td>${order.status}</td>
            <td>${order.createAt}</td>
            <td>${order.customerId}</td>
            <td>
                <button class="btn" onclick="toggleDetails(${order.id})">Chi tiết</button>
            </td>
        </tr>

        <tr id="details-${order.id}" class="details">
            <td colspan="6">
                <h4>Chi tiết đơn hàng</h4>
                <table>
                    <tr>
                        <th>Mã sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Giá</th>
                        <th>Ngày thêm</th>
                    </tr>
                    <c:forEach var="item" items="${orderItemMap[order.id]}">
                        <tr>
                            <td>${item.productId}</td>
                            <td>${item.quantity}</td>
                            <td>${item.price}</td>
                            <td>${item.createAt}</td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
