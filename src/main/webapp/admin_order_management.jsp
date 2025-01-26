<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            overflow: hidden;
            color: black;
        }

        #main-container {
            height: 100%;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
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
    </style>
</head>
<body>

<div id="main-container">
    <div class="container">
        <!-- Orders Table -->
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Total</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <%
                Connection connection = null;
                PreparedStatement pstm = null;
                ResultSet rs = null;

                try {
                    // Load the database driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish a connection to the database
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Ijse@123");

                    // SQL query to fetch orders (removed status)
                    String sql = "SELECT order_id, user_id, total, created_at FROM orders";
                    pstm = connection.prepareStatement(sql);
                    rs = pstm.executeQuery();

                    // Loop through the result set and display each order
                    while (rs.next()) {
                        int orderId = rs.getInt("order_id");
                        int userId = rs.getInt("user_id");
                        double total = rs.getDouble("total");
                        Timestamp createdAt = rs.getTimestamp("created_at");
            %>
            <tr>
                <td><%= orderId %></td>
                <td><%= userId %></td>
                <td><%= total %></td>
                <td><%= createdAt.toLocalDateTime().toLocalDate() %></td>
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
</div>

</body>
</html>