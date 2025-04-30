<%--

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách đơn hàng</title>
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
    </style>
</head>
<body>

<h2>Danh sách đơn hàng</h2>

<c:choose>
    <c:when test="${empty orders}">
        <p style="text-align:center; color: #888;">Không có đơn hàng nào.</p>
    </c:when>
    <c:otherwise>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã khách hàng</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Ngày tạo</th>
                    <th>Giao hàng</th>
                    <th>Ghi chú</th>
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
                                <c:when test="${o.status == 1}">Đã xác nhận</c:when>
                                <c:otherwise>Chưa xử lý</c:otherwise>
                            </c:choose>
                        </td>
                        <td>${o.createAt}</td>
                        <td>${o.deliveryStatus}</td>
                        <td>${o.note}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

</body>
</html>

--%>

<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách đơn hàng</title>
    <!-- Liên kết đến CSS của DataTables -->
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
    </style>
    <!-- Liên kết đến jQuery (yêu cầu cho DataTables) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Liên kết đến JS của DataTables -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
</head>
<body>

<h2>Danh sách đơn hàng</h2>

<c:choose>
    <c:when test="${empty orders}">
        <p style="text-align:center; color: #888;">Không có đơn hàng nào.</p>
    </c:when>
    <c:otherwise>
        <table id="ordersTable" class="display">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã khách hàng</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Ngày tạo</th>
                    <th>Giao hàng</th>
                    <th>Ghi chú</th>
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
                                <c:when test="${o.status == 1}">Đã thanh toán</c:when>
                                <c:otherwise>Chưa thanh toán</c:otherwise>
                            </c:choose>
                        </td>
                        <td>${o.createAt}</td>
                        <td>${o.deliveryStatus}</td>
                        <td>${o.note}</td>
<!--                        <td><a href="viewOrderItems?orderId=${o.id}">Xem Order Items</a></td>-->
                        <td><button onclick="loadOrderItems(${o.id})">View Detail</button></td>
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<!-- Khởi tạo DataTables sau khi tải xong trang -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#ordersTable').DataTable();  // Khởi tạo DataTables trên bảng với id 'ordersTable'
    });
</script>
<!-- Div chứa thông tin chi tiết OrderItem -->
<div id="orderDetails" style="display:none;">
    <h3>Chi tiết đơn hàng</h3>
    <table>
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Thành tiền</th>
            </tr>
        </thead>
        <tbody id="orderDetailsBody">
            <!-- Nội dung sẽ được load từ Servlet -->
        </tbody>
    </table>
</div>


<script>
function loadOrderItems(orderId) {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", "loadOrderItems?orderId=" + orderId, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            // Chèn thẳng HTML vào tbody
            document.getElementById("orderDetailsBody").innerHTML = xhr.responseText;
            document.getElementById("orderDetails").style.display = "block";
        } else {
            alert("Lỗi khi tải dữ liệu OrderItem.");
        }
    };
    xhr.send();
}
</script>



</body>
</html>
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>



    <head>
        <title>Danh sách đơn hàng</title>
        <!-- Liên kết đến CSS của DataTables -->
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
    width: 250px; /* hoặc kích thước phù hợp */
    flex-shrink: 0;
}

.main-content {
    flex: 1;
    padding: 20px;
    overflow-x: auto; /* Cho phép cuộn ngang nếu cần */
}

        </style>


        <!-- jQuery + DataTables JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    </head>
    <body>

        
        <%@ include file="/view/dashboard/sidebar.jsp" %>

<div style="margin-left: 250px; padding: 20px">
    <h2 style="margin-bottom: 10px;">Danh sách đơn hàng</h2>
</div>
        <div class="wrapper">
        
        <div style="margin-left: 250px; padding: 20px;">

        
        <c:choose>
            <c:when test="${empty orders}">
                <p style="text-align:center; color: #888;">Không có đơn hàng nào.</p>
            </c:when>
            <c:otherwise>
                <table id="ordersTable" class="display">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Mã khách hàng</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Ngày tạo</th>
                            <th>Giao hàng</th>
                            <th>Ghi chú</th>
                            <th>Chi tiết</th>
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
                                            Đã thanh toán
                                        </c:when>
                                        <c:otherwise>
                                            Chưa thanh toán
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
                                    <button onclick="loadOrderItems('${o.id}')">View OrderItem</button>

                                    <button onclick="loadCustomerInfo('${o.customerId}', '${o.id}')">View Customer Info</button>
                                </td>



                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
 </div>

            </div>
                
                 <div style="margin-left: 250px; padding: 20px;">
            </c:otherwise>
        </c:choose>

        <!-- Bảng chi tiết đơn hàng -->
        <div id="orderDetailsSection" class="details-table" style="flex: 2;">
            <h3 class="details-title">Chi tiết đơn hàng</h3>
            <table id="orderDetails">
                <thead>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Product ID</th>
                        <th>Số lượng</th>
                        <th>Giá</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody id="orderDetailsBody">
                    <!-- Nội dung được tải bằng AJAX -->
                </tbody>
            </table>
        </div>

        <!-- Thông tin người nhận -->
        <div id="customerInfoSection" class="customer-card" style="display: none;">
            <!-- Nội dung sẽ được thay bằng AJAX -->


            <h3>Thông tin người nhận</h3>
            <p><strong>Họ tên:</strong> <span id="customerName"></span></p>
            <p><strong>Số điện thoại:</strong> <span id="customerPhone"></span></p>
            <p><strong>Địa chỉ:</strong> <span id="customerAddress"></span></p>
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
                    $('#customerInfoSection').hide(); // Ẩn thông tin người nhận của đơn khác
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
                        currentOrderId = orderId; // cập nhật order đang xem
                    },
                    error: function () {
                        alert("Lỗi khi tải dữ liệu chi tiết đơn hàng.");
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
                        $('#customerInfoSection').html('<h3>Thông tin người nhận</h3>' + response).show();
                        $('html, body').animate({
                            scrollTop: $("#customerInfoSection").offset().top
                        }, 500);
                        currentOrderId = orderId; // cập nhật order đang xem
                    },
                    error: function () {
                        alert("Lỗi khi tải thông tin khách hàng.");
                    }
                });
            }
        </script>


        <script>
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
