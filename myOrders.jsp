<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <h1>My Orders</h1>
    <table border="1">
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
            </tr>
        </thead>
        <tbody>
        <%
        int sno = 0;

        // Check if 'email' is already defined in included files
        if (email != null && !email.isEmpty()) {
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                con = project.ConnectionProvider.getCon();
                ps = con.prepareStatement("SELECT * FROM cart INNER JOIN product ON cart.product_id = product.id WHERE cart.email = ? AND cart.orderDate IS NOT NULL");
                ps.setString(1, email);
                rs = ps.executeQuery();
                while (rs.next()) {
                    sno++;
        %>
            <tr>
                <td><%= sno %></td>
                <td><%= rs.getString(17) %></td>
                <td><%= rs.getString(18) %></td>
                <td><%= rs.getString(19) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(11) %></td>
                <td><%= rs.getString(12) %></td>
                <td><%= rs.getString(13) %></td>
                <td><%= rs.getString(15) %></td>
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='10'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) { }
                try { if (ps != null) ps.close(); } catch (Exception e) { }
                try { if (con != null) con.close(); } catch (Exception e) { }
            }
        } else {
            out.println("<tr><td colspan='10'>No email found in session.</td></tr>");
        }
        %>
        </tbody>
    </table>
</body>
</html>
