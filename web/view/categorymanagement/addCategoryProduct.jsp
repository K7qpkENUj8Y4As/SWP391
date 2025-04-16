<%-- 
    Document   : addCategoryProduct
    Created on : Apr 16, 2025, 11:33:53 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product Category</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        form {
            width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 8px;
            margin-bottom: 15px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #2a9d8f;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #21867a;
        }
    </style>
</head>
<body>
    <h2>Add New Product Category</h2>

    <form action="addCategoryProduct" method="post">
        <label>Category Name:</label><br/>
        <input type="text" name="name" required /><br/>

        <label>Description:</label><br/>
        <textarea name="description" rows="4"></textarea><br/>

        <input type="submit" value="Add Category" />
    </form>
</body>
</html>
