<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customer"%>

<html>
<head>
    <title>Chỉnh sửa hồ sơ</title>
</head>
<body>
    <h2>Chỉnh sửa hồ sơ cá nhân</h2>
  
<%
    Customer c = (Customer) request.getAttribute("customer");
    if (c != null) {
        out.println("Customer info: " + c.getFullName() + ", " + c.getEmail());
    } else {
        out.println("Customer is not available!");
    }
%>
    <form action="updateProfile" method="post">
        <input type="hidden" name="id" value="<%= c.getId() %>" />

        Họ tên: <input type="text" name="fullName" value="<%= c.getFullName() %>" required/><br/>
        Email: <input type="email" name="email" value="<%= c.getEmail() %>" required/><br/>
        Số điện thoại: <input type="text" name="phone" value="<%= c.getPhone() %>" required/><br/>
Địa chỉ: <input type="text" name="address" value="<%= c.getAddress() != null ? c.getAddress() : "" %>" required/><br/>
       Giới tính: 
<select name="gender">
    <option value="Nam" <%= (c != null && "Nam".equals(c.getGender())) ? "selected" : "" %>>Nam</option>
    <option value="Nữ" <%= (c != null && "Nữ".equals(c.getGender())) ? "selected" : "" %>>Nữ</option>
</select><br/>


        <button type="submit">Lưu thay đổi</button>
    </form>

    <p style="color:green;"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
</body>
</html>