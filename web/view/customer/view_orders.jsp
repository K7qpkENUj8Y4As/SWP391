<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
             padding-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        td {
            background-color: #f2f2f2;
            font-size: 14px;
        }
        .table-container {
            max-width: 1100px;
            margin: 0 auto;
        }
        .no-orders-message {
            text-align: center;
            font-size: 18px;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div>   
        <%@ include file="/view/components/Header.jsp" %>
    </div>

    <div class="container">
        <h2 >Your Orders</h2>

        <c:choose>
            <c:when test="${empty orders}">
                <p class="no-orders-message">You don't have any orders yet.</p>
            </c:when>
            <c:otherwise>
                <div class="table-container">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Total Price</th>
                                <th>Status</th>
                                <th>Created At</th>
                                <th>Delivery Status</th>
                                <th>Notes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><fmt:formatNumber value="${order.totalPrice}" type="number" pattern="#,###"/> VND</td>
                                    <td>${order.status == 1 ? 'Paid' : 'Unpaid'}</td>
                                    <td>${order.createAt}</td>
                                    <td>${order.deliveryStatus}</td>
                                    <td>${order.note}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <%@ include file="/view/components/Footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
