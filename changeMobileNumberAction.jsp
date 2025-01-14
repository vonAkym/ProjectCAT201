<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
String email = (String) session.getAttribute("email");
String mobileNumber = request.getParameter("mobileNumber");
String password = request.getParameter("password");

boolean updateSuccess = false;

try {
    Connection con = project.ConnectionProvider.getCon();
    String query = "SELECT * FROM user WHERE email = ? AND password = ?";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, email);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        String updateQuery = "UPDATE user SET mobileNumber = ? WHERE email = ?";
        PreparedStatement updatePs = con.prepareStatement(updateQuery);
        updatePs.setString(1, mobileNumber);
        updatePs.setString(2, email);
        updatePs.executeUpdate();
        updateSuccess = true;
        updatePs.close();
    }

    rs.close();
    ps.close();
    con.close();

    if (updateSuccess) {
        response.sendRedirect("changeMobileNumber.jsp?msg=done");
    } else {
        response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
    }
} catch (Exception e) {
    System.out.println("Error: " + e);
    response.sendRedirect("changeMobileNumber.jsp?msg=error");
}
%>
