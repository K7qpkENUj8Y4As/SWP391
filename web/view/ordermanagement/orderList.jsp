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
        
        /* Nút lọc */
button {
    background-color: #d6336c;
    color: white;
    border: none;
    padding: 10px 20px;
    margin: 5px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #c1356d;
}

button:focus {
    outline: none;
}



.filter-container {
    display: flex;
    gap: 20px;
    margin-bottom: 15px;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-btn {
    background-color: #d6336c;
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
}

.dropdown-btn:hover {
    background-color: #c32f60;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #fff;
    min-width: 160px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    border-radius: 5px;
    margin-top: 5px;
}

.dropdown-content button {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    background-color: #fff;
    border: none;
    width: 100%;
    text-align: left;
}

.dropdown-content button:hover {
    background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropdown-btn {
    background-color: #c32f60;
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
                
          <div class="filter-container">
    <div class="dropdown">
        <button class="dropdown-btn">Status</button>
        <div class="dropdown-content">
            <button onclick="filterStatus('All')">All Status</button>
            <button onclick="filterStatus('Paid')">Paid</button>
            <button onclick="filterStatus('Unpaid')">Unpaid</button>
             <button onclick="filterDelivery('Delivered')">Delivered</button>
            <button onclick="filterDelivery('Not Delivered')">Not Delivered</button>
        </div>
    </div>

   
</div>


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
<!--                                <td>
                                    <select onchange="updateDeliveryStatus(${o.id}, this)">
                                        <option value="Delivered" ${o.deliveryStatus == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                        <option value="Not Delivered" ${o.deliveryStatus == 'Not Delivered' ? 'selected' : ''}>Not Delivered</option>
                                    </select>
                                </td>-->
<!--<td data-order="${o.deliveryStatus == 'Delivered' ? 1 : 0}">
    <span class="delivery-text" style="display:none;">${o.deliveryStatus}</span>
    <select onchange="updateDeliveryStatus(${o.id}, this)">
        <option value="Delivered" ${o.deliveryStatus == 'Delivered' ? 'selected' : ''}>Delivered</option>
        <option value="Not Delivered" ${o.deliveryStatus == 'Not Delivered' ? 'selected' : ''}>Not Delivered</option>
    </select>
</td>-->
<td data-order="${o.deliveryStatus == 'Delivered' ? 1 : 0}">
    <span class="delivery-text" style="display:none;">${o.deliveryStatus}</span>
    <select onchange="updateDeliveryStatus(${o.id}, this)" data-original-value="${o.deliveryStatus}">
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
//    $(document).ready(function () {
//        $('#ordersTable').DataTable();
//    });
$(document).ready(function () {
    $('#ordersTable').DataTable({
        "columnDefs": [
            {
                "targets": 5, // Delivery column index
                "render": function (data, type, row, meta) {
                    var cell = row[5];
                    var el = $('<div>').html(cell);
                    return el.find('.delivery-text').text(); // lấy giá trị thực

                }
            }
        ]
    });
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

//    function updateDeliveryStatus(orderId, selectElement) {
//        const newDeliveryStatus = selectElement.value;
//
//        const formData = new FormData();
//        formData.append("orderId", orderId);
//        formData.append("deliveryStatus", newDeliveryStatus);
//
//        fetch("orders", {
//            method: "POST",
//            body: formData
//        }).then(res => {
//            if (res.ok) {
//                alert("Delivery status updated successfully!");
//                location.reload();
//            } else {
//                alert("Failed to update delivery status.");
//            }
//        }).catch(err => {
//            alert("System error!");
//            console.error(err);
//        });
//    }
 function updateDeliveryStatus(orderId, selectElement) {
    const newDeliveryStatus = selectElement.value;
    
    // Lấy giá trị status từ UI hoặc sử dụng giá trị mặc định
    // Ví dụ: giả sử bạn muốn giữ nguyên status hiện tại
    const status = 1; // hoặc 0 tùy vào logic của bạn

    const formData = new FormData();
    formData.append("orderId", orderId);
    formData.append("deliveryStatus", newDeliveryStatus);
    formData.append("status", status);

    fetch("orders", {
        method: "POST",
        body: formData
    }).then(res => {
        if (res.ok) {
            alert("Delivery status updated successfully!");
            location.reload();
        } else {
            alert("Failed to update delivery status .");
        }
    }).catch(err => {
        alert("System error!");
        console.error(err);
    });
}
//function updateDeliveryStatus(orderId, selectElement) {
//    const newDeliveryStatus = selectElement.value;
//    
//    // Thông báo cho người dùng biết về tác động phụ
//    let confirmMessage = "Bạn có chắc muốn thay đổi trạng thái giao hàng?";
//    if (newDeliveryStatus === "Delivered") {
//        confirmMessage = "Thay đổi trạng thái thành Đã giao hàng sẽ tự động đánh dấu đơn hàng là Đã thanh toán. Bạn có chắc không?";
//    } else {
//        confirmMessage = "Thay đổi trạng thái thành Chưa giao hàng sẽ tự động đánh dấu đơn hàng là Chưa thanh toán. Bạn có chắc không?";
//    }
//    
//    if (confirm(confirmMessage)) {
//        const formData = new FormData();
//        formData.append("orderId", orderId);
//        formData.append("deliveryStatus", newDeliveryStatus);
//
//        fetch("orders", {
//            method: "POST",
//            body: formData
//        }).then(res => {
//            if (res.ok) {
//                alert("Cập nhật trạng thái thành công!");
//                location.reload();
//            } else {
//                alert("Không thể cập nhật trạng thái.");
//            }
//        }).catch(err => {
//            alert("Lỗi hệ thống!");
//            console.error(err);
//        });
//    } else {
//        // Nếu người dùng hủy, reset dropdown về giá trị cũ
//        selectElement.value = selectElement.getAttribute("data-original-value") || 
//                            (newDeliveryStatus === "Delivered" ? "Not Delivered" : "Delivered");
//    }
//}
</script>
<script>
    function filterStatus(status) {
        const table = $('#ordersTable').DataTable();
        if (status === "All") {
            table.column(3).search('').draw(); // Cột Status là cột thứ 4 (index 3)
        } else {
            table.column(3).search('^' + status + '$', true, false).draw();
        }
    }
</script>
<script>
//  
//    function filterDelivery(deliveryStatus) {
//    const table = $('#ordersTable').DataTable();
//    if (deliveryStatus === "All") {
//        table.column(5).search('').draw(); // Lọc theo cột Delivery
//    } else {
//        table.column(5).search('^' + deliveryStatus + '$', true, false).draw(); // Tìm kiếm chính xác

function filterDelivery(deliveryStatus) {
    const table = $('#ordersTable').DataTable();
    if (deliveryStatus === "All") {
        table.column(5).search('').draw(); // Lọc theo cột Delivery
    } else {
        table.column(5).search('^' + deliveryStatus + '$', true, false).draw(); // Tìm kiếm chính xác
    }
}
    </script>


</body>
</html>
