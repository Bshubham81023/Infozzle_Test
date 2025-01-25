<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            display: flex;
            height: 100vh;
            width: 100vw;
        }

        .container {
            display: flex;
            width: 100%;
            height: 100%;
        }

        /* Left Image Section */
        .image-section {
            width: 50%;
            background: url('image.png') no-repeat center center;
            background-size: cover;
        }

        /* Right Login Section */
        .login-section {
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: #FFFFFF;
        }

        .login-form {
            width: 70%;
            max-width: 500px;
        }

        .login-form h1 {
            font-size: 50px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .login-form p {
            font-size: 16px;
            color: #818181;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group input {
            width: 100%;
            height: 60px;
            padding: 10px;
            font-size: 16px;
            color: #818181;
            border: 1px solid #D1D1D1;
            border-radius: 10px;
            box-sizing: border-box;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .checkbox-group input {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }

        .checkbox-group label {
            font-size: 16px;
            color: #818181;
        }

        .login-button {
            width: 100%;
            height: 60px;
            background: #7754F6;
            border: none;
            color: #FFFFFF;
            font-size: 16px;
            font-weight: 700;
            border-radius: 10px;
            box-shadow: 0px 15px 30px -10px rgba(119, 84, 246, 0.27);
            cursor: pointer;
        }

        .signup-link {
            margin-top: 20px;
            font-size: 16px;
            color: #818181;
        }

        .signup-link a {
            color: #7754F6;
            text-decoration: none;
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
    <!-- Image Section -->
        <div class="image-section">
            <img src="assets/m.png" alt="Background Image" style="width: 100%; height: 100%; object-fit: cover;">
        </div>

        <!-- Login Section -->
        <div class="login-section">
            <form class="login-form" action="login" method="post">
                <h1>Login</h1>
                <p>Login to your account in seconds</p>

                <!-- Display warning message if login fails -->
                <% 
                    String error = request.getParameter("error");
                    if (error != null && error.equals("invalid")) { 
                %>
                <div class="error-message">
                    Invalid email or password. Please try again.
                </div>
                <% 
                    } 
                %>

                <div class="input-group">
                    <input type="email" placeholder="Email Address" name="lemail" required>
                </div>

                <div class="input-group">
                    <input type="password" placeholder="Password" name="lpass" required>
                </div>

                <div class="checkbox-group">
                    <input type="checkbox" id="keep-logged-in" name="keepLoggedIn">
                    <label for="keep-logged-in">Keep me logged in</label>
                </div>

                <button type="submit" class="login-button">Log in</button>

                <div class="signup-link">
                    Don’t have an account? <a href="signin.jsp">Sign up</a>
                </div>
            </form>
        </div>
    </div>

 <!--    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const loginForm = document.querySelector(".login-form");

            loginForm.addEventListener("submit", function (event) {
                const emailField = document.querySelector('input[name="lemail"]');
                const passwordField = document.querySelector('input[name="lpass"]');
                const checkboxField = document.querySelector('input[name="keepLoggedIn"]');

                // Validate if email or password fields are empty
                if (!emailField.value.trim()) {
                    alert("Email field is required.");
                    event.preventDefault();
                    return false;
                }

                if (!passwordField.value.trim()) {
                    alert("Password field is required.");
                    event.preventDefault();
                    return false;
                }
            });
        });
    </script> -->
    
      <script>
        // JavaScript to fill every input field with default values
        document.addEventListener("DOMContentLoaded", function () {
            // Select the email and password input fields
            const emailField = document.querySelector('input[type="email"]');
            const passwordField = document.querySelector('input[type="password"]');
            const checkboxField = document.querySelector('input[type="checkbox"]');

            // Fill in default values
            if (emailField) {
             //   emailField.value = "user@example.com"; // Default email

                // Validate email with regex
                const emailRegex = /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/;
                if (!emailRegex.test(emailField.value)) {
                    console.error("Invalid email format");
                }
            }

            if (passwordField) {
               // passwordField.value = "password123"; // Default password

                // Validate password with regex (at least 8 characters, one letter, one number)
                const passwordRegex = /^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$/;
                if (!passwordRegex.test(passwordField.value)) {
                    console.error("Password must be at least 8 characters long and include one letter and one number");
                }
            }

            if (checkboxField) {
                checkboxField.checked = true; // Default to checked
            }
        });
    </script>
</body>
</html>
