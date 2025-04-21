<%-- 
    Document   : listProduct
    Created on : Apr 21, 2025, 2:52:00 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1>Danh sách sản phẩm</h1>
        
        <!-- Tìm kiếm sản phẩm -->
        <div class="row mb-4">
            <div class="col-md-6">
                <form action="product" method="get" class="d-flex">
                    <input type="hidden" name="action" value="search">
                    <input type="text" name="keyword" class="form-control me-2" placeholder="Tìm kiếm sản phẩm..." value="${keyword}">
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </form>
            </div>
        </div>
        
        <!-- Hiển thị thông báo nếu không có sản phẩm -->
        <c:if test="${empty products}">
            <div class="alert alert-info">
                Không tìm thấy sản phẩm nào.
            </div>
        </c:if>
        
        <!-- Hiển thị danh sách sản phẩm -->
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="${product.image}" class="card-img-top" alt="${product.name}" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text text-danger fw-bold">${product.price} VNĐ</p>
                            <p class="card-text">Số lượng: ${product.quantity}</p>
                            <a href="product?action=detail&id=${product.id}" class="btn btn-primary">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>