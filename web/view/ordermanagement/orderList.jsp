<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <title>Order List</title>
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }

        h2 {
            color: #d6336c;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #ffdeeb;
            color: #d6336c;
        }

        tr:hover {
            background-color: #fff0f5;
        }

        .details-table {
            margin-top: 30px;
            display: none;
        }

        .details-title {
            margin-top: 30px;
            color: #d6336c;
            font-weight: bold;
        }

        .customer-card {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            margin-top: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }

        .customer-card h3 {
            color: #d6336c;
            margin-bottom: 15px;
        }

        .customer-card p {
            margin: 5px 0;
        }

        .wrapper {
            display: flex;
            flex-direction: row;
        }

        .sidebar {
            width: 250px;
            flex-shrink: 0;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            overflow-x: auto;
        }
    </style>

    <!-- jQuery + DataTables JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
</head>
<body>

<%@ include file="/view/dashboard/sidebar.jsp" %>

<div style="margin-left: 250px; padding: 20px">
    <h2 style="margin-bottom: 10px;">Order List</h2>
</div>

<div class="wrapper">
    <div style="margin-left: 250px; padding: 20px;">
        <c:choose>
            <c:when test="${empty orders}">
                <p style="text-align:center; color: #888;">No orders available.</p>
            </c:when>
            <c:otherwise>
                <table id="ordersTable" class="display">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer ID</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Created At</th>
                            <th>Delivery</th>
                            <th>Note</th>
                            <th>Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${orders}">
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.customerId}</td>
                                <td>${o.totalPrice} đ</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${o.paid}">
                                            Paid
                                        </c:when>
                                        <c:otherwise>
                                            Unpaid
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${o.createAt}</td>
                                <td>
                                    <select onchange="updateDeliveryStatus(${o.id}, this)">
                                        <option value="Delivered" ${o.deliveryStatus == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                        <option value="Not Delivered" ${o.deliveryStatus == 'Not Delivered' ? 'selected' : ''}>Not Delivered</option>
                                    </select>
                                </td>
                                <td>${o.note}</td>
                                <td>
                                    <button onclick="loadOrderItems('${o.id}')">View Order Items</button>
                                    <button onclick="loadCustomerInfo('${o.customerId}', '${o.id}')">View Customer Info</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div style="margin-left: 250px; padding: 20px;">
    <!-- Order Details Table -->
    <div id="orderDetailsSection" class="details-table" style="flex: 2;">
        <h3 class="details-title">Order Details</h3>
        <table id="orderDetails">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Product ID</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody id="orderDetailsBody">
                <!-- Content will be loaded by AJAX -->
            </tbody>
        </table>
    </div>

    <!-- Customer Information -->
    <div id="customerInfoSection" class="customer-card" style="display: none;">
        <h3>Recipient Information</h3>
        <p><strong>Name:</strong> <span id="customerName"></span></p>
        <p><strong>Phone:</strong> <span id="customerPhone"></span></p>
        <p><strong>Address:</strong> <span id="customerAddress"></span></p>
    </div>
</div>

<!-- DataTables script -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#ordersTable').DataTable();
    });
</script>

<script>
    let currentOrderId = null;

    function loadOrderItems(orderId) {
        if (currentOrderId !== orderId) {
            $('#customerInfoSection').hide();
        }

        $.ajax({
            url: 'OrderItems',
            method: 'GET',
            data: {orderId: orderId},
            success: function (response) {
                $('#orderDetailsBody').html(response);
                $('#orderDetailsSection').show();
                $('html, body').animate({
                    scrollTop: $("#orderDetailsSection").offset().top
                }, 500);
                currentOrderId = orderId;
            },
            error: function () {
                alert("Failed to load order item data.");
            }
        });
    }

    function loadCustomerInfo(customerId, orderId) {
        if (currentOrderId !== orderId) {
            $('#orderDetailsSection').hide();
        }

        $('#customerInfoSection').hide();

        $.ajax({
            url: 'viewCustomer',
            method: 'GET',
            data: {customerId: customerId},
            success: function (response) {
                $('#customerInfoSection').html('<h3>Recipient Information</h3>' + response).show();
                $('html, body').animate({
                    scrollTop: $("#customerInfoSection").offset().top
                }, 500);
                currentOrderId = orderId;
            },
            error: function () {
                alert("Failed to load customer information.");
            }
        });
    }

    function updateDeliveryStatus(orderId, selectElement) {
        const newDeliveryStatus = selectElement.value;

        const formData = new FormData();
        formData.append("orderId", orderId);
        formData.append("deliveryStatus", newDeliveryStatus);

        fetch("orders", {
            method: "POST",
            body: formData
        }).then(res => {
            if (res.ok) {
                alert("Delivery status updated successfully!");
                location.reload();
            } else {
                alert("Failed to update delivery status.");
            }
        }).catch(err => {
            alert("System error!");
            console.error(err);
        });
    }
</script>

</body>
</html>
