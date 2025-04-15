<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/layout/Header.jsp" %>

<!-- Hero Section -->
<div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://via.placeholder.com/1200x400" class="d-block w-100" alt="Fresh Flowers">
            <div class="carousel-caption d-none d-md-block">
                <h2>Fresh Flowers for Every Occasion</h2>
                <p>Handcrafted bouquets to make your special moments memorable</p>
                <a href="shop.jsp" class="btn btn-primary">Shop Now</a>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://via.placeholder.com/1200x400" class="d-block w-100" alt="Wedding Flowers">
            <div class="carousel-caption d-none d-md-block">
                <h2>Wedding Flower Arrangements</h2>
                <p>Make your special day even more beautiful with our wedding collections</p>
                <a href="shop.jsp" class="btn btn-primary">Shop Now</a>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://via.placeholder.com/1200x400" class="d-block w-100" alt="Gift Baskets">
            <div class="carousel-caption d-none d-md-block">
                <h2>Gift Baskets & Plants</h2>
                <p>Perfect gifts for your loved ones on any occasion</p>
                <a href="shop.jsp" class="btn btn-primary">Shop Now</a>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- Features Section -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-3">
                <div class="d-flex align-items-center">
                    <div class="me-3">
                        <i class="fas fa-truck fs-3 text-primary"></i>
                    </div>
                    <div>
                        <h6 class="mb-1">Free Delivery</h6>
                        <p class="mb-0 small text-muted">For orders over $100</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="d-flex align-items-center">
                    <div class="me-3">
                        <i class="fas fa-leaf fs-3 text-primary"></i>
                    </div>
                    <div>
                        <h6 class="mb-1">Fresh Flowers</h6>
                        <p class="mb-0 small text-muted">Handpicked daily</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="d-flex align-items-center">
                    <div class="me-3">
                        <i class="fas fa-headset fs-3 text-primary"></i>
                    </div>
                    <div>
                        <h6 class="mb-1">24/7 Support</h6>
                        <p class="mb-0 small text-muted">Dedicated support</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="d-flex align-items-center">
                    <div class="me-3">
                        <i class="fas fa-shield-alt fs-3 text-primary"></i>
                    </div>
                    <div>
                        <h6 class="mb-1">Secure Payment</h6>
                        <p class="mb-0 small text-muted">100% secure payment</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Categories Section -->
