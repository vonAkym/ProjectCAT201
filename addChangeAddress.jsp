<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="changeDetailsHeader.jsp" %>


<html>
<head>
<link rel="stylesheet" href="changeAddress.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add/Change Address</title>
</head>
<body>


<%
try{
	Connection con = project.ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select *from user where email='"+email+"'");
	while(rs.next()){
		
		

%>
<div class="container">
<% String msg=request.getParameter("msg"); 
if("valid".equals(msg))
{
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} %>

<% 
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>
        <div class="title">Change Address</div>
        <form action="addChangeAddressAction.jsp" method="post"> 
            <div class="user-details"> 
                <div class="input-box"> 
                    <span class="details">Enter Address</span>
                    <input type="text" name="address" value="<%=rs.getString(7) %>" placeholder="Enter Address" required> 
                </div>
                 <div class="input-box"> 
                    <span class="details">Enter City</span>
                    <input type="text" name="city" value="<%=rs.getString(8) %>" placeholder="Enter Address" required> 
                </div>
                 <div class="input-box"> 
                    <span class="details">Enter State</span>
                    <input type="text" name="state" value="<%=rs.getString(9) %>" placeholder="Enter Address" required> 
                </div>
                
                <div class="input-box"> 
                    <span class="details">Enter Country</span>
                    <input type="text" name="country" value="<%=rs.getString(10) %>" placeholder="Enter Address" required> 
                </div>
                
                <div class="button"> 
                <input type="submit" value="Save">
            </div>
            </div>
            </form>
</div>
<%
}
}

catch (Exception e)
{}
%>


</body>
<br><br><br><br>
</html>