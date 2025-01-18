<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %> 

<!DOCTYPE html>
 <html lang="en">
 
 <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <title>Home</title>
     <link rel="stylesheet" type="text/css" href="table1.css">
 </head>
 
 <body>
     <main class="table" id="customers_table">

         <section class="table__header">
             <h1>My Orders</h1>
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
         <!-- Sorting Form -->
            <form action="myOrders1.jsp" method="GET">
                <label for="sortColumn">Sort by:</label>
                <select name="sortColumn" id="sortColumn">
                    <option value="orderDate">Order Date</option>
                    <option value="status">Status</option>
                </select>
                <label for="sortOrder">Order:</label>
                <select name="sortOrder" id="sortOrder">
                    <option value="ASC">Ascending</option>
                    <option value="DESC">Descending</option>
                </select>

                <button type="submit">Sort</button>
            </form>
        </section>
         <section class="table__body">
             <table>
                 <thead>
                     <tr>
                        <th>S.No</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Sub Total</th>
                        <th>Order Date</th>
                        <th>Expected Delivery</th>
                        <th>Payment Method</th>
                        <th>Status</th>
                        <th>Action</th>
                     </tr>
                 </thead>
                 <%
                        int sno = 0;
                        String sortColumn = request.getParameter("sortColumn");
                        String sortOrder = request.getParameter("sortOrder");

                        // Default sorting
                        if (sortColumn == null || sortColumn.isEmpty()) sortColumn = "orderDate";
                        if (sortOrder == null || sortOrder.isEmpty()) sortOrder = "ASC";

                        // Validate sort inputs to prevent SQL injection
                        if (!sortColumn.matches("orderDate|price|status")) sortColumn = "orderDate";
                        if (!sortOrder.matches("ASC|DESC")) sortOrder = "ASC";

                        if (email != null && !email.isEmpty()) {
                            Connection con = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;
                            try {
                                con = project.ConnectionProvider.getCon();
                                String query = "SELECT * FROM cart INNER JOIN product ON cart.product_id = product.id " +
                                               "WHERE cart.email = ? AND cart.orderDate IS NOT NULL " +
                                               "ORDER BY " + sortColumn + " " + sortOrder;
                                ps = con.prepareStatement(query);
                                ps.setString(1, email);
                                rs = ps.executeQuery();
                                while (rs.next()) {
                                    sno++;
                    %>
                    <tr>
                        <td><%= sno %></td>
                        <td><%= rs.getString(17) %></td>
                        <td><%= rs.getString("category") %></td>
                        <td> RM<%= rs.getDouble("price") %></td>
                        <td><%= rs.getInt("quantity") %></td>
                        <td> RM<%= rs.getDouble("price") * rs.getInt("quantity") %></td>
                        <td><%= rs.getString("orderDate") %></td>
                        <td><%= rs.getString("deliveryDate") %></td>
                        <td><%= rs.getString("paymentMethod") %></td>
                        <td><%= rs.getString("status") %></td>
                        <td>
                            <!-- Form to update the status -->
                            <form action="updateOrderStatus.jsp" method="POST">
                                <input type="hidden" name="email" value="<%= rs.getString("email") %>">
                                <input type="hidden" name="product_id" value="<%= rs.getInt("product_id") %>">
                                <input type="hidden" name="orderDate" value="<%= rs.getString("orderDate") %>">
                                <select name="newStatus">
                                    <option value="Delivered" <%= rs.getString("status").equals("Delivered") ? "selected" : "" %>>Delivered</option>
                                    <option value="Cancelled" <%= rs.getString("status").equals("Cancelled") ? "selected" : "" %>>Cancelled</option>
                                </select>
                                <button type="submit">Update</button>
                            </form>
                        </td>
                    </tr>
                    <%
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='11'>Error: " + e.getMessage() + "</td></tr>");
                            } finally {
                                try { if (rs != null) rs.close(); } catch (Exception e) { }
                                try { if (ps != null) ps.close(); } catch (Exception e) { }
                                try { if (con != null) con.close(); } catch (Exception e) { }
                            }
                        } else {
                            out.println("<tr><td colspan='11'>No email found in session.</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </section>
    </main>
</body>

</html>