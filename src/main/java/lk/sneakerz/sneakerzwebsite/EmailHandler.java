package lk.sneakerz.sneakerzwebsite;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailHandler {
    private String to;

    public EmailHandler(String recipientEmail) {
        this.to = recipientEmail;
    }

    public boolean sendEmail(String name, String email, String message) {
        String subject = "New Review from " + name;
        String body = "Name: " + name + "\nEmail: " + email + "\n\nMessage:\n" + message;

        // Set up properties for the email
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Create a session and authenticate the email account
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("#", "#");
            }
        });

        try {
            // Create the email message
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("#"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(this.to));
            msg.setSubject(subject);
            msg.setText(body);

            // Send the message
            Transport.send(msg);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
