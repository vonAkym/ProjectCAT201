<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>


<%   

String email = (session.getAttribute("email") != null) ? session.getAttribute("email").toString() : null;
String product_id = request.getParameter("id");

try{
	Connection con = project.ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
	response.sendRedirect("myCart1.jsp?msg.removed");
	
	
}



catch(Exception e){}

%>