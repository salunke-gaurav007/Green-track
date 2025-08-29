<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.gaurav.dbcon.ConnectDB" %>
<%@ page import="com.gaurav.pojo.PLogs" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Plantation Activities</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }
    body {
        background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), 
                    url('https://images.unsplash.com/photo-1465146344425-f00d5f5c8f07?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        min-height: 100vh;
        color: #fff;
        padding: 40px 20px;
    }
    .container {
        max-width: 1200px;
        margin: 0 auto;
    }
    .header {
        text-align: center;
        margin-bottom: 40px;
    }
    .header h1 {
        font-size: 36px;
        color: #4CAF50;
        margin-bottom: 10px;
    }
    .table-wrapper {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        border-radius: 15px;
        padding: 30px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        border: 1px solid rgba(255,255,255,0.1);
        overflow-x: auto;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 25px 0;
    }
    thead tr {
        background-color: #4CAF50;
        color: #fff;
        text-align: left;
    }
    th, td {
        padding: 12px 15px;
    }
    tbody tr {
        border-bottom: 1px solid rgba(255,255,255,0.1);
        transition: all 0.3s;
    }
    tbody tr:nth-of-type(even) {
        background-color: rgba(255,255,255,0.05);
    }
    tbody tr:last-of-type {
        border-bottom: 2px solid #4CAF50;
    }
    tbody tr:hover {
        background-color: rgba(76, 175, 80, 0.2);
    }
    .back-btn {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background: #4CAF50;
        color: white;
        border: none;
        border-radius: 30px;
        cursor: pointer;
        font-size: 16px;
        text-decoration: none;
        transition: all 0.3s;
    }
    .back-btn:hover {
        background: #45a049;
        transform: translateY(-2px);
    }
</style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Plantation Activities</h1>
        <p>Upcoming and past plantation events in your city</p>
    </div>
    
    <div class="table-wrapper">
        <%
        try {
            int Vid = PLogs.getVid();
            Connection con = ConnectDB.getConnect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM plant_logs");
            ResultSet rs = ps.executeQuery();
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name of Tree</th>
                    <th>Place</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <%
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Failed.html");
        }
        %>
        <a href="Cpannel.jsp" class="back-btn">Back to Dashboard</a>
    </div>
</div>
</body>
</html>