<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <link rel="icon" type="image/x-icon" href="icons.png"> <!-- Favicon for browser tab -->
        
        
        <link rel="stylesheet" href="navbarStyles.css">
    </head>
    <body>
   <header> 
    <img class="logo" src="icons.png" alt="logo">
    <nav>
        <ul class="nav_links" > 
          <% 
      String email = (session.getAttribute("email") != null) ? session.getAttribute("email").toString() : "Guest"; 
    %>

      <li><a href="changeDetails.jsp"> <i class="fas fa-user-alt">     <%= email %></i></a></li>
      <li><a href="HomeTable.jsp" aria-label="Home">Home <i class="fa fa-institution"></i></a></li>
     <li> <a href="myCart1.jsp" aria-label="My Cart">My Cart <i class="fas fa-cart-arrow-down"></i></a></li>
     <li> <a href="myOrders1.jsp" aria-label="My Orders">My Orders <i class="fas fa-box"></i></a></li>
      <li><a href="changeDetails.jsp" aria-label="Change Details">Change Details <i class="fas fa-edit"></i></a></li>
     <li> <a href="messageUs.jsp" aria-label="Message Us">Message Us <i class="fas fa-comment-alt"></i></a></li>

        </ul>
    </nav>
    <a class="cta" href="logout.jsp"><button>Logout</button></a>
    
   </header>
    </body>
</html>