<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>QT Fresh Flower Shop | Home</title>
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
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: var(--bg-color);
                color: var(--text-color);
                line-height: 1.6;
            }
            /* Hero Section */
            .hero {
                position: relative;
                height: 600px;
                background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url('file/images/hero-bg.jpg');
                background-size: cover;
                background-position: center;
                color: white;
                display: flex;
                align-items: center;
            }

            .hero-content {
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
            }

            .hero h1 {
                font-size: 3rem;
                margin-bottom: 20px;
                animation: fadeInUp 1s ease;
            }

            .hero p {
                font-size: 1.2rem;
                margin-bottom: 30px;
                max-width: 600px;
                animation: fadeInUp 1.2s ease;
            }

            .btn {
                display: inline-block;
                padding: 12px 30px;
                border-radius: 30px;
                text-decoration: none;
                font-weight: 600;
                transition: all 0.3s ease;
                cursor: pointer;
            }

            .btn-primary {
                background-color: var(--primary-color);
                color: white;
                border: 2px solid var(--primary-color);
                animation: fadeInUp 1.4s ease;
            }

            .btn-primary:hover {
                background-color: transparent;
                color: white;
            }

            .btn-secondary {
                background-color: transparent;
                color: white;
                border: 2px solid white;
                margin-left: 15px;
                animation: fadeInUp 1.6s ease;
            }

            .btn-secondary:hover {
                background-color: white;
                color: var(--primary-color);
            }

            /* Features Section */
            .features {
                padding: 80px 20px;
                max-width: 1200px;
                margin: 0 auto;
            }

            .section-title {
                text-align: center;
                margin-bottom: 60px;
            }

            .section-title h2 {
                font-size: 2.5rem;
                color: var(--primary-color);
                margin-bottom: 15px;
                position: relative;
                display: inline-block;
            }

            .section-title h2::after {
                content: "";
                position: absolute;
                width: 70px;
                height: 3px;
                background-color: var(--secondary-color);
                bottom: -10px;
                left: 50%;
                transform: translateX(-50%);
            }

            .section-title p {
                color: var(--light-text);
                max-width: 700px;
                margin: 0 auto;
            }

            .features-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                gap: 30px;
            }

            .feature-card {
                flex: 1;
                min-width: 250px;
                background-color: white;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0 5px 20px rgba(0,0,0,0.05);
                text-align: center;
                transition: transform 0.3s ease;
            }

            .feature-card:hover {
                transform: translateY(-10px);
            }

            .feature-icon {
                font-size: 3rem;
                color: var(--secondary-color);
                margin-bottom: 20px;
            }

            .feature-card h3 {
                margin-bottom: 15px;
                color: var(--primary-color);
            }

            /* Products Section */
            .products {
                padding: 80px 20px;
                background-color: white;
            }

            .products-container {
                max-width: 1200px;
                margin: 0 auto;
            }

            .product-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 30px;
            }

            .product-card {
                background-color: white;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0,0,0,0.08);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            }

            .product-image {
                height: 250px;
                overflow: hidden;
            }

            .product-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.5s ease;
            }

            .product-card:hover .product-image img {
                transform: scale(1.1);
            }

            .product-info {
                padding: 20px;
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
            }

            .product-button:hover {
                background-color: var(--secondary-color);
            }

            /* Testimonials */
            .testimonials {
                padding: 80px 20px;
                background-color: var(--bg-color);
            }

            .testimonials-container {
                max-width: 1200px;
                margin: 0 auto;
            }

            .testimonials-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
                gap: 30px;
            }

            .testimonial-card {
                background-color: white;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
                position: relative;
            }

            .testimonial-card::before {
                /*            content: """;*/
                position: absolute;
                top: 10px;
                left: 20px;
                font-size: 5rem;
                color: var(--accent-color);
                font-family: Georgia, serif;
                line-height: 1;
                z-index: 0;
            }

            .testimonial-content {
                position: relative;
                z-index: 1;
            }

            .testimonial-text {
                font-style: italic;
                margin-bottom: 20px;
            }

            .testimonial-author {
                display: flex;
                align-items: center;
            }

            .author-image {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                overflow: hidden;
                margin-right: 15px;
            }

            .author-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .author-info h4 {
                margin-bottom: 5px;
                color: var(--primary-color);
            }

            .author-info p {
                color: var(--light-text);
                font-size: 0.9rem;
            }

            /* CTA Section */
            .cta {
                padding: 80px 20px;
                background-color: var(--primary-color);
                color: white;
                text-align: center;
            }

            .cta-container {
                max-width: 900px;
                margin: 0 auto;
            }

            .cta h2 {
                font-size: 2.5rem;
                margin-bottom: 20px;
            }

            .cta p {
                margin-bottom: 40px;
                font-size: 1.1rem;
            }

            .cta-btn {
                background-color: white;
                color: var(--primary-color);
                padding: 15px 40px;
                border-radius: 50px;
                font-size: 1.1rem;
                border: 2px solid white;
                transition: all 0.3s ease;
                display: inline-block;
                text-decoration: none;
                font-weight: 600;
            }

            .cta-btn:hover {
                background-color: transparent;
                color: white;
            }
            /* Animations */
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Responsive */
            @media (max-width: 768px) {
                .hero h1 {
                    font-size: 2.5rem;
                }

                .hero {
                    height: 500px;
                }

                .features-container {
                    flex-direction: column;
                }

                .feature-card {
                    margin-bottom: 20px;
                }

                .cta h2 {
                    font-size: 2rem;
                }
            }
            .active {
                color: var(--primary-color) !important;
            }

            .active::after {
                width: 100% !important;
            }
        </style>
    </head>
    <body>
        <!-- Navigation -->
        <%@ include file="/view/components/Header.jsp" %>
        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-content">
                <h1>Beautiful Flowers for Every Occasion</h1>
                <p>Discover our wide range of fresh, high-quality flowers perfect for any celebration, occasion, or to simply brighten someone's day.</p>
                <div class="hero-buttons">
                    <a href="shop.jsp" class="btn btn-primary">Shop Now</a>
                    <a href="categories.jsp" class="btn btn-secondary">Explore Categories</a>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features">
            <div class="section-title">
                <h2>Why Choose Us</h2>
                <p>We're committed to providing the freshest flowers with exceptional service</p>
            </div>

            <div class="features-container">
                <div class="feature-card">
                    <div class="feature-icon">🌹</div>
                    <h3>Premium Quality</h3>
                    <p>We source only the freshest, highest quality flowers to ensure your arrangements last longer and look beautiful.</p>
                </div>

                <div class="feature-card">
                    <div class="feature-icon">🚚</div>
                    <h3>Fast Delivery</h3>
                    <p>Same-day delivery available for orders placed before 2 PM, ensuring your flowers arrive fresh and on time.</p>
                </div>

                <div class="feature-card">
                    <div class="feature-icon">💐</div>
                    <h3>Custom Arrangements</h3>
                    <p>Our expert florists can create custom arrangements tailored to your specific needs and occasions.</p>
                </div>

                <div class="feature-card">
                    <div class="feature-icon">💯</div>
                    <h3>Satisfaction Guaranteed</h3>
                    <p>Not completely satisfied? We offer a 100% satisfaction guarantee on all our products.</p>
                </div>
            </div>
        </section>

        <!-- Products Section -->
        <section class="products">
            <div class="products-container">
                <div class="section-title">
                    <h2>Featured Bouquets</h2>
                    <p>Explore our most popular flower arrangements</p>
                </div>

                <div class="product-grid">
                    <div class="product-card">
                        <div class="product-image">
                            <img src="file/images/product1.jpg" alt="Romantic Rose Bouquet">
                        </div>
                        <div class="product-info">
                            <div class="product-category">Anniversary</div>
                            <h3 class="product-title">Romantic Rose Bouquet</h3>
                            <div class="product-price">$49.99</div>
                            <button class="product-button">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card">
                        <div class="product-image">
                            <img src="file/images/product2.jpg" alt="Spring Delight">
                        </div>
                        <div class="product-info">
                            <div class="product-category">Birthday</div>
                            <h3 class="product-title">Spring Delight</h3>
                            <div class="product-price">$59.99</div>
                            <button class="product-button">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card">
                        <div class="product-image">
                            <img src="file/images/product3.jpg" alt="Elegant Lilies">
                        </div>
                        <div class="product-info">
                            <div class="product-category">Sympathy</div>
                            <h3 class="product-title">Elegant Lilies</h3>
                            <div class="product-price">$64.99</div>
                            <button class="product-button">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card">
                        <div class="product-image">
                            <img src="file/images/product4.jpg" alt="Colorful Tulips">
                        </div>
                        <div class="product-info">
                            <div class="product-category">Celebration</div>
                            <h3 class="product-title">Colorful Tulips</h3>
                            <div class="product-price">$39.99</div>
                            <button class="product-button">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section class="testimonials">
            <div class="testimonials-container">
                <div class="section-title">
                    <h2>What Our Customers Say</h2>
                    <p>Read testimonials from our satisfied customers</p>
                </div>

                <div class="testimonials-grid">
                    <div class="testimonial-card">
                        <div class="testimonial-content">
                            <p class="testimonial-text">The flowers I ordered for my mother's birthday were absolutely stunning! They lasted for over two weeks and the arrangement was even more beautiful than in the pictures.</p>
                            <div class="testimonial-author">
                                <div class="author-image">
                                    <img src="file/images/customer1.jpg" alt="Customer">
                                </div>
                                <div class="author-info">
                                    <h4>Sarah Johnson</h4>
                                    <p>Regular Customer</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="testimonial-card">
                        <div class="testimonial-content">
                            <p class="testimonial-text">I've been ordering from QT Flowers for all special occasions in our family. Their customer service is exceptional and the flowers always arrive fresh and beautifully arranged.</p>
                            <div class="testimonial-author">
                                <div class="author-image">
                                    <img src="file/images/customer2.jpg" alt="Customer">
                                </div>
                                <div class="author-info">
                                    <h4>Michael Tran</h4>
                                    <p>Loyal Customer</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="testimonial-card">
                        <div class="testimonial-content">
                            <p class="testimonial-text">The anniversary bouquet I ordered was delivered on time and was absolutely perfect. My wife loved it! Will definitely order again for future special occasions.</p>
                            <div class="testimonial-author">
                                <div class="author-image">
                                    <img src="file/images/customer3.jpg" alt="Customer">
                                </div>
                                <div class="author-info">
                                    <h4>David Nguyen</h4>
                                    <p>New Customer</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta">
            <div class="cta-container">
                <h2>Subscribe to Our Newsletter</h2>
                <p>Stay updated with our latest offers, new arrivals, and seasonal specials</p>
                <form class="newsletter-form">
                    <input type="email" class="newsletter-input" placeholder="Enter your email">
                    <button type="submit" class="newsletter-btn">Subscribe</button>
                </form>
            </div>
        </section>

        <!-- Footer -->
        <%@ include file="/view/components/Footer.jsp" %>
    </body>
</html>