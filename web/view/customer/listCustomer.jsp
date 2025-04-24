<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
    <h2>Danh sách khách hàng</h2>
    <table border="1" cellpadding="8">
        <thead>
            <tr>
                <th>ID</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Điện thoại</th>
                <th>Địa chỉ</th>
                <th>Giới tính</th>
                <th>Ảnh đại diện</th>
                <th>Account ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${listCustomer}">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.fullName}</td>
                    <td>${c.email}</td>
                    <td>${c.phone}</td>
                    <td>${c.address}</td>
                    <td>${c.gender}</td>
                    <td><img src="${c.avatar}" width="50" height="50"></td>
                    <td>${c.accountId}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>