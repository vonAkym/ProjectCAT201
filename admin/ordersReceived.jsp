
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <title>Order Received</title>
     <link rel="stylesheet" type="text/css" href="tableAdmin.css">
 </head>
 
 
 <body>
 <% String msg=request.getParameter("msg"); 
if("cancel".equals(msg))
{
%>
<h3 class="alert">Order Cancel Successfully!</h3>
<%} %>

<%if("delivered".equals(msg))
{
%>
<h3 class="alert">Successfully Updated!</h3>
<%} %>

<%if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
     <main class="table" id="customers_table">
         <section class="table__header">
             <h1>Order Received</h1>
           
         </section>
         <section class="table__body">
             <table>
                 <thead>
                      <tr>
          <th>Email</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-dollar-sign"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
              
          </tr>
                 </thead>
                  <% 
try{
	 Connection con = project.ConnectionProvider.getCon();
     Statement st = con.createStatement();
     ResultSet rs = st.executeQuery("SELECT * FROM cart INNER JOIN product ON cart.product_id = product.id WHERE cart.orderDate IS NOT NULL AND cart.status IN ('processing', 'Delivered', 'Cancelled')");
     while(rs.next())
     {
%>
            <tr>
          
          <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(17) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-dollar-sign"></i>  <%=rs.getString(5) %></td>
                <td><%=rs.getString(6) %></td>
               <td><%=rs.getString(7) %></td>
                <td><%=rs.getString(8) %></td>
                 <td><%=rs.getString(9) %></td>
             <td><%=rs.getString(11) %></td>
              <td><%=rs.getString(12) %></td>
               <td><%=rs.getString(13) %></td>
               <td><%=rs.getString(14) %></td>
               <td><%=rs.getString(15) %></td>
            </tr>
         <% }
}
catch (Exception e){
	System.out.println(e) ; 
}
%>
        </table>
      <br>
      <br>
      <br>
      </section>
      </main>

</body>
</html>

