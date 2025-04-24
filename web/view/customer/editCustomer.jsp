<%-- 
    Document   : editCategory
    Created on : Apr 21, 2025, 12:33:15 AM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa danh mục</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-5">
    <div class="container">
        <h2 class="mb-4">Chỉnh sửa danh mục</h2>

        <form action="customer" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="<%= ((Customer) request.getAttribute("customer")).getId() %>">
            <div class="mb-3">
                <label class="form-label">Tên danh mục:</label>
                <input type="text" name="name" class="form-control" value="<%= ((Customer) request.getAttribute("customer")).getFullName() %>" required>
                <input name="email" />
                <input name="phone" />
                <input name="address" />
                <input name="gender" />
                <input name="avatar" />
                <input name="accountId" />
            </div>
            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <a href="customer?action=list" class="btn btn-secondary">Quay lại</a>
        </form>
    </div>
</body>
</html>
