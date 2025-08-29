<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.gaurav.dbcon.ConnectDB" %>
<%@ page import="com.gaurav.pojo.Cinfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GreenTrack - Suggestions</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-image: url('https://images.unsplash.com/photo-1476231682828-37e571bc172f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        color: #333;
    }
    
    .container {
        width: 80%;
        margin: 30px auto;
        background-color: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    }
    
    h1 {
        text-align: center;
        color: #2e7d32;
        margin-bottom: 30px;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    
    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #4CAF50;
        color: white;
    }
    
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
    tr:hover {
        background-color: #e8f5e9;
    }
    
    a {
        color: #e53935;
        text-decoration: none;
        font-weight: bold;
    }
    
    a:hover {
        text-decoration: underline;
    }
    
    /* Enhanced Header Styles */
    header {
        background: linear-gradient(135deg, #2e7d32 0%, #4CAF50 100%);
        color: white;
        padding: 0.8rem 2rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        position: sticky;
        top: 0;
        z-index: 1000;
    }
    
    .logo {
        font-size: 1.8rem;
        font-weight: bold;
        color: white;
        display: flex;
        align-items: center;
    }
    
    
    nav {
        display: flex;
        gap: 1.5rem;
    }
    
    nav a {
        color: white;
        text-decoration: none;
        font-weight: 500;
        padding: 0.5rem 1rem;
        border-radius: 4px;
        transition: all 0.3s ease;
        position: relative;
    }
    
    nav a:hover {
        background-color: rgba(255, 255, 255, 0.2);
    }
    
    nav a:after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        bottom: 0;
        left: 0;
        background-color: white;
        transition: width 0.3s ease;
    }
    
    nav a:hover:after {
        width: 100%;
    }
    
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        padding: 15px;
        background-color: rgba(76, 175, 80, 0.9);
        border-radius: 8px;
        color: white;
    }
    
    .header h2 {
        margin: 0;
        font-size: 1.5rem;
    }
</style>
</head>
<body>
<header>
    <div >GreenTrack</div>
    <nav>
        <a href="Volpannel.jsp">Dashboard</a>
        <a href="PlantLog.jsp">Plantation Log</a>
        <a href="volenteerLog.html">Logout</a>
    </nav>
</header>

<div class="container">
    <div class="header">
        <div > Tree Plantation Suggestions</div>
    </div>

<% 
      try {
        Connection con = ConnectDB.getConnect();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM suggetion");
        
        ResultSet rs1 = ps.executeQuery();
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
          while (rs1.next()) {
        %>
        <tr>
          <td><%= rs1.getInt(1) %></td>
          <td><%= rs1.getString(3) %></td>
          <td><%= rs1.getString(4) %></td>
          <td><%= rs1.getString(5) %></td>
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
</div>

</body>
</html>