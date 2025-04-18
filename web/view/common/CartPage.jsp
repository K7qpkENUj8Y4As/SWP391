<%-- 
    Document   : CartPage
    Created on : Apr 18, 2025, 11:47:31 PM
    Author     : duongngo21
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Shopping Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #fff;
                padding: 40px;
            }

            h2 {
                font-weight: bold;
                margin-bottom: 30px;
            }

            .breadcrumb {
                background: none;
                padding: 0;
                margin-bottom: 20px;
            }

            .cart-item {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                border-bottom: 1px solid #eee;
                padding-bottom: 20px;
            }

            .cart-item img {
                width: 100px;
                height: auto;
                margin-right: 20px;
                border-radius: 8%
            }

            .cart-item .name {
                flex-grow: 1;
                font-weight: 500;
            }

            .quantity-box {
                display: flex;
                align-items: center;
                margin-right: 20px;
            }

            .quantity-box input {
                width: 40px;
                text-align: center;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin: 0 10px;
            }

            .price {
                font-weight: bold;
                margin-right: 20px;
            }

            .original-price {
                text-decoration: line-through;
                color: gray;
                font-size: 0.9em;
                margin-left: 5px;
            }

            .delete-btn {
                color: gray;
                cursor: pointer;
                font-size: 18px;
            }

            .promo-box {
                display: flex;
                margin-top: 30px;
            }

            .promo-box input {
                flex-grow: 1;
                border-radius: 8px 0 0 8px;
                border: 1px solid #ccc;
                padding: 10px;
            }

            .promo-box button {
                background-color: #d291bc;
                border: none;
                color: white;
                padding: 10px 20px;
                border-radius: 0 8px 8px 0;
            }

            .summary {
                margin-top: 30px;
                text-align: right;
            }

            .summary div {
                margin-bottom: 8px;
            }

            .summary strong {
                font-size: 18px;
            }

            .btn-checkout {
                margin-top: 15px;
                background-color: #d291bc;
                color: white;
                border: none;
                padding: 12px 30px;
                border-radius: 10px;
            }

            .btn-checkout:hover {
                opacity: 0.9;
            }

            .text-muted small {
                color: gray;
            }
        </style>
    </head>
    <body class="container">

        <nav class="breadcrumb">
            <a class="breadcrumb-item text-muted" href="#">Home</a>
            <span class="breadcrumb-item active">Shopping Cart</span>
        </nav>

        <h2>Shopping cart</h2>

        <!-- Cart Items -->
        <div class="cart-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXYdu979dBQl2T3vQW2LPnGn1lUyXn-MMOw&s" alt="Blossom Whisper">
            <div class="name">Blossom Whisper</div>
            <div class="quantity-box">
                <button class="btn btn-outline-secondary btn-sm">−</button>
                <input type="text" value="1" readonly>
                <button class="btn btn-outline-secondary btn-sm">+</button>
            </div>
            <div class="price">110$</div>
            <div class="delete-btn">🗑️</div>
        </div>

        <div class="cart-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXYdu979dBQl2T3vQW2LPnGn1lUyXn-MMOw&s" alt="Golden Sunrise">
            <div class="name">Golden Sunrise</div>
            <div class="quantity-box">
                <button class="btn btn-outline-secondary btn-sm">−</button>
                <input type="text" value="1" readonly>
                <button class="btn btn-outline-secondary btn-sm">+</button>
            </div>
            <div class="price">135$</div>
            <div class="delete-btn">🗑️</div>
        </div>

        <div class="cart-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXYdu979dBQl2T3vQW2LPnGn1lUyXn-MMOw&s" alt="Spring Symphony">
            <div class="name">Spring Symphony</div>
            <div class="quantity-box">
                <button class="btn btn-outline-secondary btn-sm">−</button>
                <input type="text" value="1" readonly>
                <button class="btn btn-outline-secondary btn-sm">+</button>
            </div>
            <div class="price">
                120$
                <span class="original-price">140$</span>
            </div>
            <div class="delete-btn">🗑️</div>
        </div>

        <!-- Promo Code -->
        <div class="promo-box">
            <input type="text" placeholder="Enter promo code">
            <button>Apply</button>
        </div>

        <!-- Summary -->
        <div class="summary">
            <div>Total amount <strong>385$</strong></div>
            <div>Discount <strong>20$</strong></div>
            <div><strong>Total payable 365$</strong></div>
            <button class="btn-checkout">Place an order</button>
        </div>

    </body>
</html>



