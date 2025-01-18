<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="changeDetailsHeader.jsp" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Details</title>
    <style>
        body {
    font-family: "Montserrat", sans-serif;
    margin: 0;
    padding: 0;
    height: 100vh; /* Ensure body takes the full height of the viewport */
    display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
    background: url(img/1351412.png);
    
}

.container {
    width: 80%;
    max-width: 800px;
    background-color: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    text-align: center; /* Center-align text/content inside */
}


        h3 {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 10px;
        }

        .info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .info h3 {
            font-weight: 500;
            color: #555;
        }

        hr {
            width: 100%;
            border: 0;
            border-top: 1px solid #ddd;
            margin: 10px 0;
        }

        .section-header {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }

        .content {
            padding: 20px;
            background-color: #f8f8f8;
            border-radius: 5px;
        }

        .footer {
            text-align: center;
            padding: 10px;
            font-size: 0.9rem;
            color: #888;
            background-color: #fff;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="section-header">
        <h2>Change Your Details</h2>
    </div>

    <div class="content">
        <%
        try {
            Connection con = project.ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM user WHERE email='" + email + "'");
            while (rs.next()) {
        %>

        <div class="info">
            <div class="label"><h3>Name:</h3></div>
            <div class="value"><h3><%= rs.getString(1) %></h3></div>
        </div>
        <hr>

        <div class="info">
            <div class="label"><h3>Email:</h3></div>
            <div class="value"><h3><%= rs.getString(2) %></h3></div>
        </div>
        <hr>

        <div class="info">
            <div class="label"><h3>Mobile Number:</h3></div>
            <div class="value"><h3><%= rs.getString(3) %></h3></div>
        </div>
        <hr>

        <div class="info">
            <div class="label"><h3>Security Question:</h3></div>
            <div class="value"><h3><%= rs.getString(4) %></h3></div>
        </div>

        <%
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        %>
    </div>
</div>



</body>
</html>
