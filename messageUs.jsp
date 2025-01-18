<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>


<html>
<head>
<link rel="stylesheet" href="changeAddress.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>


<div class="container">
<% String msg=request.getParameter("msg"); 
if("valid".equals(msg))
{
%>
<h3 style="text-align:center; color:BLACK;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>

<% 
if("invalid".equals(msg))
{
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
        <div class="title">Message Us</div>
        <form action="messageUsAction.jsp" method="post"> 
            <div class="user-details"> 
                <div class="input-box"> 
                    <span class="details">Subject</span>
                    <input type="text" name="subject"  placeholder="Enter Subject" required> 
                </div>
                 <div class="input-box"> 
                    <span class="details">Message</span>
                    <textarea  name="body"  placeholder="Enter Your Message" required> </textarea>
                </div>
        
                <div class="button"> 
                <input type="submit" value="Send">
            </div>
            </div>
            </form>
</div>

<br><br><br>
</body>
</html>