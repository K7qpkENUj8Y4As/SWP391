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
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            color: #333;
            display: flex;
        }

        /* Sidebar styles */
        .sidebar {
            width: 250px;
            background-color: #f4f4f4;
            padding-top: 20px;
            position: fixed;
            height: 100%;
            left: 0;
        }

        .sidebar a {
            text-decoration: none;
            color: #ff66b2;
            padding: 12px 15px;
            display: block;
            font-weight: bold;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background-color: #ffccf2;
            color: white;
        }

        /* Main content area */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: 100%;
        }

        h2, h3 {
            color: #ff66b2;
        }

        button {
            background-color: #ff66b2;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #ff3385;
        }

        .logout-button {
            margin-top: 20px;
        }
    </style>

    <script>
        function loadContent(page) {
            const xhr = new XMLHttpRequest();
            xhr.open("GET", page, true);
            xhr.onload = function() {
                if (xhr.status === 200) {
                    document.getElementById("content-area").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>

</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2 style="text-align: center; color: #ff66b2;">Dashboard</h2>

        <% if ("Admin".equals(role)) { %>
            <a href="javascript:void(0);" onclick="loadContent('account')">Create User</a>
        <% } %>

        <% if ("Manager".equals(role)) { %>
            <a href="javascript:void(0);" onclick="loadContent('product')">Manage Products</a>
            <a href="javascript:void(0);" onclick="loadContent('category')">Manage Categories</a>
            <a href="javascript:void(0);" onclick="loadContent('account')">Add New Seller</a>
            <a href="javascript:void(0);" onclick="loadContent('viewOrders.jsp')">View Orders</a>
        <% } %>

        <% if ("Seller".equals(role)) { %>
            <a href="javascript:void(0);" onclick="loadContent('raw')">Management Raw</a>
            <a href="javascript:void(0);" onclick="loadContent('product')">Add Product</a>
            <a href="javascript:void(0);" onclick="loadContent('manageOrders.jsp')">Manage Orders</a>
        <% } %>

        <% if ("Customer".equals(role)) { %>
            <a href="javascript:void(0);" onclick="loadContent('shopProducts.jsp')">Shop Products</a>
            <a href="javascript:void(0);" onclick="loadContent('viewOrders.jsp')">View My Orders</a>
        <% } %>

        <% if (role == null) { %>
            <a href="javascript:void(0);" onclick="loadContent('login.jsp')">Login</a>
        <% } %>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <h2>Welcome, <%= username != null ? username : "Guest" %>!</h2>
<!--        <h3>Role: <%= role != null ? role : "Unknown" %></h3>-->

        <div id="content-area">
            <!-- Content will load here -->
        </div>

        <form action="LogoutController" method="post" class="logout-button">
            <button type="submit">Logout</button>
        </form>
    </div>

</body>
</html>
