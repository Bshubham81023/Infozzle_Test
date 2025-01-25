<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
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

        /* Right Sign Up Section */
        .signup-section {
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: #FFFFFF;
        }

        .signup-form {
            width: 70%;
            max-width: 500px;
        }

        .signup-form h1 {
            font-size: 50px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .signup-form p {
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
            margin-bottom: 20px;
        }

        .checkbox-group input {
            margin-right: 10px;
        }

        .signup-button {
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

        .login-link {
            margin-top: 20px;
            font-size: 16px;
            color: #818181;
        }

        .login-link a {
            color: #7754F6;
            text-decoration: none;
        }
    </style>
    <script>
        function validateForm(event) {
            const form = document.querySelector('.signup-form');
            const firstName = form.querySelector('input[placeholder="First Name"]');
            const lastName = form.querySelector('input[placeholder="Last Name"]');
            const email = form.querySelector('input[placeholder="Email Address"]');
            const password = form.querySelector('input[placeholder="Create Password"]');
            const checkbox = form.querySelector('input[type="checkbox"]');

            // Regular Expressions
            const nameRegex = /^[a-zA-Z ]{2,}$/;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;

            // First Name Validation
            if (!nameRegex.test(firstName.value.trim())) {
                alert('First Name must contain only letters and be at least 2 characters long.');
                event.preventDefault();
                return false;
            }

            // Last Name Validation
            if (!nameRegex.test(lastName.value.trim())) {
                alert('Last Name must contain only letters and be at least 2 characters long.');
                event.preventDefault();
                return false;
            }

            // Email Validation
            if (!emailRegex.test(email.value.trim())) {
                alert('Please enter a valid email address.');
                event.preventDefault();
                return false;
            }

            // Password Validation
            if (!passwordRegex.test(password.value)) {
                alert('Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, and one number.');
                event.preventDefault();
                return false;
            }

            // Checkbox Validation
            if (!checkbox.checked) {
                alert('You must agree to the terms and privacy policy.');
                event.preventDefault();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <!-- Image Section -->
        <div class="image-section">
            <img src="assets/m.png" alt="Background Image" style="width: 100%; height: 100%; object-fit: cover;">
        </div>

        <!-- Sign Up Section -->
        <div class="signup-section">
            <form class="signup-form" action="signup" method="post" onsubmit="return validateForm(event)">
                <h1>Sign Up</h1>
                <p>Create your account in seconds</p>

                <div class="input-group">
                    <input type="text"  placeholder="First Name" name="fname" required>
                </div>

                <div class="input-group">
                    <input type="text" placeholder="Last Name" name="lname" required>
                </div>

                <div class="input-group">
                    <input type="email" placeholder="Email Address" name="semail" required>
                </div>

                <div class="input-group">
                    <input type="password" placeholder="Create Password" name="spass" required>
                </div>

                <div class="checkbox-group">
                    <input type="checkbox" id="terms">
                    <label for="terms">I agree to the terms and privacy policy</label>
                </div>

                <button type="submit" class="signup-button">Sign Up</button>

                <div class="login-link">
                    Already have an account? <a href="login.jsp">Log in</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
