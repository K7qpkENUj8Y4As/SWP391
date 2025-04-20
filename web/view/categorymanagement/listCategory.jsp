<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý danh mục</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-5">
    <div class="container">
        <h2 class="mb-4">Danh sách danh mục</h2>

        <a href="category?action=create" class="btn btn-success mb-3">+ Thêm mới</a>

        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Tên danh mục</th>
                    <th>Thao tác</th>
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
                        <a href="category?action=edit&id=<%= c.getId() %>" class="btn btn-primary btn-sm">Sửa</a>
                        <a href="category?action=delete&id=<%= c.getId() %>" class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn chắc chắn muốn xoá danh mục này?');">Xoá</a>
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
    <% String message = (String) session.getAttribute("message");
       if (message != null) { %>

        <div id="toast" style="position: fixed; top: 20px; right: 20px; background: #198754; color: white; padding: 12px 24px; border-radius: 8px; z-index: 9999;">
            <%= message %>
        </div>

        <script>
            setTimeout(() => {
                const toast = document.getElementById('toast');
                if (toast) toast.remove();
            }, 3000);
        </script>

    <% session.removeAttribute("message"); } %>
</body>
</html>