<section class="py-5">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold">Shop by Category</h2>
            <p class="text-muted">Find the perfect flowers for any occasion</p>
        </div>
        
        <div class="row g-4">
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="https://via.placeholder.com/300x300" class="card-img-top" alt="Birthday Flowers">
                    <div class="card-body text-center">
                        <h5 class="card-title">Birthday</h5>
                        <a href="#" class="btn btn-outline-primary btn-sm">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="https://via.placeholder.com/300x300" class="card-img-top" alt="Anniversary Flowers">
                    <div class="card-body text-center">
                        <h5 class="card-title">Anniversary</h5>
                        <a href="#" class="btn btn-outline-primary btn-sm">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="https://via.placeholder.com/300x300" class="card-img-top" alt="Wedding Flowers">
                    <div class="card-body text-center">
                        <h5 class="card-title">Wedding</h5>
                        <a href="#" class="btn btn-outline-primary btn-sm">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="https://via.placeholder.com/300x300" class="card-img-top" alt="Sympathy Flowers">
                    <div class="card-body text-center">
                        <h5 class="card-title">Sympathy</h5>
                        <a href="#" class="btn btn-outline-primary btn-sm">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Featured Products -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold">Featured Products</h2>
            <p class="text-muted">Our most popular flower arrangements</p>
        </div>
        
        <div class="row g-4">
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 border-0 shadow-sm product-card">
                    <div class="position-relative">
                        <img src="https://via.placeholder.com/300x300" class="card-img-top" alt="Rose Bouquet">
                        <div class="product-badges">
                            <span class="badge bg-danger">Sale</span>
                        </div>
                        <div class="product-actions">
                            <button class="btn btn-sm btn-outline-secondary rounded-circle"><i class="fas fa-heart"></i></button>
                            <button class="btn btn-sm btn-outline-secondary rounded-circle"><i class="fas fa-eye"></i></button>
                        </div>
                    </div>
                    <div class="card-body text-center">
                        <h5 class="card-title">Rose Bouquet</h5>
                        <div class="mb-2">
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star-half-alt text-warning"></i>
                            <span class="ms-1 small">(24)</span>
                        </div>
                        <div class="d-flex justify-content-center align-items-center mb-3">
                            <span class="text-muted text-decoration-line-through me-2">$59.99</span>
                            <span class="fw-bold text-danger">$49.99</span>
                        </div>
                        <button class="btn btn-primary w-100"><i class="fas fa-shopping-cart me-2"></i>Add to Cart</button>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 border-0 shadow-sm product-card">
                    <div class="position-relative">
                        <img src="https://via.placeholder.com/300x300" class="card-img-top" alt="Lily Arrangement">
                        <div class="product-badges">
                            <span class="badge bg-success">New</span>
                        </div>
                        <div class="product-actions">
                            <button class="btn btn-sm btn-outline-secondary rounded-circle"><i class="fas fa-heart"></i></button>
                            <button class="btn btn-sm btn-outline-secondary rounded-circle"><i class="fas fa-eye"></i></button>
                        </div>
                    </div>
                    <div class="card-body text-center">
                        <h5 class="card-title">Lily Arrangement</h5>
                        <div class="mb-2">
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <span class="ms-1 small">(18)</span>
                        </div>
                        <div class="d-flex justify-content-center align-items-center mb-3">
                            <span class="fw-bold">$64.99</span>
                        </div>
                        <button class="btn btn-primary w-100"><i class="fas fa-shopping-cart me-2"></i>Add to Cart</button>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 border-0 shadow-sm product-card">
                    <div class="position-relative">
                        <img src="https://via.placeholder.com/300x300" class="card-img-top" alt="Tulip Bouquet">
                        <div class="product-actions">
                            <button class="btn btn-sm btn-outline-secondary rounded-circle"><i class="fas fa-heart"></i></button>
                            <button class="btn btn-sm btn-outline-secondary rounded-circle"><i class="fas fa-eye"></i></button>
                        </div>
                    </div>
                    <div class="card-body text-center">
                        <h5 class="card-title">Tulip Bouquet</h5>
                        <div class="mb-2">
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="far fa-star text-warning"></i>
                            <span class="ms-1 small">(12)</span>
                        </div>
                        <div class="d-flex justify-content-center align-items-center mb-3">
                            <span class="fw-bold">$39.99</span>
                        </div>
                        <button class="btn btn-primary w-100"><i class="fas fa-shopping-cart me-2"></i>Add to Cart</button>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 border-0 shadow-sm product-card">
                    <div class="position-relative">
                        <img src="https://via.placeholder.com/300x300" class="card-img-top" alt="Orchid Plant">
                        <div class="product-badges">
                            <span class="badge bg-primary">Best Seller</span>
                        </div>
                        <div class="product-actions">
                            <button class="btn btn-sm btn-outline-secondary rounded-circle"><i class="fas fa-heart"></i></button>
                            <button class="btn btn-sm btn-outline-secondary rounded-circle"><i class="fas fa-eye"></i></button>
                        </div>
                    </div>
                    <div class="card-body text-center">
                        <h5 class="card-title">Orchid Plant</h5>
                        <div class="mb-2">
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star text-warning"></i>
                            <i class="fas fa-star-half-alt text-warning"></i>
                            <span class="ms-1 small">(32)</span>
                        </div>
                        <div class="d-flex justify-content-center align-items-center mb-3">
                            <span class="fw-bold">$74.99</span>
                        </div>
                        <button class="btn btn-primary w-100"><i class="fas fa-shopping-cart me-2"></i>Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="text-center mt-5">
            <a href="shop.jsp" class="btn btn-outline-primary">View All Products</a>
        </div>
    </div>
</section>

<!-- Special Offer -->
<section class="py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0">
                <img src="https://via.placeholder.com/600x400" alt="Special Offer" class="img-fluid rounded">
            </div>
            <div class="col-lg-6">
                <div class="p-4">
                    <h6 class="text-primary text-uppercase">Limited Time Offer</h6>
                    <h2 class="fw-bold mb-4">20% Off on All Birthday Bouquets</h2>
                    <p class="mb-4">Make their special day even more memorable with our beautiful birthday flower arrangements. Order now and get 20% off on all birthday bouquets.</p>
                    <div class="d-flex gap-3 mb-4">
                        <div class="text-center">
                            <div class="bg-primary text-white rounded p-3 fw-bold">
                                <span id="days">00</span>
                            </div>
                            <small>Days</small>
                        </div>
                        <div class="text-center">
                            <div class="bg-primary text-white rounded p-3 fw-bold">
                                <span id="hours">00</span>
                            </div>
                            <small>Hours</small>
                        </div>
                        <div class="text-center">
                            <div class="bg-primary text-white rounded p-3 fw-bold">
                                <span id="minutes">00</span>
                            </div>
                            <small>Minutes</small>
                        </div>
                        <div class="text-center">
                            <div class="bg-primary text-white rounded p-3 fw-bold">
                                <span id="seconds">00</span>
                            </div>
                            <small>Seconds</small>
                        </div>
                    </div>
                    <a href="shop.jsp" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold">What Our Customers Say</h2>
            <p class="text-muted">Read testimonials from our satisfied customers</p>
        </div>
        
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body p-4">
                        <div class="mb-3 text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <p class="card-text mb-4">"The flowers were absolutely beautiful and fresh. They arrived on time and my wife loved them. Will definitely order again!"</p>
                        <div class="d-flex align-items-center">
                            <img src="https://via.placeholder.com/50x50" class="rounded-circle me-3" alt="Customer">
                            <div>
                                <h6 class="mb-0">John Smith</h6>
                                <small class="text-muted">Hanoi, Vietnam</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body p-4">
                        <div class="mb-3 text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <p class="card-text mb-4">"I ordered flowers for my mother's birthday and they were delivered right on time. The arrangement was even more beautiful than in the pictures!"</p>
                        <div class="d-flex align-items-center">
                            <img src="https://via.placeholder.com/50x50" class="rounded-circle me-3" alt="Customer">
                            <div>
                                <h6 class="mb-0">Mai Linh</h6>
                                <small class="text-muted">Ho Chi Minh City, Vietnam</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body p-4">
                        <div class="mb-3 text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                        <p class="card-text mb-4">"Great service and beautiful flowers. The online ordering process was simple and the delivery was prompt. Will use again for special occasions."</p>
                        <div class="d-flex align-items-center">
                            <img src="https://via.placeholder.com/50x50" class="rounded-circle me-3" alt="Customer">
                            <div>
                                <h6 class="mb-0">Tran Minh</h6>
                                <small class="text-muted">Da Nang, Vietnam</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Blog Section -->
