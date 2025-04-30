<%-- 
    Document   : editCategory
    Created on : Apr 21, 2025, 12:33:15 AM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Category" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa danh mục</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-5">
    <%@ include file="/view/dashboard/sidebar.jsp" %>
        <div style="margin-left: 250px; padding: 20px;">

    <div class="container">
        <h2 class="mb-4">Chỉnh sửa danh mục</h2>

        <form action="category" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="<%= ((Category) request.getAttribute("category")).getId() %>">
            <div class="mb-3">
                <label class="form-label">Tên danh mục:</label>
                <input type="text" name="name" class="form-control" value="<%= ((Category) request.getAttribute("category")).getName() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <a href="category?action=list" class="btn btn-secondary">Quay lại</a>
        </form>
    </div>
        </div>
</body>
</html>
