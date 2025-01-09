<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/home-style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    .topnav {
      background-color: #333;
      overflow: hidden;
    }
    .topnav a {
      color: white;
      text-decoration: none;
      padding: 14px 20px;
      display: inline-block;
    }
    .topnav a:hover {
      background-color: #ddd;
      color: black;
    }
    .search-container {
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .search-container input {
      padding: 6px;
      margin-right: 5px;
      border: 1px solid #ccc;
    }
    .search-container button {
      background-color: #333;
      color: white;
      border: none;
      cursor: pointer;
    }
    .search-container button:hover {
      background-color: #ddd;
      color: black;
    }
  </style>
</head>
<body>
  <div class="topnav sticky">
    <% 
      String email = (session.getAttribute("email") != null) ? session.getAttribute("email").toString() : "Guest"; 
    %>
    <center><h2>Prime Merchify Shop</h2></center>
    <h2><a href="#"><%= email %> <i class="fas fa-user-alt"></i></a></h2>
    <a href="home.jsp" aria-label="Home">Home <i class="fa fa-institution"></i></a>
    <a href="myCart.jsp" aria-label="My Cart">My Cart <i class="fas fa-cart-arrow-down"></i></a>
    <a href="myOrders.jsp" aria-label="My Orders">My Orders <i class="fas fa-box"></i></a>
    <a href="changeDetails.jsp" aria-label="Change Details">Change Details <i class="fas fa-edit"></i></a>
    <a href="messageUs.jsp" aria-label="Message Us">Message Us <i class="fas fa-comment-alt"></i></a>
    <a href="about.jsp" aria-label="About">About <i class="fas fa-info-circle"></i></a>
    <a href="logout.jsp" aria-label="Logout">Logout <i class="fas fa-sign-out-alt"></i></a>
    
    
    <div class="search-container">
      <form action="searchHome.jsp" method="post">
        <input type="text" placeholder="Search..." name="search">
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>
  </div>
</body>
</html>
