<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin User Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            background: #f2f2f2;
            color: black;
        }

        .mb-4{
            font-size: 20px;
        }

        #main-container {
            padding: 2rem;
        }

        .table {
            background-color: #2c2c2c;
            color: #fff;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .btn {
            font-size: 0.875rem;
            width: 100px;
            padding: 6px 0;
        }

        .btn-activate {
            background-color: #198754;
            color: #fff;
        }

        .btn-deactivate {
            background-color: #dc3545;
            color: #fff;
        }

        .btn-activate:hover,
        .btn-deactivate:hover {
            opacity: 0.9;
        }

        .status-active {
            color: #198754; /* Bootstrap's success color */
            font-weight: bold;
        }

        .status-deactivated {
            color: #dc3545; /* Bootstrap's danger color */
            font-weight: bold;
        }
    </style>
</head>
<body>
<div id="main-container" class="container">
    <h1 class="text-center mb-4">User Management</h1>
    <div class="table-responsive">
        <table class="table table-bordered table-hover text-center">
            <thead>
            <tr>
                <th>#</th>
                <th>Username</th>
                <th>Email</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                try {
                    // Database connection details
                    String dbURL = "jdbc:mysql://localhost:3306/ecommerce";
                    String dbUsername = "root";
                    String dbPassword = "Ijse@123";

                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish the connection
                    Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                    // Query to fetch users
                    String sql = "SELECT * FROM users";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);

                    // Iterate through the results
                    while (rs.next()) {
                        int userId = rs.getInt("user_id");
                        String username = rs.getString("username");
                        String email = rs.getString("email");
                        String createdAt = rs.getString("created_at");
                        // Assuming status column is not present, we infer active/deactivated based on conditions:
                        String status = (createdAt != null) ? "Active" : "Deactivated"; // Example condition

            %>
            <tr>
                <td><%= userId %></td>
                <td><%= username %></td>
                <td><%= email %></td>
                <td><span class="<%= status.equals("Active") ? "status-active" : "status-deactivated" %>"><%= status %></span></td>
                <td>
                    <button class="btn btn-sm <%= status.equals("Active") ? "btn-deactivate" : "btn-activate" %>">
                        <%= status.equals("Active") ? "Deactivate" : "Activate" %>
                    </button>
                </td>
            </tr>
            <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>