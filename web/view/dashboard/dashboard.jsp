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
</head>
<body>
    <%@ include file="/view/dashboard/sidebar.jsp" %>
    <!-- Main content -->
    <div class="main-content">
        <h2>Welcome, <%= username != null ? username : "Guest" %>!</h2>
<!--        <h3>Role: <%= role != null ? role : "Unknown" %></h3>-->
        <form action="LogoutController" method="post" class="logout-button">
            <button type="submit">Logout</button>
        </form>
    </div>
</body>
</html>
