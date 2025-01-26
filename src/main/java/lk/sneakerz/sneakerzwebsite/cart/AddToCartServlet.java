package lk.sneakerz.sneakerzwebsite.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(AddToCartServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetching product details from the request
        String productId = request.getParameter("productId");
        String userId = request.getParameter("userId");
        String quantity = request.getParameter("quantity");

        // Validation
        if (productId == null || userId == null || quantity == null || Integer.parseInt(quantity) <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters");
            return;
        }

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/ecommerce";
        String username = "root";
        String password = "Ijse@123";

        // SQL query to insert the product into the cart
        String query = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = connection.prepareStatement(query)) {

            // Setting up the query parameters
            statement.setInt(1, Integer.parseInt(userId));
            statement.setInt(2, Integer.parseInt(productId));
            statement.setInt(3, Integer.parseInt(quantity));

            // Execute the query to insert the data into the cart table
            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                // Successful insertion
                response.sendRedirect("cart.jsp");  // Redirect to cart page
            } else {
                // Insertion failed
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add item to cart");
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Database error while adding to cart", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid input for productId, userId, or quantity", e);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input data");
        }
    }
}
