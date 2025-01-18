<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

Connection con = null;
PreparedStatement pst = null;

try {
    // Establishing connection
    con = project.ConnectionProvider.getCon();

    // Using PreparedStatement to prevent SQL Injection
    String updateQuery = "UPDATE product SET name=?, category=?, price=?, active=? WHERE id=?";
    pst = con.prepareStatement(updateQuery);
    pst.setString(1, name);
    pst.setString(2, category);
    pst.setString(3, price);
    pst.setString(4, active);
    pst.setString(5, id);

    int rowsUpdated = pst.executeUpdate();

    // If the product is updated successfully
    if (rowsUpdated > 0) {
        // If the product is inactive, remove it from the cart
        if ("No".equals(active)) {
            String deleteCartQuery = "DELETE FROM cart WHERE product_id=? AND address IS NULL";
            try (PreparedStatement deleteCartPst = con.prepareStatement(deleteCartQuery)) {
                deleteCartPst.setString(1, id);
                deleteCartPst.executeUpdate();
            }
        }

        response.sendRedirect("allProductEditProduct.jsp?msg=done");
    } else {
        response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
    }
} catch (Exception e) {
    e.printStackTrace(); // Log detailed exception for debugging
    response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
} finally {
    try {
        if (pst != null) {
            pst.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Handle exception if closing resources fails
    }
}
%>
