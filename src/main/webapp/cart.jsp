<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="style/cart.css">
    <style>
        /* General Reset */
        html, body {
            margin: 0;
            padding-top: 50px;
            font-family: Arial, sans-serif;
        }

        /* Shopping Cart Header */
        h1 {
            text-align: center;
            padding-top: 20px;
        }

        .shopping-cart {
            width: 80%;
            margin: 0 auto;
        }

        /* Label Header Styling */
        .column-labels {
            display: grid;
            grid-template-columns: 1fr 2fr 1fr 1fr 1fr 1fr;
            text-align: left;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .column-labels label {
            font-weight: bold;
        }

        /* Product Layout */
        .product {
            display: grid;
            grid-template-columns: 1fr 2fr 1fr 1fr 1fr 1fr;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #ddd;
        }

        .product img {
            width: 100px;
            height: auto;
        }

        .product-details {
            display: flex;
            flex-direction: column;
        }

        .product-title {
            font-size: 16px;
            font-weight: bold;
        }

        .product-description {
            font-size: 14px;
            color: #666;
        }

        .product-price,
        .product-line-price,
        .product-quantity,
        .product-removal {
            text-align: center;
        }

        /* Input fields */
        .product-quantity input {
            width: 50px;
            padding: 5px;
            text-align: center;
        }

        /* Totals Layout */
        .totals {
            display: flex;
            justify-content: flex-end; /* Aligns the totals to the right */
            margin-top: 20px;
            padding-top: 10px;
            flex-direction: column; /* Makes the totals stack vertically */
            width: 100%;
        }

        .totals-item {
            margin-bottom: 10px; /* Adjust spacing between totals */
            text-align: right; /* Aligns the text of the items to the right */
        }

        .totals-item label {
            font-weight: bold;
        }

        .totals-item-total {
            font-size: 18px;
            font-weight: bold;
        }

        /* Checkout Button */
        .checkout {
            margin-top: 20px;
            margin-bottom: 70px;
            padding: 5px 20px;
            background-color: #5cb85c;
            color: white;
            border: none;
            cursor: pointer;
        }

        .checkout:hover {
            background-color: #4cae4c;
        }

        /* Overlay for the payment form */
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        /* Process Payment Form */
        .process-payment {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            width: 60%;
            max-width: 600px;
            text-align: center;
        }

        .process-payment h2 {
            margin-bottom: 20px;
        }

        .process-payment input {
            margin: 10px 0;
            padding: 10px;
            width: 80%;
            font-size: 16px;
        }

        .process-payment button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #5cb85c;
            color: white;
            border: none;
            cursor: pointer;
        }

        .process-payment button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>

<h1>Shopping Cart</h1>

<div class="shopping-cart">
    <div class="column-labels">
        <label class="product-image">Image</label>
        <label class="product-details">Product</label>
        <label class="product-price">Price</label>
        <label class="product-quantity">Quantity</label>
        <label class="product-removal">Remove</label>
        <label class="product-line-price">Total</label>
    </div>

    <!-- Product 1 -->
    <div class="product">
        <div class="product-image">
            <img src="assets/random/1.png">
        </div>
        <div class="product-details">
            <div class="product-title">Adidas</div>
            <p class="product-description">Terrex Agravic Speed Trail Running Shoes</p>
        </div>
        <div class="product-price">15000</div>
        <div class="product-quantity">
            <input type="number" value="1" min="1">
        </div>
        <div class="product-removal">
            <button class="remove-product">Remove</button>
        </div>
        <div class="product-line-price">15000</div>
    </div>

    <!-- Product 2 -->
    <div class="product">
        <div class="product-image">
            <img src="assets/random/2.png">
        </div>
        <div class="product-details">
            <div class="product-title">Nike Air Force</div>
            <p class="product-description">Comfortable and stylish footwear designed for men, suitable for various occasions and activities.</p>
        </div>
        <div class="product-price">27580</div>
        <div class="product-quantity">
            <input type="number" value="1" min="1">
        </div>
        <div class="product-removal">
            <button class="remove-product">Remove</button>
        </div>
        <div class="product-line-price">27580</div>
    </div>

    <!-- Totals -->
    <div class="totals">
        <div class="totals-item">
            <label>Subtotal</label>
            <div class="totals-value" id="cart-subtotal">42580</div>
        </div>
        <div class="totals-item">
            <label>Tax (5%)</label>
            <div class="totals-value" id="cart-tax">1277.40</div>
        </div>
        <div class="totals-item">
            <label>Shipping</label>
            <div class="totals-value" id="cart-shipping">400.00</div>
        </div>
        <div class="totals-item totals-item-total">
            <label>Grand Total</label>
            <div class="totals-value" id="cart-total">44257.40</div>
        </div>
    </div>

    <button class="checkout">Checkout</button>
</div>


<!-- Overlay and Process Payment Form -->
<%--<div class="overlay">
    <div class="process-payment">
        <h2>Process Payment</h2>
        <form action="process-payment.jsp" method="POST">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="text" name="cardNumber" placeholder="Card Number" required>
            <button type="submit">Pay Now</button>
        </form>
    </div>
</div>--%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%--<script>
    // Show the overlay and payment form on checkout button click
    $('.checkout').click(function() {
        $('.overlay').fadeIn();
    });

    // Close the overlay when clicked outside of the form
    $('.overlay').click(function(e) {
        if ($(e.target).is('.overlay')) {
            $('.overlay').fadeOut();
        }
    });
</script>--%>


</body>
</html>
