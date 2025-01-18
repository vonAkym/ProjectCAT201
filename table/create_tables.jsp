<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
try 
{
    Connection con = project.ConnectionProvider.getCon();
    Statement st = con.createStatement();
    String q1 = "CREATE TABLE user ("
                + "name VARCHAR(100),"
                + "email VARCHAR(100) PRIMARY KEY,"
                + "mobileNumber BIGINT,"
                + "securityQuestion VARCHAR(200),"
                + "answer VARCHAR(200),"
                + "password VARCHAR(100),"
                + "address VARCHAR(500),"
                + "city VARCHAR(100),"
                + "state VARCHAR(100),"
                + "country VARCHAR(100)"
                + ")";
    String q2="create table product(id int, name varchar(500), category varchar(200),price int, active varchar(10))";
    String q3="create table cart(email varchar(100),product_id int, quantity int, price int, total int, address varchar(500), city varchar(100), state varchar(100), country varchar(100), mobileNumber bigint, orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transactionId varchar(100), status varchar(10))";
	String q4 = "create table message(id int AUTO_INCREMENT, email varchar(100), subject varchar(200), body varchar(1000), PRIMARY KEY(id))" ; 
	 String alterTableQuery = "ALTER TABLE product ADD COLUMN picture BLOB";
	 
    //System.out.println(q1);
   // System.out.println(q2);
    //System.out.println(q3);
    System.out.println(q4) ; 


    //st.execute(q1); 
    //st.execute(q2);
    //st.execute(q3);
    //st.execute(q4);
    st.execute(alterTableQuery);

    System.out.println("Column 'picture' added to the product table");
    con.close();
}
catch(Exception e)
{
    e.printStackTrace(); // Print the exception for debugging
}
%>
