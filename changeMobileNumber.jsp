<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="changeDetailsHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="changeAddress.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Mobile Number</title>
</head>
<body>


<div class="container">
<% String msg=request.getParameter("msg"); 
if("done".equals(msg))
{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%} %>

<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
  <div class="title">Change Mobile Number</div>
        <form action="changeMobileNumberAction.jsp" method="post"> 
            <div class="user-details"> 
                <div class="input-box"> 
                    <span class="details">Enter Your New Mobile Number</span>
                    <input type="password" name="mobileNumber" placeholder="Enter Your New Mobile Number" required> 
                </div>
                 <div class="input-box"> 
                    <span class="details">Enter Password (For Security)</span>
                    <input type="password" name="password" placeholder="Enter Password" required> 
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