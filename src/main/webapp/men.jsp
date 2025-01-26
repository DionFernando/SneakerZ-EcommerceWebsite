<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: dion
  Date: 1/24/25
  Time: 12:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        html, body {
            padding-top: 50px;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .product-card {
            position: relative;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            padding: 10px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .product-card:hover {
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
            opacity: 0.9;
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
            transition: opacity 0.3s;
        }

        .product-card:hover img {
            opacity: 0.7;
        }

        .product-card h3 {
            margin: 10px 0;
        }

        .product-card .price {
            font-size: 1.2em;
            color: #4CAF50;
        }

        .product-card .all-desc {
            font-size: 0.8em;
            color: black;
        }

        .add-to-cart {
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 0.9em;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
            margin-top: 10px;
            display: none;
        }

        .product-card:hover .add-to-cart {
            display: block;
        }

        .add-to-cart:hover {
            background-color: #95af4c;
        }

    </style>
</head>
<body>

<div class="product-grid">
    <!-- Manually added product 1 -->
    <div class="product-card">
        <img src="assets/random/1.png" alt="Product 1">
        <h3>Adidas</h3>
        <p class="all-desc">Terrex Agravic Speed Trail Running Shoes</p>
        <p class="price">LKR 15000.00</p>
        <button class="add-to-cart" data-name="Product 1" data-price="1000">Add to Cart</button>
    </div>


    <div class="product-card">
        <img src="assets/random/2.png" alt="Product 2">
        <h3>Nike Air Force</h3>
        <p class="all-desc">Comfortable and stylish footwear designed for men, suitable for various occasions and activities.</p>
        <p class="price">LKR 27580.00</p>
        <button class="add-to-cart" data-name="Product 2" data-price="2000">Add to Cart</button>
    </div>

    <!-- Manually add more products here -->
    <div class="product-card">
        <img src="assets/random/3.png" alt="Product 3">
        <h3>AMBER . RTB 359</h3>
        <p class="all-desc">Terrex Agravic Speed Trail Running Shoes</p>
        <p class="price">LKR 5103.00</p>
        <button class="add-to-cart" data-name="Product 3" data-price="1000">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="assets/random/4.png" alt="Product 4">
        <h3>AMBER . RTB 359</h3>
        <p class="all-desc">Terrex Agravic Speed Trail Running Shoes</p>
        <p class="price">LKR 5103.00</p>
        <button class="add-to-cart" data-name="Product 4" data-price="1000">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="assets/random/5.png" alt="Product 5">
        <h3>Bata</h3>
        <p class="all-desc">Bata shoes</p>
        <p class="price">LKR 1200.00</p>
        <button class="add-to-cart" data-name="Product 5" data-price="1000">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="assets/random/6.png" alt="Product 6">
        <h3>Envoy Men’s Shoe</h3>
        <p class="all-desc">Envoy Men’s Shoe</p>
        <p class="price">LKR 19995.00</p>
        <button class="add-to-cart" data-name="Product 6" data-price="1000">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="assets/random/17.png" alt="Product 7">
        <h3>Nike Air Max Plus Drift</h3>
        <p class="all-desc">
            Nike Air Max Plus Drift
        </p>
        <p class="price">LKR
            23000.00</p>
        <button class="add-to-cart" data-name="Product 7" data-price="1000">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="assets/random/8.png" alt="Product 7">
        <h3>Nike Air Max Plus Drift</h3>
        <p class="all-desc">
            Nike Air Max Plus Drift
        </p>
        <p class="price">LKR 23000.00</p>
        <button class="add-to-cart" data-name="Product 7" data-price="1000">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="assets/random/11.png" alt="Product 8">
        <h3>Adidas</h3>
        <p class="all-desc">Adidas shoes</p>
        <p class="price">LKR 15000.00</p>
        <button class="add-to-cart" data-name="Product 8" data-price="1000">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="assets/random/18.png" alt="Product 9">
        <h3>Adidas</h3>
        <p class="all-desc">Adidas shoes</p>
        <p class="price">LKR 15000.00</p>
        <button class="add-to-cart" data-name="Product 9" data-price="1000">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="assets/random/20.png" alt="Product 10">
        <h3>Adidas</h3>
        <p class="all-desc">Adidas shoes</p>
        <p class="price">LKR
            15000.00</p>
        <button class="add-to-cart" data-name="Product 10" data-price="1000">Add to Cart</button>
    </div>








</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Attach click event listener to all "Add to Cart" buttons
        const buttons = document.querySelectorAll('.add-to-cart');
        buttons.forEach(button => {
            button.addEventListener('click', function() {
                const productName = this.getAttribute('data-name');
                const productPrice = this.getAttribute('data-price');

                // Show SweetAlert with product details
                Swal.fire({
                    title: 'Product Added to Cart',
                    text: `You have added ${productName} for LKR ${productPrice} to your cart.`,
                    icon: 'success',
                    confirmButtonText: 'OK'
                });

                // Log to the console
                console.log(`${productName} added to cart at price LKR ${productPrice}`);
            });
        });
    });
</script>

</body>
</html>
