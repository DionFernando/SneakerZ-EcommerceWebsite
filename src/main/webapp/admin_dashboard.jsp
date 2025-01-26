<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar {
            background: white;
            box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
            position: fixed;
            color: black !important;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .db-logo {
            height: 50px;
            margin-right: 10px;
        }

        .nav-item {
            margin-right: 15px;
        }

        .nav-link {
            font-family: "Roboto Thin", sans-serif;
            color: black !important;
            transition: color 0.3s;
        }

        .nav-link:hover {
            color: #34abeb !important;
        }

        .nav-link.logout {
            color: #d11d1d !important;
        }

        .nav-link.logout:hover {
            color: #ff0000 !important;
        }

        .iframe-container {
            width: 100%;
            height: calc(100vh - 60px); /* Adjust based on navbar height */
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 60px;  /* Correctly align below the fixed navbar */
        }

        .iframe-container iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        .nav-link.active {
            color: #34abeb !important;
        }
    </style>
</head>
<body>
<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <!-- Logo -->
        <img src="assets/images/SneakerZ%20B.png" class="db-logo">
        <!-- Hamburger Menu -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Navigation Links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="loadPage('admin_user_managment.jsp')">User</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="loadPage('admin_category_management.jsp')">Category</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#" onclick="loadPage('admin_product_management.jsp')">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="loadPage('admin_order_management.jsp')">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link logout" href="welcome.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="iframe-container">
    <iframe id="content-frame" src="admin_user_managment.jsp" name="content-frame"></iframe>
</div>

<!-- JavaScript for dynamic page loading -->
<script>
    function loadPage(page) {
        document.getElementById('content-frame').src = page;
        setActiveNavLink(page);
    }

    function setActiveNavLink(page) {
        const navLinks = document.querySelectorAll('.nav-link');
        navLinks.forEach(link => {
            if (link.getAttribute('onclick').includes(page)) {
                link.classList.add('active');
            } else {
                link.classList.remove('active');
            }
        });
    }
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
