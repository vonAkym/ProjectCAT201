<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
String email = (String) session.getAttribute("email");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");



// Validate email and input parameters
if (email == null || email.isEmpty() || address == null || city == null || state == null || country == null ||
    address.isEmpty() || city.isEmpty() || state.isEmpty() || country.isEmpty()) {
    response.sendRedirect("addChangeAddress.jsp?msg=invalid");
    return;
}

Connection con = null;
PreparedStatement ps = null;

try {
    con = project.ConnectionProvider.getCon();
    ps = con.prepareStatement("UPDATE user SET address = ?, city = ?, state = ?, country = ? WHERE email = ?");
    ps.setString(1, address);
    ps.setString(2, city);
    ps.setString(3, state);
    ps.setString(4, country);
    ps.setString(5, email);
    ps.executeUpdate();

    response.sendRedirect("addChangeAddress.jsp?msg=valid");
} catch (Exception e) {
    e.printStackTrace(); // Log the exception
    response.sendRedirect("addChangeAddress.jsp?msg=invalid");
} finally {
    // Properly close resources
    try { if (ps != null) ps.close(); } catch (Exception e) { }
    try { if (con != null) con.close(); } catch (Exception e) { }
}
%>
