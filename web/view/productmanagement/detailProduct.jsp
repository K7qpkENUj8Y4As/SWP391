<%-- 
    Document   : detailProduct
    Created on : Apr 21, 2025, 3:40:09 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${product.name} - Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="product">Danh sách sản phẩm</a></li>
                <li class="breadcrumb-item active" aria-current="page">Chi tiết sản phẩm</li>
            </ol>
        </nav>
        
        <div class="row">
            <!-- Hình ảnh sản phẩm -->
            <div class="col-md-5">
                <img src="${product.image}" alt="${product.name}" class="img-fluid rounded">
            </div>
            
            <!-- Thông tin sản phẩm -->
            <div class="col-md-7">
                <h1>${product.name}</h1>
                <h4 class="text-danger mb-3">
                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VNĐ" />
                </h4>
                
                <div class="mb-3">
                    <p><strong>Số lượng còn lại:</strong> ${product.quantity}</p>
                    <p><strong>Ngày thêm:</strong> <fmt:formatDate value="${product.createAt}" pattern="dd/MM/yyyy" /></p>
                </div>
                
                <div class="mb-4">
                    <h5>Mô tả sản phẩm:</h5>
                    <p>${product.description}</p>
                </div>
                
                <!-- Nguyên liệu thô (nếu có) -->
                <c:if test="${not empty product.rawMaterials}">
                    <div class="mb-4">
                        <h5>Nguyên liệu:</h5>
                        <ul class="list-group">
                            <c:forEach var="raw" items="${product.rawMaterials}">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    ${raw.name}
                                    <span class="badge bg-primary rounded-pill">${raw.quantity}</span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
                
                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                    <a href="#" class="btn btn-primary">Thêm vào giỏ hàng</a>
                    <a href="product" class="btn btn-outline-secondary">Quay lại</a>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>