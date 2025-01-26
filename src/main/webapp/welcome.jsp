<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome Page</title>

    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            font-family: 'Arial', sans-serif;
        }

        .background-video {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -1;
        }

        .full-btn {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: transparent;
            border: none;
            cursor: pointer;
        }

        .h1-a {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            color: white;
            font-size: 16px;
            animation: bounce 2s infinite;
        }

        .logoimg {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .bg-dim {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateX(-50%) translateY(0);
            }
            40% {
                transform: translateX(-50%) translateY(-30px);
            }
            60% {
                transform: translateX(-50%) translateY(-15px);
            }
        }

        @media (max-width: 768px) {
            .h1-a {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .h1-a {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>

<video class="background-video" autoplay loop muted>
    <source src="${pageContext.request.contextPath}/assets/videos/welcomeVideo.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

<div class="bg-dim"></div>

<img src="assets/images/SneakerZ%20W.png" alt="logo" class="logoimg">

<h1 class="h1-a">Click anywhere to start!</h1>

<button class="full-btn" onclick="navigateToLogin()"></button>

<script>
    function navigateToLogin() {
        window.location.href = '${pageContext.request.contextPath}/login.jsp';
    }
</script>

</body>
</html>