<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%--<script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOM6g0g5z5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e" crossorigin="anonymous">
    <link rel="stylesheet" href="style/style.css" />
    <style>
        @media (max-width: 570px) {
            form {
                padding: 0 1.5rem;
            }

            .image {
                display: none;
            }
            .panel .content {
                padding: 0.5rem 1rem;
            }
            .container {
                padding: 1.5rem;
            }

            .container:before {
                bottom: 72%;
                left: 50%;
            }

            .container.sign-up-mode:before {
                bottom: 28%;
                left: 50%;
            }
        }
    </style>
    <title>Sign in & Sign up Form</title>
</head>
<body>
<div class="container">
    <div class="forms-container">
        <div class="signin-signup">
            <!-- Login Form -->
            <form id="loginForm" action="LoginServlet" method="post" class="sign-in-form">
                <h2 class="title">Sign in</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" id="username" name="username" placeholder="Username" required />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Password" required />
                </div>
                <input type="submit" value="Login" class="btn solid" />
                <p class="social-text">Or Sign in with social platforms</p>
                <div class="social-media">
                    <a href="assets/images/FB.png" class="social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="assets/images/FB.png" class="social-icon">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="assets/images/FB.png" class="social-icon">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="assets/images/FB.png" class="social-icon">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
                <div class="text-center mt-3 text-danger">
                    <%= request.getParameter("error") != null ? request.getParameter("error") : "" %>
                </div>
            </form>

            <!-- Registration Form -->
            <form id="registerForm" action="RegisterServlet" method="post" class="sign-up-form">
                <h2 class="title">Sign up</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" id="newUsername" name="username" placeholder="Username" required />
                </div>
                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <input type="email" id="email" name="email" placeholder="Email" required />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="newPassword" name="password" placeholder="Password" required />
                </div>
                <input type="submit" class="btn" value="Sign up" />
                <p class="social-text">Or Sign up with social platforms</p>
                <div class="social-media">
                    <a href="assets/images/FB.png" class="social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="assets/images/emaill.png" class="social-icon">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="assets/images/insta.png" class="social-icon">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="assets/images/FB.png" class="social-icon">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
            </form>
        </div>
    </div>

    <div class="panels-container">
        <div class="panel left-panel">
            <div class="content">
                <h3>New here?</h3>
                <p>
                    Register here if you don't have an account!
                </p>
                <button class="btn transparent" id="sign-up-btn">
                    Sign up
                </button>
            </div>
            <img src="#" class="image" alt="" />
        </div>
        <div class="panel right-panel">
            <div class="content">
                <h3>One of us?</h3>
                <p>
                    Already have an account? Log in now!
                </p>
                <button class="btn transparent" id="sign-in-btn">
                    Sign in
                </button>
            </div>
            <img src="#" class="image" alt="" />
        </div>
    </div>
</div>

<script>
    const sign_in_btn = document.querySelector("#sign-in-btn");
    const sign_up_btn = document.querySelector("#sign-up-btn");
    const container = document.querySelector(".container");

    sign_up_btn.addEventListener("click", () => {
        container.classList.add("sign-up-mode");
    });

    sign_in_btn.addEventListener("click", () => {
        container.classList.remove("sign-up-mode");
    });
</script>
</body>
</html>
