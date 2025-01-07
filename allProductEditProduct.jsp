<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>
<%@ include file="../footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Show Product</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        h3 {
            color: yellow;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div style="color: white; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>

    <% 
        String msg = request.getParameter("msg");
        if ("done".equals(msg)) { 
    %>
        <h3 class="alert">Product Successfully Updated!</h3>
    <% } else if ("wrong".equals(msg)) { %>
        <h3 class="alert">Something went wrong! Try Again!</h3>
    <% } %>

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
        <tbody>
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
    <br><br><br>

</body>
</html>
