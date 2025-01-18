<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
    String email = request.getParameter("email");
    String productId = request.getParameter("product_id");
    String orderDate = request.getParameter("orderDate"); // Include orderDate
    String newStatus = request.getParameter("newStatus");

    if (email != null && productId != null && orderDate != null && newStatus != null) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = project.ConnectionProvider.getCon();
            ps = con.prepareStatement("UPDATE cart SET status = ? WHERE email = ? AND product_id = ? AND orderDate = ?");
            ps.setString(1, newStatus);
            ps.setString(2, email);
            ps.setInt(3, Integer.parseInt(productId));
            ps.setString(4, orderDate);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<script>alert('Order status updated successfully!');</script>");
            } else {
                out.println("<script>alert('No rows updated. Check the details.');</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception e) { }
            try { if (con != null) con.close(); } catch (Exception e) { }
        }
    } else {
        out.println("<script>alert('Invalid request: Missing parameters.');</script>");
    }

    response.sendRedirect("myOrders1.jsp");
%>


