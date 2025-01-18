<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <title>All Product</title>
     <link rel="stylesheet" type="text/css" href="tableAdmin.css">
 </head>
 
 <body>
     <main class="table" id="customers_table">
         <section class="table__header">
             <h1>All Product & Edit Product</h1>
             <% 
        String msg = request.getParameter("msg");
        if ("done".equals(msg)) { 
    %>
        <h3 class="alert">Product Successfully Updated!</h3>
    <% } else if ("wrong".equals(msg)) { %>
        <h3 class="alert">Something went wrong! Try Again!</h3>
    <% } %>
         </section>
         <section class="table__body">
             <table>
                 <thead>
                      <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col"><i class="fa fa-dollar-sign"></i> Price</th>
                <th>Status</th>
                <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
            </tr>
                 </thead>
                 <%
            try {
                Connection con = project.ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM product"); // Correct SQL query
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt(1) %></td>  <!-- ID -->
                <td><%= rs.getString(2) %></td>  <!-- Name -->
                <td><%= rs.getString(3) %></td>  <!-- Category -->
                <td><i class="fa fa-dollar-sign"></i> <%= rs.getDouble(4) %></td>  <!-- Price -->
                <td><%= rs.getString(5) %></td>  <!-- Status -->
                <td><a href="editProduct.jsp?id=<%= rs.getInt(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>  <!-- Edit link -->
            </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();  // Correct error handling
        %>
            <tr><td colspan="6">An error occurred while retrieving data!</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
    </section>
    </main>
    <br><br><br>

</body>
</html>
