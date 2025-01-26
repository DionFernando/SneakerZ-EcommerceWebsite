<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            background: #f2f2f2;
            color: black;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;  /* Hidden by default */
            justify-content: center;
            align-items: center;
        }

        .add-product-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .add-product-btn:hover {
            background-color: #0056b3;
        }

        #main-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
            height: 100%;
            width: 100%;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
            position: relative;
        }

        .form-container h3 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            font-weight: bold;
        }

        .product-form {
            display: none;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .product-form.active {
            display: block;
        }

        .message {
            margin-top: 10px;
            padding: 10px;
            border-radius: 5px;
        }

        .message-success {
            background-color: #d4edda;
            color: #155724;
        }

        .message-error {
            background-color: #f8d7da;
            color: #721c24;
        }

        /* Table styling */
        table {
            width: 90%;
            margin-top: 60px;
            margin-left: 5%;
            border-collapse: collapse;
            background-color: #fff;
            color: #212529;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }

        table th {
            background-color: #f8f9fa;
            color: #495057;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .btn {
            padding: 5px 10px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
        }

        .btn-edit {
            background-color: #ffc107;
            color: white;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>

<div id="main-container">

    <button class="add-product-btn" id="toggleFormBtn">Add New Product</button>

    <!-- Dimmer Overlay -->
    <div class="overlay" id="dimmerOverlay">
        <div class="product-form" id="productForm">
            <% String message = request.getParameter("message"); %>
            <% String error = request.getParameter("error"); %>

            <% if (message != null) { %>
            <div class="message message-success">
                <%= message %>
            </div>
            <% } %>

            <% if (error != null) { %>
            <div class="message message-error">
                <%= error %>
            </div>
            <% } %>

            <form action="product-save" method="post">
                <h4>Add New Product</h4>
                <hr>
                <div class="form-group">
                    <label for="name" class="form-label">Product Name:</label>
                    <input type="text" id="name" name="product_name" class="form-control">
                </div>

                <div class="form-group">
                    <label for="description" class="form-label">Description:</label>
                    <textarea id="description" name="product_description" class="form-control"></textarea>
                </div>

                <div class="form-group">
                    <label for="price" class="form-label">Price:</label>
                    <input type="text" id="price" name="product_price" class="form-control">
                </div>

                <div class="form-group">
                    <label for="stock" class="form-label">Stock:</label>
                    <input type="text" id="stock" name="product_stock" class="form-control">
                </div>

                <%----%>

                <button type="submit" class="btn btn-primary">Add Product</button>
            </form>
        </div>
    </div>

    <!-- Product Table -->
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>

        <%
            Connection connection = null;
            PreparedStatement pstm = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Ijse@123");

                String sql = "SELECT * FROM products";
                pstm = connection.prepareStatement(sql);
                rs = pstm.executeQuery();

                int rowNumber = 1;
                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    String productName = rs.getString("name");
                    String productDescription = rs.getString("description");
                    double productPrice = rs.getDouble("price");
                    int productStock = rs.getInt("stock");
        %>
        <tr>
            <td><%= rowNumber++ %></td>
            <td><%= productName %></td>
            <td><%= productDescription %></td>
            <td><%= productPrice %></td>
            <td><%= productStock %></td>
            <td class="action-buttons">
                <button class="btn btn-edit">Edit</button>
                <button class="btn btn-delete">Delete</button>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstm != null) pstm.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

        </tbody>
    </table>

</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // JavaScript to toggle form visibility
    document.getElementById('toggleFormBtn').addEventListener('click', function() {
        const form = document.getElementById('productForm');
        const overlay = document.getElementById('dimmerOverlay');
        form.classList.toggle('active');
        overlay.style.display = form.classList.contains('active') ? 'flex' : 'none';
    });

    // Close the form when clicking outside
    document.getElementById('dimmerOverlay').addEventListener('click', function(e) {
        if (e.target === document.getElementById('dimmerOverlay')) {
            const form = document.getElementById('productForm');
            form.classList.remove('active');
            this.style.display = 'none';
        }
    });
</script>

</body>
</html>
