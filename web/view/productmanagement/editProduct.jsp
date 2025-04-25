<%-- 
    Document   : editProduct
    Created on : Apr 22, 2025, 12:28:50 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Edit Product</h2>
    <form action="${pageContext.request.contextPath}/product" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="${product.id}">

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" value="${product.name}" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Price</label>
            <input type="number" step="0.01" name="price" value="${product.price}" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Quantity</label>
            <input type="number" name="quantity" value="${product.quantity}" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Category</label>
            <select name="categoryId" class="form-control" required>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.id}" ${category.id == product.categoryId ? 'selected' : ''}>
                        ${category.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Description</label>
            <textarea name="description" class="form-control" rows="4">${product.description}</textarea>
        </div>

        <div class="form-group">
            <label>Image</label><br>
            <img src="${pageContext.request.contextPath}/${product.image}" width="120" class="mb-2" alt="Current Image">
            <input type="file" name="image" class="form-control-file">
        </div>

        <button type="submit" class="btn btn-primary">Update Product</button>
        <a href="${pageContext.request.contextPath}/product" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
