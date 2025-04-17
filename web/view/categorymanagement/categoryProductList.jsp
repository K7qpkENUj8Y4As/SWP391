<%-- 
    Document   : categoryProductList
    Created on : Apr 16, 2025, 11:35:10 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="java.util.*, model.CategoryProduct, dao.CategoryProductDAO"%>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Categories</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        table {
            width: 70%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #bbb;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #2a9d8f;
            color: white;
        }
        h2 {
            color: #333;
        }
        a.button {
            text-decoration: none;
            background-color: #2a9d8f;
            color: white;
            padding: 8px 12px;
            border-radius: 6px;
        }
        a.button:hover {
            background-color: #21867a;
        }
    </style>
</head>
<body>
    <h2>Product Category List</h2>

    <a class="button" href="addCategoryProduct.jsp">+ Add New Category</a><br/><br/>

    <table>
        <tr>
            <th>ID</th>
            <th>Category Name</th>
            <th>Description</th>
<!--        </tr>
        <%
            CategoryProductDAO dao = new CategoryProductDAO();
            List<CategoryProduct> list = dao.getAllCategories();

            for (CategoryProduct cat : list) {
        %>
        <tr>-->
            <td><%= cat.getId() %></td>
            <td><%= cat.getName() %></td>
            <td><%= cat.getDescription() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>

