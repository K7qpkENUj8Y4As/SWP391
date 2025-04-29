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
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Five Blooms | Flower Shop</title>
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
                margin: 0px;
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

            /* Hero Section */
            .hero {
                position: relative;
                height: 500px;
                background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url('https://images.unsplash.com/photo-1526397751294-331021109fbd');
                background-size: cover;
                background-position: center;
                color: white;
                display: flex;
                align-items: center;
                margin-bottom: 50px;
            }

            .hero h2 {
                font-size: 3rem;
                margin-bottom: 20px;
                text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
            }

            .btn {
                display: inline-block;
                padding: 12px 30px;
                border-radius: 30px;
                text-decoration: none;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .btn-dark {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
            }

            .btn-dark:hover {
                background-color: var(--secondary-color);
                border-color: var(--secondary-color);
            }

            /* Category Section */
            .section-title {
                text-align: center;
                margin-bottom: 40px;
            }

            .section-title h5 {
                font-size: 2rem;
                color: var(--primary-color);
                margin-bottom: 15px;
                position: relative;
                display: inline-block;
            }

            .section-title h5::after {
                content: "";
                position: absolute;
                width: 70px;
                height: 3px;
                background-color: var(--secondary-color);
                bottom: -10px;
                left: 50%;
                transform: translateX(-50%);
            }

            .category-img, .product-img {
                width: 100%;
                height: 200px;
                background-color: #eee;
                border-radius: 12px;
                object-fit: cover;
                transition: transform 0.5s ease;
            }

            .category-item:hover .category-img,
            .product-img:hover {
                transform: scale(1.05);
            }

            .category-title, .product-title {
                font-weight: bold;
                text-align: center;
                margin-top: 15px;
                color: var(--text-color);
            }

            .price {
                text-align: center;
                color: var(--primary-color);
                font-weight: 600;
                font-size: 1.1rem;
                margin: 10px 0;
            }

            .btn-outline-dark {
                color: var(--primary-color);
                border-color: var(--primary-color);
            }

            .btn-outline-dark:hover {
                background-color: var(--primary-color);
                color: white;
            }

            /* Carousel Controls */
            .carousel-control-prev, .carousel-control-next {
                width: 40px;
                height: 40px;
                background-color: var(--primary-color);
                border-radius: 50%;
                top: 50%;
                transform: translateY(-50%);
                opacity: 1;
            }

            .carousel-control-prev {
                left: -20px;
            }

            .carousel-control-next {
                right: -20px;
            }

            /* Footer */
            .footer {
                margin-top: 80px;
                padding: 40px 0 20px;
                text-align: center;
                background-color: var(--dark-bg);
                color: white;
            }

            .footer a {
                color: var(--accent-color);
                text-decoration: none;
            }

            /* Responsive Adjustments */
            @media (max-width: 768px) {
                .hero {
                    height: 400px;
                    text-align: center;
                }

                .hero h2 {
                    font-size: 2.2rem;
                }

                .category-img, .product-img {
                    height: 150px;
                }
            }
            .product-card {
                background-color: white;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0,0,0,0.08);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                height: 100%;
                display: flex;
                flex-direction: column;
            }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            }

            .product-image {
                height: 250px;
                overflow: hidden;
            }

            .product-img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.5s ease;
            }

            .product-card:hover .product-img {
                transform: scale(1.1);
            }

            .product-info {
                padding: 20px;
                flex-grow: 1;
                display: flex;
                flex-direction: column;
            }

            .product-category {
                color: var(--light-text);
                font-size: 0.9rem;
                margin-bottom: 5px;
            }

            .product-title {
                font-size: 1.2rem;
                margin-bottom: 10px;
                color: var(--text-color);
                font-weight: 600;
            }

            .product-price {
                color: var(--primary-color);
                font-weight: bold;
                font-size: 1.1rem;
                margin-bottom: 15px;
            }

            .product-button {
                background-color: var(--primary-color);
                color: white;
                border: none;
                padding: 8px 15px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                font-weight: 500;
                margin-top: auto;
                width: 100%;
            }

            .product-button:hover {
                background-color: var(--secondary-color);
            }

            @media (max-width: 768px) {
                .product-image {
                    height: 180px;
                }

                .product-info {
                    padding: 15px;
                }

                .product-title {
                    font-size: 1rem;
                }

                .product-price {
                    font-size: 1rem;
                }
            }
            /* Category Section Styling */
            .category {
                position: relative;
            }

            .carousel-control-prev,
            .carousel-control-next {
                width: 40px;
                height: 40px;
                background-color: var(--primary-color);
                border-radius: 50%;
                opacity: 1;
                transform: translateY(-50%);
            }

            .carousel-control-prev {
                left: -20px;
            }

            .carousel-control-next {
                right: -20px;
            }

            @media (max-width: 768px) {
                .carousel-control-prev {
                    left: 0;
                }

                .carousel-control-next {
                    right: 0;
                }
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
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
               <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto nav-links">
                        <li class="nav-item">
                            <a class="nav-link active" href="home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="productPage">Shop</a>
                        </li>
<!--                        <li class="nav-item">
                            <a class="nav-link" href="category">Categories</a>
                        </li>-->
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/view/common/AboutUsPage.jsp">About Us</a>
                        </li>
                      
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/view/common/ContactPage.jsp">Contact</a>
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
        </nav>

        <!-- Hero Section -->
        <section class="hero">
            <div class="container text-center" >
                <h2>THE BEST <br> FLOWER PRODUCTS <br> FOR YOU</h2>
            </div>
        </section>     
        <section class="search">
            <div class="container" >
                <nav class="breadcrumb">
                    <a class="breadcrumb-item text-muted" href="home">Home</a>
                    <span class="breadcrumb-item active" >Shopping</span>
                </nav>
                <!-- Search Bar -->
                <div class="input-group mb-5 shadow-sm">
                    <input type="text" class="form-control py-2" placeholder="Search Product">
                    <button class="btn btn-outline-secondary" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
        </section>
        <!-- Category Section -->
        <!-- Category Section -->

        <section class="category py-5">
            <div class="container position-relative"> <!-- Added position-relative here -->
                <div class="section-title">
                    <h5>CATEGORY</h5>
                </div>

                <div id="categoryCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach var="i" begin="0" end="${fn:length(categoryList) - 1}" step="4">
                            <div class="carousel-item ${i == 0 ? 'active' : ''}">
                                <div class="row">
                                    <c:forEach var="j" begin="0" end="3">
                                        <c:if test="${(i + j) < fn:length(categoryList)}">
                                            <c:set var="category" value="${categoryList[i + j]}" />
                                            <div class="col-6 col-md-3 text-center mb-4">
                                                <div class="category-img"></div>
                                                <div class="category-title">${category.name}</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Carousel Controls - Moved outside the carousel-inner -->
                <button class="carousel-control-prev position-absolute start-0" type="button" data-bs-target="#categoryCarousel" data-bs-slide="prev" style="top: 50%; transform: translateY(-50%);">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next position-absolute end-0" type="button" data-bs-target="#categoryCarousel" data-bs-slide="next" style="top: 50%; transform: translateY(-50%);">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>
        <!-- Product Section -->
        <section class="product py-5 bg-white">
            <div class="container">
                <div class="section-title">
                    <h5>PRODUCTS</h5>
                    <p class="text-muted text-center">Explore our beautiful flower collection</p>
                </div>

                <div class="row">
                    <c:forEach var="product" items="${productList}">
                        <div class="col-6 col-md-3 mb-4">
                            <div class="product-card">
                                <div class="product-image">
                                    <div class="product-img" style="background-color: #f9f9f9;"></div>
                                </div>
                                <div class="product-info">
                                    <div class="product-category">${product.category}</div>
                                    <a href="viewDetail?id=${product.id}"><h3 class="product-title">${product.name}</h3></a>
                                    <div class="product-price">Rp ${product.price}/stalk</div>
                                    <button class="product-button add-to-cart-btn" data-product-id="${product.id}">Add to Cart</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Pagination -->
                <nav aria-label="Product pagination" class="mt-4">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link" href="?page=${i}">${i}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </section>
        <div class="footer">
            © Natasha Devi Pramudita | All Rights Reserved
        </div>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>

            $(document).ready(function () {
                // Initialize cart count (you might want to load this from server)
                updateCartCount();

                $('.add-to-cart-btn').click(function () {
                    const productId = $(this).data('product-id');
                    const button = $(this);

                    button.prop('disabled', true);
                    button.html('<i class="fas fa-spinner fa-spin"></i> Adding...');

                    $.ajax({
                        url: '${pageContext.request.contextPath}/AddToCart',
                        type: 'POST',
                        data: {
                            productId: productId,
                            quantity: 1 // You might want to add quantity later
                        },
                        success: function (response) {
                            if (response.success) {
                                button.html('<i class="fas fa-check"></i> Added!');
                                updateCartCount(response.cartCount);
                            } else {
                                button.html('Failed!');
                                console.error(response.message);
                            }

                            // Reset button after 2 seconds
                            setTimeout(function () {
                                button.html('Add to Cart');
                                button.prop('disabled', false);
                            }, 2000);
                        },
                        error: function (xhr, status, error) {
                            console.error('Status:', status);
                            console.error('Error:', error);
                            console.error('Response:', xhr.responseText); // 👈 Add this line
                            button.html('Error! Try Again');
                            setTimeout(function () {
                                button.html('Add to Cart');
                                button.prop('disabled', false);
                            }, 2000);
                        }
                    });
                });

                function updateCartCount(count) {
                    if (count !== undefined) {
                        $('#cart-count').text(count);
                    } else {
                        // Load current cart count from server
                        $.get('getCartCount', function (response) {
                            $('#cart-count').text(response.cartCount || 0);
                        }).fail(function () {
                            $('#cart-count').text(0);
                        });
                    }
                }
            });
        </script>

    </body>
</html>