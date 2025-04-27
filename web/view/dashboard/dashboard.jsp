<%-- 
    Document   : dashboard
    Created on : 27 thg 4, 2025, 01:57:40
    Author     : sunny
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    String username = (String) session.getAttribute("username"); 
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #fff5f8; /* Màu nền trắng hồng */
            color: #333;
        }
        h2 {
            color: #ff66b2; /* Màu hồng cho tiêu đề */
        }
        h3 {
            color: #ff66b2; /* Màu hồng cho tiêu đề */
        }
        .menu {
            margin-bottom: 20px;
            background-color: #ffe6f7; /* Màu nền hồng nhạt cho menu */
            padding: 10px;
            border-radius: 8px;
        }
        .menu a {
            margin-right: 15px;
            text-decoration: none;
            color: #ff66b2; /* Màu hồng cho các liên kết */
            font-weight: bold;
            padding: 8px;
            border-radius: 5px;
        }
        .menu a:hover {
            background-color: #ffccf2; /* Màu nền khi hover */
            color: #ffffff; /* Màu chữ khi hover */
        }
        button {
            background-color: #ff66b2; /* Nền hồng cho nút logout */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #ff3385; /* Màu nền khi hover */
        }
    </style>
</head>
<body>

    <h2>Welcome, <%= username != null ? username : "Guest" %>!</h2>
    <h3>Role: <%= role != null ? role : "Unknown" %></h3>

    <div class="menu">
        <% if ("Admin".equals(role)) { %>
            <a href="createManager.jsp">Create User</a>
        <% } %>

        <% if ("Manager".equals(role)) { %>
            <a href="product">Manage Products</a>
            <a href="category">Manage Categories</a>
            <a href="addSeller.jsp">Add New Seller</a>
            <a href="viewOrders.jsp">View Orders</a>
        <% } %>

        <% if ("Seller".equals(role)) { %>
                    <a href="raw">Management Raw</a>

            <a href="product">Add Product</a>
            <a href="manageOrders.jsp">Manage Orders</a>
        <% } %>

        <% if ("Customer".equals(role)) { %>
            <a href="shopProducts.jsp">Shop Products</a>
            <a href="viewOrders.jsp">View My Orders</a>
        <% } %>

        <% if (role == null) { %>
            <a href="login.jsp">Login</a>
        <% } %>
    </div>

    <div>
        <form action="LogoutController" method="post">
            <button type="submit">Logout</button>
        </form>
    </div>

</body>
</html>
