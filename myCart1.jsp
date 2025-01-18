<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %> 

<!DOCTYPE html>
 <html lang="en">
 
 <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <title>My Cart</title>
     <link rel="stylesheet" type="text/css" href="table1.css">
 </head>
 
 <body>
     <main class="table" id="customers_table">
         <section class="table__header">
             <h1>My Cart</h1>
             <%
    String msg=request.getParameter("msg");
    if("exist".equals(msg))
    {
    %>
    <h3 class="alert">Product Already Exist in your cart, quantity added! </h3>
    <%}%>
    
    <%
    if("added".equals(msg))
    {
    %>
    <h3 class="alert">Product added succesfully! </h3>
    <%}%>
    
    <%
    if("invalid".equals(msg))
    {
    %>
    <h3 class="alert">Something went wrong! Try Again! </h3>
    <%}%>
         </section>
         <section class="table__body">
             <table>
                 <thead>
                      <tr>
                        <th scope="col">S.No</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Category</th>
                        <th scope="col"><i class="fa fa-inr"></i> Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Sub Total</th>
                        <th scope="col">Remove <i class="fas fa-trash-alt"></i></th>
                    </tr>
                 </thead>
                 <%
                        int total = 0;
                        int sno = 0;  // serial number
                        try {
                            Connection con = project.ConnectionProvider.getCon();
                            Statement st = con.createStatement();

                            // Query to get the total sum from cart
                            ResultSet rsCart = st.executeQuery("SELECT sum(total) FROM cart WHERE email='" + email + "' AND address IS NULL");
                            while (rsCart.next()) {
                                total = rsCart.getInt(1);
                            }
                    %>
                   
                    
                    <% 
                        // Query to get the product details in the cart
                        ResultSet rs = st.executeQuery("SELECT product.id, product.name, product.category, product.price, cart.quantity, cart.total FROM product INNER JOIN cart ON product.id = cart.product_id AND cart.email='" + email + "' AND cart.address IS NULL");
                        while (rs.next()) {
                            sno++; // Incrementing serial number
                    %>
                    <tr>
                        <td><%= sno %></td> <!-- Serial number -->
                        <td><%= rs.getString("name") %></td> <!-- Product name -->
                        <td><%= rs.getString("category") %></td> <!-- Product category -->
                        <td>RM <%= rs.getString("price") %></td> <!-- Product price -->
                        <td>
                            <a href="incDecQuantityAction.jsp?id=<%= rs.getString("id") %>&quantity=inc"><i class="fas fa-plus-circle"></i></a>  
                            <%= rs.getInt("quantity") %> 
                            <a href="incDecQuantityAction.jsp?id=<%= rs.getString("id") %>&quantity=dec"><i class="fas fa-minus-circle"></i></a>
                        </td> <!-- Displaying quantity with increment/decrement links -->
                        <td>RM </i> <%= rs.getString("total") %></td> <!-- Subtotal -->
                        <td>
    <form action="removeFromCart.jsp" method="GET">
        <input type="hidden" name="id" value="<%= rs.getString("id") %>">
        <button type="submit" class="remove-from-cart-btn">
            Remove <i class="fas fa-trash-alt"></i>
        </button>
    </form>
</td>
</tr>

                    <% 
                        } 
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                     <tr>
                        <th scope="col" style="background-color: transparent;">Total: RM<%= total %> 
                        </th>
                        <% if (total > 0) { %>
                            <th scope="col"><a href="addressPayment.jsp">Proceed to order</a></th>
                        <% } %>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>
    <script src="script.js"></script>
</body>

</html>