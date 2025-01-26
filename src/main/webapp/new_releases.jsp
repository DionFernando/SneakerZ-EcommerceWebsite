<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<html>
<head>
    <title>New Releases</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            padding-top: 50px;
        }
        .content-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            padding: 10px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
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
        .no-items-container {
            text-align: center;
            width: 100vw;
            height: 350px!important;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .no-items-container h2 {
            color: #555;
            margin-bottom: 20px;
        }
        .browse-more-btn {
            display: inline-block;
            background-color: black;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .browse-more-btn:hover {
            background-color: #1B4242;
            color: white!important;
        }
    </style>
    <script>
        // Automatically remove the container after 30 seconds
            setTimeout(() => {
                const grid = document.querySelector('.product-grid');
                if (grid) {
                    grid.remove();
                }
            }, 30000);

        // Automatically remove the container after 30 days
        /*setTimeout(() => {
            const grid = document.querySelector('.product-grid');
            const noItemsContainer = document.querySelector('.no-items-container');
            if (grid) {
                grid.remove();
            }
            if (noItemsContainer) {
                noItemsContainer.remove();
            }
        }, 2592000000);*/
    </script>
</head>
<body>
<div class="content-wrapper">
    <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/ecommerce";
        String username = "root";
        String password = "Ijse@123";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        boolean hasProducts = false; // Flag to check if there are products

        try {
            // Establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);

            // Query to fetch products created within the last 30 minutes
            String query = "SELECT name, description, price, created_at FROM products WHERE created_at >= NOW() - INTERVAL 30 SECOND";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            if (resultSet.isBeforeFirst()) {
                hasProducts = true; // Set flag to true if there are products
            }

            if (hasProducts) {
    %>
    <div class="product-grid">
        <%
            int index = 0; // Start at 0 for modular arithmetic
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String price = resultSet.getString("price");

                // Cycle through image indices 1 to 20
                int imageIndex = (index % 20) + 1;
                String imagePath = "assets/random/" + imageIndex + ".png";
        %>
        <div class="product-card">
            <img src="<%= imagePath %>" alt="<%= name %>">
            <h3><%= name %></h3>
            <p class="all-desc"><%= description %></p>
            <p class="price">LKR <%= price %></p>
        </div>
        <%
                index++;
            }
        %>
    </div>
    <%
    } else {
    %>
    <div class="no-items-container">
        <h2>No new releases</h2>
        <a href="user_dashboard.jsp" class="browse-more-btn">Browse other shoes</a>
    </div>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    %>
</div>
</body>
</html>