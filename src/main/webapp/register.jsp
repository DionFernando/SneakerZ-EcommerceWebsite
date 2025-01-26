<%--
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('assets/images/img1.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .background-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, black, #010a14, #010f17, black);
            opacity: 0.8;
            z-index: 0;
        }

        .login-container, .register-container {
            background: #e9ecf7;
            color: black;
            padding: 2rem;
            border-radius: 0px 50px 0px 50px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.8);
            max-width: 400px;
            width: 100%;
            animation: popout 0.5s ease-out;
            z-index: 2;
            position: relative;
        }

        .brand-logo {
            text-align: center;
            margin-bottom: 1rem;
        }

        .brand-logo img {
            width: 80px;
        }

        .d-grid > button {
            background-color: #033638;
            border: none;
        }

        .d-grid > button:hover {
            background-color: #06737d;
            box-shadow: 0 0 10px #37aee6;
        }

        @keyframes popout {
            0% {
                transform: scale(0.5);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        .text-center {
            display: flex;
            justify-content: center;
        }

        .text-center span {
            display: inline-block;
            opacity: 0;
            animation: popout-letters 0.5s forwards;
        }

        .text-center span:nth-child(8){
            margin: 0 2px;
        }
        .text-center span:nth-child(11){
            margin: 0 2px;
        }

        .text-center span:nth-child(1) { animation-delay: 0s; }
        .text-center span:nth-child(2) { animation-delay: 0.05s; }
        .text-center span:nth-child(3) { animation-delay: 0.1s; }
        .text-center span:nth-child(4) { animation-delay: 0.15s; }
        .text-center span:nth-child(5) { animation-delay: 0.2s; }
        .text-center span:nth-child(6) { animation-delay: 0.25s; }
        .text-center span:nth-child(7) { animation-delay: 0.3s; }
        .text-center span:nth-child(8) { animation-delay: 0.1s; }
        .text-center span:nth-child(9) { animation-delay: 0.4s; }
        .text-center span:nth-child(10) { animation-delay: 0.45s; }
        .text-center span:nth-child(11) { animation-delay: 0.1s; }
        .text-center span:nth-child(12) { animation-delay: 0.55s; }
        .text-center span:nth-child(13) { animation-delay: 0.6s; }
        .text-center span:nth-child(14) { animation-delay: 0.65s; }
        .text-center span:nth-child(15) { animation-delay: 0.7s; }
        .text-center span:nth-child(16) { animation-delay: 0.75s; }
        .text-center span:nth-child(17) { animation-delay: 0.8s; }
        .text-center span:nth-child(18) { animation-delay: 0.5s; }
        .text-center span:nth-child(19) { animation-delay: 0.8s; }

        @keyframes popout-letters {
            0% {
                opacity: 0;
                transform: scale(0.5);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        .bottom-right-image > img {
            width: 700px;
            animation: infiniteAnimation 4s infinite;
        }

        @keyframes infiniteAnimation {
            0% {
                transform: scale(0.95);
            }
            50% {
                transform: scale(1);
            }
            100% {
                transform: scale(0.95);
            }
        }

    </style>
</head>
<body>

<div class="background-overlay"></div>

<!-- Login Form -->
<div class="login-container active" id="loginFormContainer">
    <div class="brand-logo">
        <img src="${pageContext.request.contextPath}/assets/images/SneakerZ%20B.png" alt="Shoe Shop Logo">
    </div>
    <h4 class="text-center">
        <span>W</span><span>e</span><span>l</span><span>c</span><span>o</span><span>m</span><span>e</span><span></span>
        <span>t</span><span>o</span><span></span>
        <span>S</span><span>n</span><span>e</span><span>a</span><span>k</span><span>e</span><span>r</span><span>Z</span>
    </h4>
    <form id="loginForm" action="LoginServlet" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Login</button>
        </div>
        <div class="text-center mt-3">
            <small>Don't have an account? <a href="#" id="registerBtn">Register here</a></small>
        </div>
        <div class="text-center mt-3 text-danger">
            <%= request.getParameter("error") != null ? request.getParameter("error") : "" %>
        </div>
    </form>
</div>

<!-- Registration Form -->
<div class="register-container" id="registerFormContainer" style="display: none;">
    <div class="brand-logo">
        <img src="${pageContext.request.contextPath}/assets/images/SneakerZ%20B.png" alt="Shoe Shop Logo">
    </div>
    <h4 class="text-center">
        <span>W</span><span>e</span><span>l</span><span>c</span><span>o</span><span>m</span><span>e</span><span></span>
        <span>t</span><span>o</span><span></span>
        <span>S</span><span>n</span><span>e</span><span>a</span><span>k</span><span>e</span><span>r</span><span>Z</span>
    </h4>
    <form id="registerForm" action="RegisterServlet" method="post">
        <div class="mb-3">
            <label for="newUsername" class="form-label">Username</label>
            <input type="text" class="form-control" id="newUsername" name="username" placeholder="Enter your username" required>
        </div>
        <div class="mb-3">
            <label for="newPassword" class="form-label">Password</label>
            <input type="password" class="form-control" id="newPassword" name="password" placeholder="Enter your password" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Register</button>
        </div>
    </form>
    <div class="text-center mt-3">
        <small>Already have an account? <a href="#" id="backToLogin">Login now!</a></small>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('registerBtn').addEventListener('click', function(event) {
        event.preventDefault(); // Prevent link from doing a full page reload
        document.getElementById('loginFormContainer').style.display = 'none';
        document.getElementById('registerFormContainer').style.display = 'block';
    });

    document.getElementById('backToLogin').addEventListener('click', function(event) {
        event.preventDefault(); // Prevent link from doing a full page reload
        document.getElementById('registerFormContainer').style.display = 'none';
        document.getElementById('loginFormContainer').style.display = 'block';
    });
</script>

</body>
</html>
--%>
