package lk.sneakerz.sneakerzwebsite;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;

@WebServlet("/SendReviewServlet")
public class SendReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Basic email validation
        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid email format.");
            return;
        }

        // Create an instance of EmailHandler
        EmailHandler emailHandler = new EmailHandler("#");

        // Send the email using the EmailHandler class
        boolean success = emailHandler.sendEmail(name, email, message);

        // Prepare the response
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        if (success) {
            out.println("<h3>Email sent successfully!</h3>");
        } else {
            out.println("<h3>Error sending email. Please try again.</h3>");
        }
    }
}