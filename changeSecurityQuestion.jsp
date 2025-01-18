<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="changeDetailsHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="changeAddress.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>



<div class="container">
<% String msg=request.getParameter("msg"); 
if("done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>

<% if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
        <div class="title">Change Security Question</div>
        <form action="changeSecurityQuestionAction.jsp" method="post"> 
            <div class="user-details"> 
                <div class="input-box"> 
                    <span class="details">Select Your New Securtiy Question</span>
                    <select class="input-style" name="securityQuestion">
 <option value="What was your first car?">What was your first car?</option>
 <option value="What is the name of your first pet?">What is the name of your first pet?</option>
 <option value="What elementary school did you attend?">What elementary school did you attend?</option>
 <option value="What is the name of your Mom?">What is the name of your Mom?</option>
 </select>
                </div>
                 <div class="input-box"> 
                    <span class="details">Enter Your New Answer</span>
                    <input type="text" name="newAnswer"  placeholder="Enter Your New Answer" required> 
                </div>
                 <div class="input-box"> 
                    <span class="details">Enter Password (For Security)</span>
                    <input type="password" name="password"  placeholder="Enter Your Password" required> 
                </div>

                <div class="button"> 
                <input type="submit" value="Save">
            </div>
            </div>
            </form>
</div>

</body>
<br><br><br>
</html>