<%-- Created by IntelliJ IDEA. User: dion Date: 1/26/25 Time: 6:52 PM To change this template use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            margin-top: 50px;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid darkgray;
            margin-right: 20px;
        }
        .profile-image img {
            width: 100%;
            height: auto;
        }
        .profile-info {
            flex-grow: 1;
        }
        .edit-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .edit-button:hover {
            background-color: #0056b3;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .update-password-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }
        .update-password-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="profile-header">
        <div class="profile-image">
            <img src="assets/images/profileimg.jpg" alt="Profile Image">
        </div>
        <div class="profile-info">
            <h2>Dion Fernando</h2>
            <button class="edit-button">Edit Profile</button>
        </div>
    </div>

    <div class="form-group">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" placeholder="Enter your first name">
    </div>

    <div class="form-group">
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" placeholder="Enter your last name">
    </div>

    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" placeholder="Enter your username">
    </div>

    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" placeholder="Enter your email">
    </div>

    <button class="update-password-button">Update Password</button>
</div>

</body>
</html>