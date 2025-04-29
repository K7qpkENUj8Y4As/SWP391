<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Five Blooms | Payment Result</title>
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

        .result-container {
            margin-top: 80px;
            text-align: center;
        }

        .result-icon {
            font-size: 5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .result-message {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .btn-home {
            background-color: var(--primary-color);
            border: none;
            padding: 12px 24px;
            font-size: 1rem;
            font-weight: 600;
            color: white;
            border-radius: 30px;
            text-decoration: none;
        }

        .btn-home:hover {
            background-color: var(--secondary-color);
            color: white;
        }
    </style>
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">
            <span class="logo-text">Five Blooms</span>
        </a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto nav-links">
                <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="productPage">Shop</a></li>
                <li class="nav-item"><a class="nav-link" href="cart">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="checkOut">Checkout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Payment Result Content -->
<div class="container result-container">
    <div class="result-icon">
        <i class="fa-regular fa-circle-check"></i>
    </div>
    <div class="result-message">
        ${message}
    </div>
    <a href="home" class="btn btn-home">Return to Home</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
