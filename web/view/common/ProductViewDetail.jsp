<%@page import="model.CartItem"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<%
    // Lấy cart từ session
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    int cartCount = (cart != null) ? cart.size() : 0;
%>
<!DOCTYPE html>
<meta charset="UTF-8">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Five Blooms | Product Detail</title>
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
            line-height: 1.6;
        }

        /* Navigation - Same as your existing style */
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

        .nav-links a {
            text-decoration: none;
            color: var(--text-color);
            font-weight: 500;
            position: relative;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: var(--primary-color);
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -5px;
            left: 0;
            background-color: var(--primary-color);
            transition: width 0.3s;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .active {
            color: var(--primary-color) !important;
        }

        .active::after {
            width: 100% !important;
        }

        /* Product Detail Section */
        .product-detail {
            padding: 60px 0;
        }

        .product-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
        }

        .product-gallery {
            display: flex;
            flex-direction: column;
        }

        .main-image {
            width: 100%;
            height: 500px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .thumbnail-container {
            display: flex;
            gap: 10px;
        }

        .thumbnail {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
            cursor: pointer;
            border: 2px solid transparent;
            transition: all 0.3s ease;
        }

        .thumbnail:hover, .thumbnail.active {
            border-color: var(--primary-color);
        }

        .product-info {
            padding: 20px;
        }

        .product-title {
            font-size: 2.2rem;
            margin-bottom: 15px;
            color: var(--text-color);
        }

        .product-price {
            font-size: 1.8rem;
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 20px;
        }

        .product-description {
            margin-bottom: 30px;
            line-height: 1.8;
        }

        .divider {
            height: 1px;
            background-color: #eee;
            margin: 30px 0;
        }

        .quantity-selector {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .quantity-btn {
            width: 40px;
            height: 40px;
            border: 1px solid #ddd;
            background-color: white;
            font-size: 1.2rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .quantity-btn:hover {
            background-color: var(--accent-color);
        }

        .quantity-input {
            width: 60px;
            height: 40px;
            text-align: center;
            border: 1px solid #ddd;
            border-left: none;
            border-right: none;
            font-size: 1.1rem;
        }

        .add-to-cart-btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
            margin-bottom: 20px;
        }

        .add-to-cart-btn:hover {
            background-color: var(--secondary-color);
        }

        .product-meta {
            font-size: 0.9rem;
            color: var(--light-text);
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .product-container {
                grid-template-columns: 1fr;
            }
            
            .main-image {
                height: 400px;
            }
        }

        @media (max-width: 576px) {
            .main-image {
                height: 300px;
            }
            
            .product-title {
                font-size: 1.8rem;
            }
            
            .product-price {
                font-size: 1.5rem;
            }
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto nav-links">
                        <li class="nav-item">
                            <a class="nav-link active" href="home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="product">Shop</a>
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
                        </li>
                    </ul>
                </div>
        </div>
    </nav>

    <!-- Product Detail Section -->
    <section class="product-detail">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="product-gallery">
                        <img src="${product.image}" alt="${product.name}" class="main-image" id="mainImage">
                        <div class="thumbnail-container">
                            <img src="${product.image}" alt="Thumbnail 1" class="thumbnail active" onclick="changeImage(this)">
                            <img src="https://via.placeholder.com/80x80" alt="Thumbnail 2" class="thumbnail" onclick="changeImage(this)">
                            <img src="https://via.placeholder.com/80x80" alt="Thumbnail 3" class="thumbnail" onclick="changeImage(this)">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="product-info">
                        <h1 class="product-title">${product.name}</h1>
                        <div class="product-price">Rp ${product.price}/stalk</div>
                        
                        <div class="divider"></div>
                        
                        <div class="product-description">
                            <h3>Description</h3>
                            <p>${product.description}</p>
                        </div>
                        
                        <div class="quantity-selector">
                            <label for="quantity" style="margin-right: 15px;">Quantity:</label>
                            <button class="quantity-btn minus-btn">-</button>
                            <input type="number" id="quantity" class="quantity-input" value="1" min="1">
                            <button class="quantity-btn plus-btn">+</button>
                        </div>
                        
                        <button class="add-to-cart-btn">Add to Cart</button>
                        
                        <div class="product-meta">
                            <p>© Maurizio Dei Famigliaia Le Reggio Sanzano</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <div class="footer">
        © Natasha Devi Pramudita | All Rights Reserved
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Change main image when thumbnail is clicked
        function changeImage(element) {
            const mainImage = document.getElementById('mainImage');
            mainImage.src = element.src;
            
            // Update active thumbnail
            document.querySelectorAll('.thumbnail').forEach(thumb => {
                thumb.classList.remove('active');
            });
            element.classList.add('active');
        }
        
        // Quantity selector functionality
        $(document).ready(function() {
            $('.minus-btn').click(function() {
                const quantityInput = $('#quantity');
                let quantity = parseInt(quantityInput.val());
                if (quantity > 1) {
                    quantityInput.val(quantity - 1);
                }
            });
            
            $('.plus-btn').click(function() {
                const quantityInput = $('#quantity');
                let quantity = parseInt(quantityInput.val());
                quantityInput.val(quantity + 1);
            });
            
            // Add to cart functionality
            $('.add-to-cart-btn').click(function() {
                const productId = ${product.id};
                const quantity = $('#quantity').val();
                const button = $(this);
                
                button.prop('disabled', true);
                button.html('<i class="fas fa-spinner fa-spin"></i> Adding...');
                
                $.ajax({
                    url: '${pageContext.request.contextPath}/AddToCart',
                    type: 'POST',
                    data: {
                        productId: productId,
                        quantity: quantity
                    },
                    success: function(response) {
                        if(response.success) {
                            button.html('<i class="fas fa-check"></i> Added to Cart');
                            // Update cart count
                            $('#cart-count').text(response.cartCount);
                        } else {
                            button.html('Error! Try Again');
                        }
                        setTimeout(() => {
                            button.html('Add to Cart');
                            button.prop('disabled', false);
                        }, 2000);
                    },
                    error: function() {
                        button.html('Error! Try Again');
                        setTimeout(() => {
                            button.html('Add to Cart');
                            button.prop('disabled', false);
                        }, 2000);
                    }
                });
            });
        });
    </script>
</body>
</html>
