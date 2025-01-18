<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %> 

<!DOCTYPE html>
 <html lang="en">
 
 <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <title>Home</title>
     <link rel="stylesheet" type="text/css" href="table1.css">
 </head>
 
 <body>
     <main class="table" id="customers_table">

         <section class="table__header">
             <h1>Home</h1>
             <div class="input-group">
                <input type="search" placeholder="Search Data...">
               
            </div>
                  <%
    String msg=request.getParameter("msg");
    if("exist".equals(msg))
    {
    %>
    <h3 class="alert">Product Already Exist in your cart, quantity added! </h3>
    <%}%>
    
    <%
    if("added".equals(msg))
    {
    %>
    <h3 class="alert">Product added succesfully! </h3>
    <%}%>
    
    <%
    if("invalid".equals(msg))
    {
    %>
    <h3 class="alert">Something went wrong! Try Again! </h3>
    <%}%>
         </section>
         <section class="table__body">
             <table>
                 <thead>
                     <tr><th> Id <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Name <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Category <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Price (RM) <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Images <span class="icon-arrow"></span></th>
                         <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
                     </tr>
                 </thead>
                 <%
try{
	Connection con = project.ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select *from product where active='Yes'");
	while(rs.next())
	{
%>
                 <tbody>
                     <tr>
                                              <td> <%=rs.getString(1) %> </td>
                     
                         <td> <%=rs.getString(2) %> </td>
                         <td> <%=rs.getString(3) %></td>
                         <td> RM <%=rs.getString(4) %></td>
                        <td class="image1"><img src="<%= rs.getString(6) %>" style="width: 150px; height: auto;"></td>


               			 <td><form action="addToCartAction.jsp" method="get">
               			 <input type="hidden" name="id" value="<%= rs.getString(1) %>">
               			 <button type="submit" class="add-to-cart-btn">Add to Cart <i class="fas fa-cart-plus"></i></button>
  </form>
</td>

               			
 </tr>
                     
                      <%
}
}
catch(Exception e)
{
	System.out.println(e); 
}
%>   
                 </tbody>
             </table>
         </section>
     </main>
     <script src="script1.js"></script>
 
 </body>
 
 </html>