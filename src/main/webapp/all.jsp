<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
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
    <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/ecommerce";
        String username = "root";
        String password = "Ijse@123";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);

            // Query to fetch products
            String query = "SELECT name, description, price FROM products";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            // Store products in a list
            List<Map<String, String>> products = new ArrayList<>();
            int index = 1;

            while (resultSet.next()) {
                Map<String, String> product = new HashMap<>();
                product.put("name", resultSet.getString("name"));
                product.put("description", resultSet.getString("description"));
                product.put("price", resultSet.getString("price"));
                product.put("imagePath", "assets/random/" + index + ".png");
                products.add(product);
                index++;
            }

            // Shuffle the products list
            Collections.shuffle(products);

            // Display the products
            for (Map<String, String> product : products) {
    %>
    <div class="product-card">
        <img src="<%= product.get("imagePath") %>" alt="<%= product.get("name") %>">
        <h3><%= product.get("name") %></h3>
        <p class="all-desc"><%= product.get("description") %></p>
        <p class="price">LKR <%= product.get("price") %></p>
        <button class="add-to-cart" data-name="<%= product.get("name") %>" data-price="<%= product.get("price") %>">Add to Cart</button>
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