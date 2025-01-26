<%--
  Created by IntelliJ IDEA.
  User: dion
  Date: 1/20/25
  Time: 1:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Dashboard</title>
    <!-- Link to the latest Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous" />

<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">--%>

    <%--<link rel="stylesheet" href="style/user-dashboard.css" />--%>
    <link rel="stylesheet" href="style/user_dashbord.css">

    <style>
        body, html{
            margin: 0;
            padding: 0;
            width: 100%;
            overflow-x: hidden;
        }

        .container {
            width: 100% !important;
            max-width: 100%!important; /* Ensure it doesn't exceed the viewport */
        }

        #content-area {
            margin: 0;
            padding: 0;
            width: 100% !important;
        }


    </style>

</head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="user_dashboard.jsp">
        <img src="assets/images/SneakerZ%20B.png" alt="Logo" style="height: 40px;">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="user_dashboard.jsp" class="nav-link">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="loadPage('all.jsp')">All</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="loadPage('new_releases.jsp')">New Releases</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="loadPage('men.jsp')">Men</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="loadPage('women.jsp')">Women</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="loadPage('cart.jsp')"><i class="fas fa-shopping-cart"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="loadPage('profile.jsp')">
                    <img src="assets/images/profile.png" alt="Settings" style="width: 20px; height: 20px; margin-right: 5px;">
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" id="nav-logout" href="welcome.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Dynamic Content Area -->
<div id="content-area" class="container mt-4">

    <!--Landing Carousel Section-->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="5000">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="slider-title">Run with us.</div>
                <div class="slider-text">Find countless styles within our store.</div>
                <button type="button" class="button-round-white">Browse Shoes</button>
                <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" class="d-block w-100" alt="red shoes">
            </div>
            <div class="carousel-item">
                <div class="slider-title title2">Need Support?</div>
                <div class="slider-text text2">Countless shoes with extra arch support.</div>
                <button type="button" class="button-round-white2">Browse Shoes</button>
                <img src="https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" class="d-block w-100" alt="blue shoes">
            </div>
            <div class="carousel-item">
                <div class="slider-title title3">Time for a cruise.</div>
                <div class="slider-text text3">Only the best shoes for skating.</div>
                <button type="button" class="button-round-white3">Browse Store</button>
                <img src="https://images.unsplash.com/photo-1512990414788-d97cb4a25db3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1303&q=80" class="d-block w-100" alt="green shoes">
            </div>
        </div>
    </div>


    <!--Jumbotron-->
    <div class="container-fluid">
        <div class="jumbotron-display">
            <div class="jumbotron-title">Hop Into Athletics.</div>
            <p>The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on the design, not content.</p>
            <button type="button" class="button-round-black">Browse More</button>
        </div>
    </div>

    <!--Product Photo Link Grid-->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <img src="https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80" alt="nike shoe" style="width:100%;">
                <div class="bottom-left">Running<br>Essentials</div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 products">
                <img src="https://images.unsplash.com/photo-1532873626-62910b6145fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" alt="nike shoe" style="width:100%;">
                <div class="bottom-left-products">Latest in Skating</div>
                <div class="products-info">Mens and womens</div>
            </div>
            <div class="col-sm-6 products">
                <img src="https://images.unsplash.com/photo-1514989940723-e8e51635b782?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" alt="nike shoe" style="width:100%;">
                <div class="bottom-left-products">New Trends</div>
                <div class="products-info">Customize your colors.</div>
            </div>
        </div>
    </div>

    <!--Our Store-->
    <div class="container-fluid">
        <div class="our-store-section">
            <div class="section-title">Our Store<button type="button" class="button-shop">Shop now</button></div>
            <div class="card-deck">
                <div class="card">
                    <img src="https://images.unsplash.com/photo-1512327536842-5aa37d1ba3e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" width="100%" height="auto" class="card-img-top" alt="Multi color shoe">
                    <div class="card-body">
                        <h5 class="card-title">HUF & DEE<div class="cost">LKR6590</div></h5>
                        <p class="card-text"><small class="text-muted">Women's shoe</small></p>
                    </div>
                </div>
                <div class="card">
                    <img src="https://images.unsplash.com/photo-1473010350295-2c82192ebd8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" class="card-img-top" alt="purple mesh">
                    <div class="card-body">
                        <h5 class="card-title">Reebok<div class="cost">LKR12500</div></h5>
                        <p class="card-text"><small class="text-muted">Men/Women's shoe</small></p>
                    </div>
                </div>
                <div class="card">
                    <img src="https://images.unsplash.com/photo-1578116922645-3976907a7671?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80" class="card-img-top" alt="blue black nike">
                    <div class="card-body">
                        <h5 class="card-title">Nike<div class="cost">LKR19999</div></h5>
                        <p class="card-text"><small class="text-muted">Men's shoe</small></p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--Leave a Review-->
    <div class="container-fluid">
        <div class="row background">
            <div class="col-sm-5 px-0">
                <img class="publications-img" src="https://images.unsplash.com/photo-1578608712688-36b5be8823dc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80" alt="Product" width="auto" height="600">
            </div>
            <div class="col-sm-7">
                <div class="row">
                    <div class="col-12">
                        <div class="form-title">Leave a Review</div>
                        <form method="POST" action="SendReviewServlet">
                            <div class="form-group">
                                <label for="formGroupExampleInput">NAME:</label>
                                <input type="text" class="form-control" id="formGroupExampleInput" name="name" placeholder="First Last" required>
                            </div>
                            <div class="form-group">
                                <label for="formGroupExampleInput2">EMAIL:</label>
                                <input type="email" class="form-control" id="formGroupExampleInput2" name="email" placeholder="example@email.com" required>
                            </div>
                            <div class="form-group">
                                <label for="formGroupExampleInput3">MESSAGE:</label>
                                <textarea class="form-control" id="formGroupExampleInput3" name="message" placeholder="Enter your message" required></textarea>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="button-form">Submit</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!--Footer-->
<footer class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 col-sm-12">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="user_dashboard.jsp">Home</a></li>
                    <li><a href="new_releases.jsp">New Releases</a></li>
                    <li><a href="women.jsp">Women</a></li>
                    <li><a href="men.jsp">Men</a></li>
                </ul>
            </div>
            <div class="col-md-4 col-sm-12">
                <h4>Contact Us</h4>
                <p>101 N Main Street<br>Random, IL 61821<br>+94 76 714 9543</p>
            </div>
            <div class="col-md-4 col-sm-12">
                <h4>Follow Us</h4>
                <div class="social-icon"></div><div class="social-icon"></div><div class="social-icon"></div>
            </div>
        </div>
    </div>
    <hr class="hr-footer">
    <div class="copyright">Copyright 2025 Workstate. All rights reserved. Dion Fernando</div>
</footer>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        $('#carouselExampleIndicators').carousel({
            interval: 3000
        });
    });

</script>

</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // Function to load a page dynamically into the content area
    function loadPage(pageUrl) {
        fetch(pageUrl)
            .then(response => response.text())
            .then(data => {
                document.getElementById('content-area').innerHTML = data;
            })
            .catch(error => {
                console.error('Error loading page:', error);
                document.getElementById('content-area').innerHTML = '<p>Error loading content. Please try again.</p>';
            });
    }

    // Automatically load the default page (user_dashboard_content.jsp) when the dashboard opens
    /*document.addEventListener('DOMContentLoaded', function () {
        loadPage('user_dashboard_content.jsp');
    });*/
</script>
</body>

</html>
