<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-4a7+Gz06Cs6d4PPMskIR3NNL7AAuOnAvOQypi4+bRnvZoBfQobLRZBgvl4VytIWmS3Mf6mEDgp2bHGvJGVF00A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f8f9fa;
            color: #343a40;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .order-details, .shipping-details {
            width: 100%;
            max-width: 500px;
            padding: 20px;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 0;
            font-size: 1.5rem;
            color: #495057;
        }

        p, label {
            font-size: 0.9rem;
            margin-bottom: 8px;
            text-align: left;
        }

        input[type="text"], input[type="email"], input[type="radio"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .payment-method {
            margin: 15px 0;
        }

        .payment-method label {
            display: inline-flex;
            align-items: center;
            gap: 5px; /* 5px gap between the radio button and label text */
        }

        .payment-method input[type="radio"] {
            margin: 0; /* Remove extra margins from radio buttons */
        }

        .payment-details {
            display: none;
            margin-top: 20px;
        }

        .payment-details input {
            margin-bottom: 15px;
        }

        .row {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .row label {
            flex: 1;
            margin-bottom: 2px;
            text-align: left;
        }

        .row input {
            flex: 1;
        }

        .pay-button {
            margin-top: 30px;
            display: inline-block;
            background-color: #007bff;
            color: white;
            text-align: center;
            text-decoration: none;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            width: 100%;
        }

        .pay-button:disabled {
            background-color: #6c757d;
            cursor: not-allowed;
        }

        .pay-button:hover:not(:disabled) {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Order Details Section -->
    <div class="order-details">
        <h2>Order Summary</h2>
        <p><strong>Cart Sub Total:</strong> LKR 42,580.00</p>
        <p><strong>Tax (5%):</strong> LKR 1,277.40</p>
        <p><strong>Shipping:</strong> LKR 400.00</p>
        <h3 style="color: #28a745; margin-top: 10px;">Grand Total: LKR 44,257.40</h3>

        <h2>Payment Method</h2>
        <div class="payment-method">
            <label>
                <input type="radio" id="cash" name="payment-method" value="cash" onclick="togglePaymentDetails(false)">
                Cash
            </label><br>
            <label>
                <input type="radio" id="card" name="payment-method" value="card" onclick="togglePaymentDetails(true)">
                Card
            </label>
        </div>

        <div class="payment-details" id="payment-details">
            <h3>Card Details</h3>
            <label for="card-name">Name on Card:</label>
            <input type="text" id="card-name" placeholder="Enter name on card"><br>
            <label for="card-number">Card Number:</label>
            <input type="text" id="card-number" placeholder="Enter card number"><br>

            <div class="row">
                <label for="expiry-date">Expiry Date:</label>
                <label for="cvv">CVV:</label>
            </div>
            <div class="row">
                <input type="text" id="expiry-date" placeholder="MM/YY">
                <input type="text" id="cvv" placeholder="CVV">
            </div>
        </div>
    </div>

    <!-- Shipping Details Section -->
    <div class="shipping-details">
        <h2>Shipping Details</h2>
        <label for="email">Email:</label>
        <input type="email" id="email" placeholder="Enter your email"><br>

        <div class="row">
            <label for="first-name">First Name:</label>
            <label for="last-name">Last Name:</label>
        </div>
        <div class="row">
            <input type="text" id="first-name" placeholder="Enter first name">
            <input type="text" id="last-name" placeholder="Enter last name">
        </div>

        <label for="address">Address:</label>
        <input type="text" id="address" placeholder="Enter your address"><br>
        <label for="zip">Zip/Postal Code:</label>
        <input type="text" id="zip" placeholder="Enter zip/postal code"><br>
        <br><br><br>

        <label><input type="checkbox" id="terms" onclick="updatePayButton()"> I agree to the <a href="#">terms and conditions</a>I hereby agree to all the terms and conditions outlined, including but not limited to the rules, regulations, policies, and disclaimers associated with this service or platform. </label><br>
        <label><input type="checkbox" id="privacy" onclick="updatePayButton()"> I agree to the <a href="#">privacy policy</a>I  acknowledge that I have read, understood, and accepted these policy, and I consent to abide by them fully.</label><br>

        <button class="pay-button" id="pay-button" disabled>Pay</button>
    </div>
</div>

<script>
    function togglePaymentDetails(show) {
        const paymentDetails = document.getElementById('payment-details');
        paymentDetails.style.display = show ? 'block' : 'none';
        updatePayButton();
    }

    function updatePayButton() {
        const termsChecked = document.getElementById('terms').checked;
        const privacyChecked = document.getElementById('privacy').checked;
        const paymentMethodSelected = document.querySelector('input[name="payment-method"]:checked') !== null;

        const payButton = document.getElementById('pay-button');
        payButton.disabled = !(termsChecked && privacyChecked && paymentMethodSelected);
    }
</script>
</body>
</html>
