<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Customer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn-primary {
            width: 100%;
        }
        .message {
            margin-top: 20px;
            font-size: 16px;
        }
       

    </style>
</head>
<body>
        <%@ include file="/view/components/Header.jsp" %>

<div class="container">
    <h2 class="mb-4">Edit Profile</h2>

    <c:choose>
        <c:when test="${not empty customer}">
            <form action="updateProfile" method="post">
                <input type="hidden" name="id" value="${customer.id}" />

                <div class="mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" value="${customer.fullName}" required/>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${customer.email}" required/>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="${customer.phone}" required/>
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" name="address" value="${customer.address}" required/>
                </div>

                <div class="mb-3">
                    <label for="gender" class="form-label">Gender</label>
                    <select class="form-select" name="gender" id="gender">
                        <option value="Male" ${customer.gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${customer.gender == 'Female' ? 'selected' : ''}>Female</option>
                    </select>
                </div>

<button type="submit" class="btn btn-primary" style="background-color: #ff66b2; border-color: pink;">Save Changes</button>
            </form>
        </c:when>
        <c:otherwise>
            <p class="text-danger">Customer information not found!</p>
        </c:otherwise>
    </c:choose>

    <p class="message text-success">${message != null ? message : ''}</p>
</div>
        <%@ include file="/view/components/Footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
