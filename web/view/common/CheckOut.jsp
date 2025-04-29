<%@page import="model.CartItem"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<%
    // Lấy cart từ session
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    int cartCount = (cart != null) ? cart.size() : 0;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Five Blooms | Checkout</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #d6336c;
                --secondary-color: #f06595;
                --accent-color: #ffdeeb;
                --bg-color: #fff8f8;
                --text-color: #444;
                --light-text: #777;
                --dark-bg: #343a40;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: var(--bg-color);
                color: var(--text-color);
            }

            .navbar {
                background-color: white;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                position: sticky;
                top: 0;
                z-index: 100;
            }

            .logo-text {
                font-size: 1.5rem;
                font-weight: 700;
                color: var(--primary-color);
            }

            .breadcrumb {
                background: none;
                padding: 0;
            }

            .section-title h5 {
                font-size: 2rem;
                color: var(--primary-color);
                text-align: center;
                margin-bottom: 30px;
            }

            .checkout-form {
                background-color: white;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            }

            .form-label {
                font-weight: 500;
            }

            .btn-primary {
                background-color: var(--primary-color);
                border: none;
            }

            .btn-primary:hover {
                background-color: var(--secondary-color);
            }

            .order-summary {
                background-color: white;
                padding: 20px;
                border-radius: 12px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            }

            .order-summary h5 {
                margin-bottom: 20px;
                color: var(--primary-color);
            }

            .order-item {
                border-bottom: 1px solid #eee;
                padding: 10px 0;
            }

            .order-item:last-child {
                border-bottom: none;
            }

            .total {
                font-size: 1.2rem;
                font-weight: bold;
                color: var(--primary-color);
                margin-top: 15px;
            }
        </style>
    </head>
    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <span class="logo-text">Five Blooms</span>
                </a>
                <div class="collapse navbar-collapse">
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto nav-links">
                            <li class="nav-item">
                                <a class="nav-link active" href="home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="productPage">Shop</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="category">Categories</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/AboutUsPage.jsp">About Us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Contact.jsp">Contact</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="cart">
                                    <i class="fas fa-shopping-cart"></i>
                                    <span id="cart-count"><%= cartCount%></span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="login">Login</a>                        
                            </li>
                            <li class="nav-item">                       
                                <a class="nav-link" href="register">Register</a>                        
                            </li>                                            
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Breadcrumb -->
        <div class="container mt-4">
            <nav class="breadcrumb">
                <a class="breadcrumb-item text-muted" href="home.jsp">Home</a>
                <a class="breadcrumb-item text-muted" href="cart.jsp">Cart</a>
                <span class="breadcrumb-item active">Checkout</span>
            </nav>
        </div>

        <!-- Checkout Content -->
        <section class="py-5">
            <div class="container">
                <div class="row g-5">
                    <!-- Billing Form -->
                    <div class="col-lg-7">
                        <div class="checkout-form">
                            <div class="section-title">
                                <h5>Billing Details</h5>
                            </div>
                            <form action="checkOut" method="post">
                                <div class="mb-3">
                                    <label for="fullname" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="fullname" name="fullname" 
                                           value="${customer != null ? customer.fullName : ''}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" 
                                           value="${customer != null ? customer.address : ''}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone Number</label>
                                    <input type="text" class="form-control" id="phone" name="phone" 
                                           value="${customer != null ? customer.phone : ''}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="note" class="form-label">Order Notes (Optional)</label>
                                    <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Payment Method</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="paymentMethod" id="cod" value="COD" checked>
                                        <label class="form-check-label" for="cod">
                                            Payment(COD)
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="paymentMethod" id="vnpay" value="VNPAY">
                                        <label class="form-check-label" for="vnpay">
                                            Payment(VNPay)
                                        </label>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Place Order</button>
                            </form>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="col-lg-5">
                        <div class="order-summary">
                            <h5>Order Summary</h5>
                            <c:forEach var="item" items="${cartItems}">
                                <div class="order-item d-flex justify-content-between">
                                    <div>${item.product.name} × ${item.quantity}</div>
                                    <div> <fmt:formatNumber value="${item.product.price * item.quantity}" type="number"/> VNĐ</div>
                                </div>
                            </c:forEach>
                            <div class="total d-flex justify-content-between">
                                <div>Total:</div>
                                <div><fmt:formatNumber value="${totalAmount}" type="number"/> VNĐ</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
