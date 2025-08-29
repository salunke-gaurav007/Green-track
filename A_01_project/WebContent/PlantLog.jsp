<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.gaurav.dbcon.ConnectDB" %>
<%@ page import="com.gaurav.pojo.PLogs" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Plantation Log</title>
<style>
    :root {
        --primary-color: #4CAF50;
        --secondary-color: #45a049;
        --accent-color: #2E7D32;
        --light-color: #f8f9fa;
        --dark-color: #343a40;
        --card-bg: rgba(255, 255, 255, 0.9);
    }
    
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        background-color: #f5f5f5;
        min-height: 100vh;
        background-image: url('https://images.unsplash.com/photo-1466692476868-aef1dfb1e735?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
    }
    
    body::before {
        content: '';
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
        z-index: -1;
    }
    
    header {
        background-color: rgba(76, 175, 80, 0.9);
        color: white;
        padding: 1rem 2rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    
    .logo {
        font-size: 1.5rem;
        font-weight: bold;
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
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    
    nav a:hover {
        background-color: var(--secondary-color);
    }
    
    .container {
        max-width: 1000px;
        margin: 2rem auto;
        padding: 0 2rem;
    }
    
    .form-container {
        background-color: var(--card-bg);
        border-radius: 10px;
        padding: 2rem;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        margin-bottom: 2rem;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
        backdrop-filter: blur(5px);
        border: 1px solid rgba(255,255,255,0.2);
    }
    
    h2 {
        color: var(--primary-color);
        margin-bottom: 1.5rem;
        text-align: center;
    }
    
    .input-group {
        margin-bottom: 1.5rem;
    }
    
    .input-group label {
        display: block;
        margin-bottom: 0.5rem;
        color: #555;
        font-weight: 500;
    }
    
    .input-group input, 
    .input-group select {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 1rem;
        transition: all 0.3s;
        background-color: rgba(255,255,255,0.8);
    }
    
    .input-group input:focus, 
    .input-group select:focus {
        border-color: var(--primary-color);
        outline: none;
        box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
        background-color: white;
    }
    
    .login-button {
        width: 100%;
        padding: 12px;
        background-color: var(--primary-color);
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
    }
    
    .login-button:hover {
        background-color: var(--secondary-color);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .toggle-btn {
        display: block;
        width: 200px;
        margin: 1rem auto 2rem;
        padding: 12px;
        background-color: var(--accent-color);
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
    }
    
    .toggle-btn:hover {
        background-color: #1B5E20;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .table-container {
        background-color: var(--card-bg);
        border-radius: 10px;
        padding: 2rem;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        overflow-x: auto;
        backdrop-filter: blur(5px);
        border: 1px solid rgba(255,255,255,0.2);
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
    }
    
    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid rgba(0,0,0,0.1);
    }
    
    th {
        background-color: var(--primary-color);
        color: white;
    }
    
    tr:hover {
        background-color: rgba(0,0,0,0.03);
    }
    
    .action-link {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 500;
        transition: all 0.2s;
    }
    
    .action-link:hover {
        text-decoration: underline;
        color: var(--accent-color);
    }
    
    .red-text {
        color: #e53935;
    }
    
    footer {
        background-color: rgba(52, 58, 64, 0.9);
        color: white;
        text-align: center;
        padding: 1.5rem;
        margin-top: 2rem;
    }
    
    /* Animation for form container */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    .form-container {
        animation: fadeInUp 0.5s ease-out;
    }
</style>
</head>
<body>
    <header>
        <div class="logo">Green Track</div>
        <nav>
            <a href="Volpannel.jsp">Dashboard</a>
            <a href="ViewS.jsp">View Suggestions</a>
            <a href="volenteerLog.html">Logout</a>
        </nav>
    </header>
    
    <div class="container">
        <div class="form-container">
            <form action="PlantLog.jsp" method="post">
                <h2>Plantation Information</h2>
                <div class="input-group">
                    <label for="TreeType">Name of Tree</label>
                    <input type="text" id="TreeType" name="TreeType" placeholder="e.g., Oak, Maple, Pine" required>
                </div>
                <div class="input-group">
                    <label for="Location">Location</label>
                    <input type="text" id="Location" name="Location" placeholder="Planting location" required>
                </div>
                <div class="input-group">
                    <label for="Date">Planting Date</label>
                    <input type="date" id="Date" name="Date" required>
                </div>
                <button class="login-button" type="Submit">Submit Record</button>
            </form>
        </div>
        
        <button class="toggle-btn" onclick="showNext()">View Your Plantation Records</button>
        
        <div id="nextInfo" style="display: none;">
            <div class="table-container">
                <h2>Your Plantation History</h2>
                <%
                try {
                    int Vid = PLogs.getVid();
                    Connection con = ConnectDB.getConnect();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM plant_logs where Vid = ? ORDER BY Date DESC");
                    ps.setInt(1,Vid);
                    ResultSet rs = ps.executeQuery();
                %>
                <table>
                    <thead>
                        <tr>
                            <th>Name of Tree</th>
                            <th>Location</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("TreeType") %></td>
                            <td><%= rs.getString("Location") %></td>
                            <td><%= rs.getString("Date") %></td>
                            <td><a href="delete.jsp?pid=<%= rs.getInt("Pid")%>&p=2" class="action-link red-text">Delete</a></td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
                <%
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </div>
        </div>
    </div>
    
    <footer>
        &copy; 2025 Gaurav || All rights reserved.
    </footer>
    
    <script>
        function showNext() {
            const infoSection = document.getElementById("nextInfo");
            const button = document.querySelector(".toggle-btn");
            
            if (infoSection.style.display === "none") {
                infoSection.style.display = "block";
                button.textContent = "Hide Records";
                // Smooth scroll to the table
                infoSection.scrollIntoView({ behavior: 'smooth' });
            } else {
                infoSection.style.display = "none";
                button.textContent = "View Your Plantation Records";
            }
        }
        
        // Add animation when the page loads
        document.addEventListener('DOMContentLoaded', function() {
            const formContainer = document.querySelector('.form-container');
            formContainer.style.opacity = 0;
            formContainer.style.transform = 'translateY(20px)';
            
            setTimeout(() => {
                formContainer.style.transition = 'opacity 0.5s ease-out, transform 0.5s ease-out';
                formContainer.style.opacity = 1;
                formContainer.style.transform = 'translateY(0)';
            }, 100);
        });
    </script>
    
    <%
    try {
        String TreeType = request.getParameter("TreeType");
        
        if(TreeType != null )
        {
            int Pid = 0;
            int Vid = PLogs.getVid();
            String Location = request.getParameter("Location");
            String Date = request.getParameter("Date");
            
            Connection con = ConnectDB.getConnect();
            PreparedStatement ps = con.prepareStatement("INSERT INTO plant_logs (Pid, Vid, TreeType, Location, Date) VALUES (?, ?, ?, ?, ?)");
            ps.setInt(1, Pid);
            ps.setInt(2, Vid);
            ps.setString(3, TreeType);
            ps.setString(4, Location);
            ps.setString(5, Date); 
            int i = ps.executeUpdate();
            
            
        }
    }
    catch(Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error adding record: " + e.getMessage() + "');</script>");
    }
    %>
</body>
</html>