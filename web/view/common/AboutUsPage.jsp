<<<<<<< HEAD
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
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
=======
 <%-- 
Document   : AboutUsPage
    Created on : Apr 15, 2025, 9:58:40 PM
    Author     : Dung
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Five Blooms </title>
    <style>
        :root {
            --primary-color: #d6336c;
            --secondary-color: #f06595;
            --accent-color: #ffdeeb;
            --bg-color: #fff8f8;
            --text-color: #444;
            --light-text: #777;
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
        
        .page-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
            padding: 30px 0;
        }
        
        .header::before {
            content: "";
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 150px;
            height: 3px;
            background: linear-gradient(to right, transparent, var(--primary-color), transparent);
        }
        
        .header h1 {
            font-size: 2.8rem;
            color: var(--primary-color);
            margin-bottom: 15px;
            font-weight: 700;
        }
        
        .header p {
            font-size: 1.2rem;
            color: var(--light-text);
            max-width: 700px;
            margin: 0 auto;
        }
        
        .content-container {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            justify-content: space-between;
            margin-bottom: 50px;
        }
        
        .about-content {
            flex: 1;
            min-width: 300px;
        }
        
        .about-image {
            flex: 1;
            min-width: 300px;
            background: linear-gradient(135deg, var(--accent-color), #fff);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            height: 750px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .about-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .section-title {
            font-size: 1.8rem;
            color: var(--primary-color);
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 12px;
        }
        
        .section-title::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 3px;
            background-color: var(--secondary-color);
        }
        
        .about-text {
            font-size: 1.1rem;
            margin-bottom: 25px;
        }
        
        .highlight {
            color: var(--primary-color);
            font-weight: 600;
        }
        
        .values-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin: 40px 0;
        }
        
        .value-card {
            flex: 1;
            min-width: 250px;
            background-color: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .value-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .value-icon {
            font-size: 2.5rem;
            color: var(--secondary-color);
            margin-bottom: 15px;
        }
        
        .value-title {
            font-size: 1.3rem;
            color: var(--primary-color);
            margin-bottom: 12px;
        }
        
        .contact-section {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            text-align: center;
        }
        
        .contact-title {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 30px;
        }
        
        .contact-info {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
            margin-top: 20px;
        }
        
        .contact-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            min-width: 200px;
        }
        
        .contact-icon {
            font-size: 2rem;
            color: var(--secondary-color);
            margin-bottom: 15px;
        }
        
        .contact-label {
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .flower-decoration {
            position: absolute;
            width: 150px;
            height: 150px;
            opacity: 0.1;
            z-index: -1;
        }
        
        .flower-1 {
            top: 50px;
            left: 50px;
        }
        
        .flower-2 {
            bottom: 100px;
            right: 80px;
        }
        
        footer {
            text-align: center;
            padding: 30px 0;
            color: var(--light-text);
            font-size: 0.9rem;
            margin-top: 50px;
        }
        
        @media (max-width: 768px) {
            .content-container {
                flex-direction: column-reverse;
            }
            
            .about-image {
                height: 300px;
            }
            
            .header h1 {
                font-size: 2.2rem;
            }
>>>>>>> f495d42 (Fix login bug and update folder structure)
        }
    </style>
</head>
<body>
<<<<<<< HEAD
    <div class="container">
        <h2>Latest reviews</h2>
        <div class="reviews">
            <div class="review-card">
                <img src="https://randomuser.me/api/portraits/women/1.jpg" alt="Kristin">
                <div class="review-name">Kristin Watson</div>
                <div class="stars">★★★★★</div>
                <div class="review-text">I ordered a bouquet for my friend’s birthday. She was overjoyed!</div>
                <div class="review-date">December 2, 2014</div>
            </div>

            <div class="review-card">
                <img src="https://randomuser.me/api/portraits/men/2.jpg" alt="Albert">
                <div class="review-name">Albert Flores</div>
                <div class="stars">★★★★★</div>
                <div class="review-text">I really liked the roses. The color and freshness were perfect!</div>
                <div class="review-date">November 28, 2014</div>
            </div>

            <div class="review-card">
                <img src="https://randomuser.me/api/portraits/men/3.jpg" alt="Floyd">
                <div class="review-name">Floyd Miles</div>
                <div class="stars">★★★★★</div>
                <div class="review-text">I have ordered flowers here multiple times. Always beautiful and fresh!</div>
                <div class="review-date">October 24, 2014</div>
            </div>

            <div class="review-card">
                <img src="https://randomuser.me/api/portraits/women/4.jpg" alt="Leslie">
                <div class="review-name">Leslie Alexander</div>
                <div class="stars">★★★★★</div>
                <div class="review-text">I bought flowers for my wife — she loved them so much. Thank you!</div>
                <div class="review-date">August 3, 2014</div>
            </div>
        </div>

        <div class="see-all">See all reviews →</div>

        <div class="contact-section">
            <div class="contact-info">
                <h4>Email</h4>
                <p><span>Reach out:</span> flowers.contact@example.com</p>

                <h4>Phone</h4>
                <p><span>Call us at:</span> +1 (800) 123-4567</p>

                <h4>Office</h4>
                <p><span>Visit us:</span> 2718 Thornridge Dr. Syracuse, Connecticut 35624</p>
            </div>

            <div class="contact-image">
                <img src="https://mspmag.com/downloads/61859/download/image002.jpg?cb=de465bc50a9e5635ec2a607d7d4f453c&w=1280" alt="Flower Shop" />
            </div>
        </div>
    </div>
</body>
</html>



=======
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
>>>>>>> f495d42 (Fix login bug and update folder structure)
