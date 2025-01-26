package lk.sneakerz.sneakerzwebsite;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("admin".equals(username) && "123".equals(password)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin_dashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            String dbURL = "jdbc:mysql://localhost:3306/ecommerce?useSSL=false&allowPublicKeyRetrieval=true";
            String dbUser = "root";
            String dbPassword = "Ijse@123";

            try {
                // Register JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection
                try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
                    String sql = "SELECT password_hash FROM users WHERE username = ?";
                    try (PreparedStatement statement = connection.prepareStatement(sql)) {
                        statement.setString(1, username);

                        try (ResultSet resultSet = statement.executeQuery()) {
                            if (resultSet.next()) {
                                String storedHash = resultSet.getString("password_hash");

                                if (BCrypt.checkpw(password, storedHash)) {
                                    RequestDispatcher dispatcher = request.getRequestDispatcher("user_dashboard.jsp");
                                    dispatcher.forward(request, response);
                                } else {
                                    response.sendRedirect("login.jsp?error=Invalid username or password");
                                }
                            } else {
                                response.sendRedirect("login.jsp?error=Invalid username or password");
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("register.jsp?error=An unexpected error occurred. Please try again.");
            }
        }
    }
}

