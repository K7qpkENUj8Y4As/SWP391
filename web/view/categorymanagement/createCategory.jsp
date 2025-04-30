<%-- 
    Document   : categoryCreate
    Created on : Apr 21, 2025, 12:31:17 AM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Thêm danh mục</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="p-5">
        <%@ include file="/view/dashboard/sidebar.jsp" %>
        <div class="container">
            <h2 class="mb-4">Thêm danh mục mới</h2>

            <% String error = (String) request.getAttribute("error");
            if (error != null) {%>
            <div class="alert alert-danger"><%= error%></div>
            <% }%>

            <form action="category" method="post">
                <input type="hidden" name="action" value="create">
                <div class="mb-3">
                    <label class="form-label">Tên danh mục:</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-success">Thêm mới</button>
                <a href="category?action=list" class="btn btn-secondary">Quay lại</a>
            </form>
        </div>
    </body>
</html>
