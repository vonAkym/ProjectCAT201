

<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <title>Message Received</title>
     <link rel="stylesheet" type="text/css" href="tableAdmin.css">
 </head>
 
 <body>
     <main class="table" id="customers_table">
         <section class="table__header">
             <h1>Message Received</h1>
           
         </section>
         <section class="table__body">
             <table>
                 <thead>
                      <tr>
                <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
            </tr>
                 </thead>
                  <% 
       try {
           Connection con = project.ConnectionProvider.getCon();
           Statement st = con.createStatement();
           ResultSet rs= st.executeQuery("select *from message");
           while (rs.next())
           {
       %>
           <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
          </tr>
       <%
           }}
       catch(Exception e)
       {
    	   System.out.println(e);
       }%>
        </tbody>
      </table>
            </section>
      </main>

</body>
</html>

