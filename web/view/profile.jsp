<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Customer" %>

<jsp:useBean id="customer" scope="request" type="model.Customer" />

<html>
<head>
    <title>Hồ sơ cá nhân</title>
</head>
<body>
    <h2>THÔNG TIN CÁ NHÂN</h2>
    <p><strong>Họ tên:</strong> ${customer.fullName}</p>
    <p><strong>Email:</strong> ${customer.email}</p>
    <p><strong>SĐT:</strong> ${customer.phone}</p>
    <p><strong>Địa chỉ:</strong> ${customer.address}</p>
    <p><strong>Giới tính:</strong> ${customer.gender}</p>
    <p><strong>Ảnh đại diện:</strong></p>
    <img src="${customer.avatar}" width="120" height="120" />
</body>
</html>