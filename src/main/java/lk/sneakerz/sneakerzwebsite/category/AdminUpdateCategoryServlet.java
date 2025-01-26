package lk.sneakerz.sneakerzwebsite.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/category-update")
public class AdminUpdateCategoryServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("category_id");
        String categoryName = request.getParameter("category_name");
        String categoryDescription = request.getParameter("category_description");

        String message = null;
        String error = null;

        if (categoryId != null && !categoryId.isEmpty() && categoryName != null && !categoryName.isEmpty()) {
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement preparedStatement = connection.prepareStatement("UPDATE categories SET name = ?, description = ? WHERE category_id = ?")) {

                preparedStatement.setString(1, categoryName);
                preparedStatement.setString(2, categoryDescription);
                preparedStatement.setInt(3, Integer.parseInt(categoryId));
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    message = "Category updated successfully!";
                } else {
                    error = "Category not found or could not be updated.";
                }

            } catch (SQLException e) {
                error = "An error occurred while updating the category: " + e.getMessage();
                e.printStackTrace();
            }
        } else {
            error = "Invalid input data.";
        }

        // Redirect back to the category management page with feedback
        if (message != null) {
            response.sendRedirect("admin_category_management.jsp?message=" + message);
        } else {
            response.sendRedirect("admin_category_management.jsp?error=" + error);
        }
    }
}