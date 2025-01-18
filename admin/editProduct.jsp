

<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="form.css">
    <title>Edit Product</title>
</head>
<body>
    
	 <div class="container">
	   <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
    <%
    String id = request.getParameter("id");
    try {
        Connection con = project.ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("SELECT * FROM product WHERE id=?");
        pst.setString(1, id); // Safely set the id value
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
    %>
    <form action="editProductAction.jsp" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt(1) %>"> <!-- Hidden ID field for updating -->
		            <div class="user-details"> 
		
        <div class="title">Edit Product</div>
            <div class="input-box"> 
                    <span class="details">Enter Name</span>
					<input type="text" name="name" value="<%= rs.getString(2) %>" required>                
					</div>
                

           <div class="input-box"> 
                    <span class="details">Enter Category</span>
            <input  type="text" name="category" value="<%= rs.getString(3) %>" required>
                </div>

        <div class="input-box"> 
                    <span class="details">Enter Price</span>
            <input type="number" name="price" value="<%= rs.getString(4) %>" required>
                </div>

        <div class="input-box"> 
                    <span class="details">Stock </span>
                    <select class="input-style" name="active">
                <option value="Yes" <%= "Yes".equals(rs.getString(5)) ? "selected" : "" %>>Yes</option>
                <option value="No" <%= "No".equals(rs.getString(5)) ? "selected" : "" %>>No</option>
            </select>
                </div>
                
                <div class="input-box">
           <span class="details">Enter Image Path</span>
            <input type="text" name="image_path" placeholder="Enter the Image_Path" required>
            
        	</div>

        <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
        </div>
    </form>
     <% 
        }
    } catch (Exception e) {
        e.printStackTrace(); // Printing detailed exception for debugging
    }
    %>
    </div>
</body>
</html>