<section class="py-5">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold">Latest from Our Blog</h2>
            <p class="text-muted">Tips and inspiration for flower arrangements</p>
        </div>
        
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Blog Post">
                    <div class="card-body">
                        <div class="mb-2">
                            <span class="badge bg-light text-dark me-2">Tips</span>
                            <small class="text-muted">April 15, 2025</small>
                        </div>
                        <h5 class="card-title">How to Keep Your Flowers Fresh Longer</h5>
                        <p class="card-text">Learn the best practices to extend the life of your cut flowers and keep them looking beautiful.</p>
                        <a href="#" class="btn btn-link p-0">Read More <i class="fas fa-arrow-right ms-1"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Blog Post">
                    <div class="card-body">
                        <div class="mb-2">
                            <span class="badge bg-light text-dark me-2">Inspiration</span>
                            <small class="text-muted">April 10, 2025</small>
                        </div>
                        <h5 class="card-title">10 Beautiful Wedding Flower Arrangements</h5>
                        <p class="card-text">Get inspired with these stunning wedding flower arrangements that will make your special day unforgettable.</p>
                        <a href="#" class="btn btn-link p-0">Read More <i class="fas fa-arrow-right ms-1"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Blog Post">
                    <div class="card-body">
                        <div class="mb-2">
                            <span class="badge bg-light text-dark me-2">Guide</span>
                            <small class="text-muted">April 5, 2025</small>
                        </div>
                        <h5 class="card-title">The Language of Flowers: What Each Bloom Means</h5>
                        <p class="card-text">Discover the hidden meanings behind different flowers and create arrangements with special messages.</p>
                        <a href="#" class="btn btn-link p-0">Read More <i class="fas fa-arrow-right ms-1"></i></a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="text-center mt-5">
            <a href="blog.jsp" class="btn btn-outline-primary">View All Posts</a>
        </div>
    </div>
</section>

<!-- Newsletter -->
<section class="py-5 bg-primary text-white">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0">
                <h3 class="fw-bold">Subscribe to Our Newsletter</h3>
                <p class="mb-0">Get the latest updates, offers and flower care tips delivered to your inbox.</p>
            </div>
            <div class="col-lg-6">
                <form class="d-flex">
                    <input type="email" class="form-control me-2" placeholder="Your email address">
                    <button type="submit" class="btn btn-light">Subscribe</button>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- JavaScript for Countdown Timer -->
<script>
    // Set the date we're counting down to (30 days from now)
    var countDownDate = new Date();
    countDownDate.setDate(countDownDate.getDate() + 30);
    
    // Update the countdown every 1 second
    var x = setInterval(function() {
        // Get today's date and time
        var now = new Date().getTime();
        
        // Find the distance between now and the countdown date
        var distance = countDownDate - now;
        
        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
        // Display the result
        document.getElementById("days").innerHTML = days < 10 ? "0" + days : days;
        document.getElementById("hours").innerHTML = hours < 10 ? "0" + hours : hours;
        document.getElementById("minutes").innerHTML = minutes < 10 ? "0" + minutes : minutes;
        document.getElementById("seconds").innerHTML = seconds < 10 ? "0" + seconds : seconds;
        
        // If the countdown is finished, write some text
        if (distance < 0) {
            clearInterval(x);
            document.getElementById("days").innerHTML = "00";
            document.getElementById("hours").innerHTML = "00";
            document.getElementById("minutes").innerHTML = "00";
            document.getElementById("seconds").innerHTML = "00";
        }
    }, 1000);
</script>

<%@ include file="/layout/Footer.jsp" %>



