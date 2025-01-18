


<%@page errorPage="error.jsp" %>

           
<!DOCTYPE html>
    <link rel="icon" type="image/x-icon" href="icons.png"> <!-- Favicon for browser tab -->

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        
        <link rel="stylesheet" href="navbarStyles1.css">
    </head>
    <body>
   <header> 
    <img class="logo" src="icons.png" alt="logo">
    <nav>
        <ul class="nav_links" > 
          <% 
      String email = (session.getAttribute("email") != null) ? session.getAttribute("email").toString() : "Guest"; 
    %>
    <li> <a class="cta" href="HomeTable.jsp"><button>Back</button></a></li>
      <li><a href="changeDetails.jsp"> <i class="fas fa-user-alt">     <%= email %></i></a></li>
     <li> <a href="changePassword.jsp">Change Password <i class='fas fa-key'></i></a>
     <li>  <a href="addChangeAddress.jsp">Add or change Address <i class='fas fa-map-marker-alt'></i></a>
      <li><a href="changeSecurityQuestion.jsp">Change Security Question <i class="fa fa-repeat"></i></a>
     <li> <a href="changeMobileNumber.jsp">Change Mobile Number <i class='fas fa-phone'></i></a>
        </ul>
    </nav>
    <a class="cta" href="logout.jsp"><button>LogOut</button></a>
    
   </header>
    </body>
</html>