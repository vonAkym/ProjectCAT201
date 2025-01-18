<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="Styles.css">

	<title>AdminHub</title>
</head>
<body>


	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bxs-sad'></i>
			<span class="text">GameMaster</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="#">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
		
			<li>
				<a href="ordersReceived.jsp">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Order Received</span>
				</a>
			</li>
			<li>
				<a href="messagesReceived.jsp">
					<i class='bx bxs-message-dots' ></i>
					<span class="text">Message Received</span>
				</a>
			</li>
			<li>
				<a href="allProductEditProduct.jsp">
					<i class='bx bxs-group' ></i>
					<span class="text">All Product & Edit Product</span>
				</a>
			</li>
				<li>
				<a href="addNewProduct.jsp">
					<i class='bx bxs-shopping-bag-alt' ></i>
					<span class="text">Add Product</span>
				</a>
			</li>
		</ul>
		<ul class="side-menu">
			<li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li>
			<li>
				<a href="../logout.jsp" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->



	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu' ></i>
			<a href="#" class="nav-link">Categories</a>
			<form action="#">
				<div class="form-input">
					<input type="search" placeholder="Search...">
					<button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
				</div>
			</form>
			<input type="checkbox" id="switch-mode" hidden>
			<label for="switch-mode" class="switch-mode"></label>
			<a href="#" class="notification">
				<i class='bx bxs-bell' ></i>
				<span class="num">8</span>
			</a>
			<a href="#" class="profile">
				<img src="img/people.png">
			</a>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Dashboard</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<a class="active" href="#">Home</a>
						</li>
					</ul>
				</div>
				
			</div>

			


			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Recent Orders</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
						<thead>
							<tr>
								<th>User</th>
								<th>Date Ordered</th>
								<th>Date Expected Delivery</th>
								<th> Payment Method </th>
								<th>Status </th>
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
						

							
						</tbody>
					</table>
				</div>
			</div>
		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	

	<script src="script.js"></script>
</body>
</html>