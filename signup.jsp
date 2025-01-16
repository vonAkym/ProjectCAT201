<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="icon" type="image/x-icon" href="icons.png"> <!-- Favicon for browser tab -->
    
    <link rel="stylesheet" href="Signup.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');
        
        .alert {
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            position: relative;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }

        .close-btn {
            position: absolute;
            top: 5px;
            right: 10px;
            border: none;
            background: transparent;
            color: inherit;
            font-size: 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">Registration</div>
        <form action="signupAction.jsp" method="post" onsubmit="return validatePasswords()"> 
            <div class="user-details"> 
                <div class="input-box"> 
                    <span class="details">Full Name</span>
                    <input type="text" name="name" placeholder="Enter Your Name" required> 
                </div>
                <div class="input-box"> 
                    <span class="details">Email</span>
                    <input type="email" name="email" placeholder="Enter Your Email" required> 
                </div>
                <div class="input-box"> 
                    <span class="details">Mobile Number</span>
                    <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>    
                </div>
                <div class="input-box"> 
                    <span class="details">Security Question</span>
                    <select name="securityQuestion" required> 
                        <option value="What was your first car?">What was your first car?</option>
                        <option value="What is the name of your first pet?">What is the name of your first pet?</option>
                        <option value="What elementary school did you attend?">What elementary school did you attend?</option>
                        <option value="What is the name of your Mom?">What is the name of your Mom?</option>
                    </select>    
                    <input type="text" name="answer" placeholder="Enter Answer" required>
                </div>
                <div class="input-box"> 
                    <span class="details">Password</span>
                    <input type="password" id="password" name="password" placeholder="Enter Your Password" required>
                </div>
                <div class="input-box"> 
                    <span class="details">Confirm Password</span>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Your Password" required>
                </div>
            </div>
            <div class="button"> 
                <input type="submit" value="Signup">
            </div>
            <div class="button1"> 
                <a href="index.jsp" class="login-link">Login</a>
            </div>
        </form>
    </div>

    <%
    String msg = request.getParameter("msg");
    if ("valid".equals(msg)) {
    %>
        <div class="alert alert-success">
            <span><strong>Success!</strong> Successfully Registered.</span>
            <button class="close-btn" onclick="closeAlert(this)">×</button>
        </div>
    <% 
    } else if ("invalid".equals(msg)) {
    %>
        <div class="alert alert-danger">
            <span><strong>Error!</strong> Something Went Wrong! Try Again!</span>
            <button class="close-btn" onclick="closeAlert(this)">×</button>
        </div>
    <% 
    } 
    %>

    <!-- Link to external JavaScript -->
    <script src="Signupscripts.js"></script>

</body>
</html>
