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
        }
    </style>
</head>
<body>
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



