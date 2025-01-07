<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>
<%@ include file="../footer.jsp" %>



<html>
<head>
    <link rel="stylesheet" href="../css/addNewProduct-style.css">
    <title>Add New Product</title>
</head>
<body>
    <% 
        String msg = request.getParameter("msg");
        if ("done".equals(msg)) { 
    %>
        <h3 class="alert">Product Added Successfully!</h3>
    <% } else if ("wrong".equals(msg)) { %>
        <h3 class="alert">Something went wrong! Try Again!</h3>
    <% } %>

    <%
        int id = 1;
        try {
            Connection con = project.ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select max(id) from product");
            if (rs.next()) {
                id = rs.getInt(1) + 1;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Logs errors for debugging
        }
    %>

    <form action="addNewProductAction.jsp" method="post">
        <h3 style="color: yellow;">Product ID: <%= id-1 %></h3>
        <input type="hidden" name="id" value="<%= id %>">

        <div class="left-div">
            <h3>Enter Name</h3>
            <input class="input-style" type="text" name="name" placeholder="Enter the Product Name" required>
            <hr>
        </div>

        <div class="right-div">
            <h3>Enter Category</h3>
            <input class="input-style" type="text" name="category" placeholder="Enter the Product Category" required>
            <hr>
        </div>

        <div class="left-div">
            <h3>Enter Price</h3>
            <input class="input-style" type="number" name="price" placeholder="Enter the Product Price" required>
            <hr>
        </div>

        <div class="right-div">
            <h3>Active</h3>
            <select class="input-style" name="active">
                <option value="Yes">Yes</option>
                <option value="No">No</option>
            </select>
            <hr>
        </div>

        <button class="button">Save</button>
    </form>
</body>
</html>
