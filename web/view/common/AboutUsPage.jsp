<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>About Us</title>
        </head>
                <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #fff;
            }

            .container {
                max-width: 1100px;
                margin: 50px auto;
                padding: 0 20px;
            }

            h2 {
                font-size: 32px;
                margin-bottom: 30px;
            }

            .reviews {
                display: flex;
                gap: 20px;
                flex-wrap: wrap;
                margin-bottom: 40px;
            }

            .review-card {
                flex: 1 1 230px;
                background-color: #fff8f6;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }

            .review-card img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
            }

            .review-name {
                font-weight: bold;
                margin: 10px 0 5px;
            }

            .stars {
                color: #ffc107;
                margin: 5px 0;
            }

            .review-text {
                color: #444;
                font-size: 14px;
                margin-bottom: 10px;
            }

            .review-date {
                font-size: 12px;
                color: #999;
            }

            .see-all {
                text-align: center;
                margin-bottom: 60px;
                color: #777;
                cursor: pointer;
            }

            .contact-section {
                display: flex;
                flex-wrap: wrap;
                gap: 40px;
                align-items: flex-start;
            }

            .contact-info {
                flex: 1;
                min-width: 300px;
            }

            .contact-info h4 {
                margin-bottom: 20px;
                font-size: 18px;
                font-weight: 600;
                color: #111;
            }

            .contact-info p {
                margin: 10px 0;
                color: #444;
            }

            .contact-info p span {
                display: block;
                font-weight: 600;
                color: #000;
            }

            .contact-image {
                flex: 1;
                min-width: 300px;
                max-height: 300px
            }

            .contact-image img {
                width: 100%;
                height: 340px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            }
            </style>
        <body>
            <div class="page-container">
                <div class="header">
                    <h1>About Us</h1>
                    <p>Where emotions bloom through every fresh petal</p>
                </div>

                <div class="content-container">
                    <div class="about-content">
                        <h2 class="section-title">Our Story</h2>
                        <p class="about-text">
                            Welcome to <span class="highlight">Five Blooms </span> – your go-to destination for the most beautiful flowers for every special occasion.
                        </p>
                        <p class="about-text">
                            Established in <span class="highlight">2025</span>, we specialize in providing both imported and locally sourced fresh flowers for birthdays, anniversaries, weddings, and seasonal celebrations.
                        </p>
                        <p class="about-text">
                            With a team of professional and passionate florists, we are committed to delivering the best online flower shopping experience and top-notch customer service.
                        </p>
                        <p class="about-text">
                            Every bouquet is carefully crafted and delivered with love. <span class="highlight">Your satisfaction is our greatest reward!</span>
                        </p>
                    </div>

                    <div class="about-image">
                        <img src="file/images/flower-shop.png" alt="Five Blooms " />
                    </div>
                </div>

                <h2 class="section-title">Our Core Values</h2>
                <div class="values-container">
                    <div class="value-card">
                        <div class="value-icon">🌸</div>
                        <h3 class="value-title">Superior Quality</h3>
                        <p>We select the freshest, most beautiful, and unique flowers to ensure every bouquet is perfect for your special moments.</p>
                    </div>

                    <div class="value-card">
                        <div class="value-icon">💝</div>
                        <h3 class="value-title">Dedicated Service</h3>
                        <p>Our team is always ready to assist and advise you in finding the perfect flowers for your special occasions.</p>
                    </div>

                    <div class="value-card">
                        <div class="value-icon">✨</div>
                        <h3 class="value-title">Endless Creativity</h3>
                        <p>We continuously update with the latest trends and create unique designs for every occasion throughout the year.</p>
                    </div>
                </div>

                <div class="contact-section">
                    <h2 class="contact-title">Contact Us</h2>
                    <p>Let us help you spread messages of love through the language of flowers</p>

                    <div class="contact-info">
                        <div class="contact-item">
                            <div class="contact-icon">📍</div>
                            <div class="contact-label">Address</div>
                            <div>123 Rose Street, District 1, Hoa Lac City</div>
                        </div>

                        <div class="contact-item">
                            <div class="contact-icon">📞</div>
                            <div class="contact-label">Hotline</div>
                            <div>+84 909 123 456</div>
                        </div>

                        <div class="contact-item">
                            <div class="contact-icon">📧</div>
                            <div class="contact-label">Email</div>
                            <div>contact@fiveblooms.com</div>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                &copy; 2025 QT Fresh Flower Shop. All rights reserved.
            </footer>
        </body>
    </html>
