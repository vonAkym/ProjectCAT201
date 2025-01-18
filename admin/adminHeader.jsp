<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        
        <link rel="stylesheet" href="adminHeader.css">
    </head>
    <body>
   <header> 
    <nav>
        <ul class="nav_links" > 
          <% 
      String email = (session.getAttribute("email") != null) ? session.getAttribute("email").toString() : "Guest"; 
    %>

      <li><a href="adminPanel.jsp"> <i class="fas fa-user-alt">     <%= email %></i></a></li>
     		<li><a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a></li>
            <li><a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a></li>
            <li><a href="messagesReceived.jsp">Messages Received <i class='fas fa-comment-alt'></i></a></li>
            <li><a href="ordersReceived.jsp">Orders Received <i class="fas fa-archive"></i></a></li>

            <Li><a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a></Li>

        </ul>
    </nav>
   </header>
    </body>
</html>
