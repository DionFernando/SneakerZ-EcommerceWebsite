package lk.sneakerz.sneakerzwebsite.product;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/product-save")
public class AdminSaveProductServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("product_name");
        String productDescription = request.getParameter("product_description");
        String productPriceStr = request.getParameter("product_price");
        String productStockStr = request.getParameter("product_stock");

        PrintWriter out = response.getWriter();

        if (productName == null || productName.isEmpty() ||
                productDescription == null || productDescription.isEmpty() ||
                productPriceStr == null || productPriceStr.isEmpty() ||
                productStockStr == null || productStockStr.isEmpty()) {

            response.sendRedirect("admin_product_management.jsp?error=All fields are required.");
            return;
        }

        try {
            double productPrice = Double.parseDouble(productPriceStr);
            int productStock = Integer.parseInt(productStockStr);

            Connection connection = null;
            PreparedStatement preparedStatement = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                String sql = "INSERT INTO products (name, description, price, stock) VALUES (?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, productName);
                preparedStatement.setString(2, productDescription);
                preparedStatement.setDouble(3, productPrice);
                preparedStatement.setInt(4, productStock);

                int rowsInserted = preparedStatement.executeUpdate();

                if (rowsInserted > 0) {
                    response.sendRedirect("admin_product_management.jsp?message=Product added successfully.");
                } else {
                    response.sendRedirect("admin_product_management.jsp?error=Error adding product. Please try again.");
                }

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("admin_product_management.jsp?error=Database error.");
            } finally {
                try {
                    if (preparedStatement != null) preparedStatement.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("admin_product_management.jsp?error=Invalid price or stock.");
        }
    }
}

