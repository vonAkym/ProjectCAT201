<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="changeDetailsHeader.jsp" %>

<html>
<head>
    <link rel="stylesheet" href="changePasswordStyles.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <title>Change Password</title>
   
</head>
<body>
    
    <div class="container">
     <% String msg = request.getParameter("msg"); 
        if ("notMatch".equals(msg)) { %>
            <h3 class="alert">New password and Confirm password does not match!</h3>
        <% } else if ("wrong".equals(msg)) { %>
            <h3 class="alert">Your old Password is wrong!</h3>
        <% } else if ("done".equals(msg)) { %>
            <h3 class="alert">Password changed successfully!</h3>
        <% } else if ("invalid".equals(msg)) { %>
            <h3 class="alert">Something went wrong! Try again!</h3>
        <% } %>
        <div class="title">Change Password</div>
        <form action="changePasswordAction.jsp" method="post"> 
            <div class="user-details"> 
                <div class="input-box"> 
                    <span class="details">Enter Old Password</span>
                    <input type="password" name="oldPassword" placeholder="Enter Old Password" required> 
                </div>
                 <div class="input-box"> 
                    <span class="details">Enter New Password</span>
                    <input type="password" name="newPassword" placeholder="Enter New Password" required> 
                </div>
                 <div class="input-box"> 
                    <span class="details">Enter Confirm Password</span>
                    <input type="password" name="confirmPassword" placeholder="Enter Your New Password Again" required> 
                </div>
                <div class="button"> 
                <input type="submit" value="Save">
            </div>
            </div>
            </form>
            </div>
</body>
</html>
