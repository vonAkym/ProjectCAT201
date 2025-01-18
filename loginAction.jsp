<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
String email=request.getParameter("email");
String password=request.getParameter("password");

if("admin@yahoo.com".equals(email) && "admin".equals(password))
{
    System.out.println("Admin login successful, redirecting...");
	session.setAttribute("email",email);
	response.sendRedirect("admin/adminPanel.jsp");
	}

else 
{
	int z = 0;
	try
	{
		Connection con = project.ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select *from user where email='"+email+"'and password='"+password+"'");
		while(rs.next())
		{	
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("HomeTable.jsp");
		}
		
		if(z==0)
			response.sendRedirect("index.jsp?msg=notexist") ;
	}
	
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("index.jsp?msg=invalid") ;
	}
}
	
	%>