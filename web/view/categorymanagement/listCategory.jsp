<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Category Management - Flower Shop Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff5f5;
            color: #333;
        }
        .container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #d63384;
            font-weight: bold;
        }
        .btn-success {
            background-color: #d63384;
            border: none;
        }
        .btn-success:hover {
            background-color: #c02676;
        }
        .table thead {
            background-color: #ffe0e9;
        }
        .btn-primary {
            background-color: #6f42c1;
            border: none;
        }
        .btn-primary:hover {
            background-color: #5b32a1;
        }
        .btn-danger {
            background-color: #e63946;
            border: none;
        }
        .btn-danger:hover {
            background-color: #d62839;
        }
        #toast {
            background-color: #d63384;
        }
    </style>
</head>
<body class="p-5">
    <div class="container">
        <h2 class="mb-4">Category List</h2>

        <a href="category?action=create" class="btn btn-success mb-3">+ Add New</a>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                if (categories != null) {
                    for (Category c : categories) {
            %>
                <tr>
                    <td><%= c.getId() %></td>
                    <td><%= c.getName() %></td>
                    <td>
                        <a href="category?action=edit&id=<%= c.getId() %>" class="btn btn-primary btn-sm">Edit</a>
                        <a href="category?action=delete&id=<%= c.getId() %>" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this category?');">Delete</a>
                    </td>
                </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>

    <%-- Toast message --%>
    <%
        String message = (String) session.getAttribute("message");
        if (message != null) {
    %>
    <div id="toast" style="position: fixed; top: 20px; right: 20px; color: white; padding: 12px 24px; border-radius: 8px; z-index: 9999;">
        <%= message %>
    </div>

    <script>
        setTimeout(() => {
            const toast = document.getElementById('toast');
            if (toast) toast.remove();
        }, 3000);
    </script>
    <%
        session.removeAttribute("message");
        }
    %>
</body>
</html>
