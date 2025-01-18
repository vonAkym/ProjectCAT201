<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>



<html>
<head>
    <link rel="stylesheet" href="form.css">
    <title>Add New Product</title>
</head>
<body>
    
	 <div class="container">
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
        <h3 style="color: black;">Product ID: <%= id-1 %></h3>
        <input type="hidden" name="id" value="<%= id %>">
		            <div class="user-details"> 
		
        <div class="title">Add Product</div>
            <div class="input-box"> 
                    <span class="details">Enter Name</span>
                    <input type="text" name="name" placeholder="Enter Product Name" required> 
                </div>
                

           <div class="input-box"> 
                    <span class="details">Enter Category</span>
                    <input type="text" name="category" placeholder="Enter Product Category" required> 
                </div>

        <div class="input-box"> 
                    <span class="details">Enter Price</span>
                    <input type="number" name="price" placeholder="Enter Product Price" required> 
                </div>

        <div class="input-box"> 
                    <span class="details">Stock </span>
                    <select class="input-style" name="active">
                <option value="Yes">Yes</option>
                <option value="No">No</option>
            </select>
                </div>
                
                <div class="input-box">
           <span class="details">Enter Image Path</span>
            <input type="text" name="image_path" placeholder="Enter the Image_Path" required>
            
        	</div>

        <button class="button">Save</button>
        </div>
    </form>
    </div>
</body>
</html>
