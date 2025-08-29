<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.gaurav.dbcon.ConnectDB" %>
<%@ page import="com.gaurav.pojo.PLogs" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Plantation Logs - GreenTrack</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
    :root {
        --primary-green: #228B22;
        --accent-green: #32CD32;
        --light-green: #E8F5E9;
        --white: #FFFFFF;
        --text-dark: #333333;
        --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        --transition: all 0.3s ease;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    body {
        background-color: var(--light-green);
        color: var(--text-dark);
        min-height: 100vh;
        padding: 40px 20px;
        background-image: url('https://images.unsplash.com/photo-1425913397330-cf8af2ff40a1?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
    background-position: center;
    background-attachment: fixed;


    color: var(--text-dark);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 100px;
    }

    .container {
        max-width: 1200px;
        width: 100%;
        margin: 0 auto;
        background-color: rgba(255, 255, 255, 0.65);
        border-radius: 20px;
        padding: 40px;
        box-shadow: var(--shadow);
    }

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        flex-wrap: wrap;
    }

    .title {
        font-size: 2rem;
        color: var(--primary-green);
        position: relative;
        padding-bottom: 10px;
    }

    .title::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 80px;
        height: 4px;
        background-color: var(--accent-green);
        border-radius: 2px;
    }

    .back-btn {
        background-color: var(--primary-green);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: var(--transition);
        text-decoration: none;
        display: inline-flex;
        align-items: center;
    }

    .back-btn:hover {
        background-color: var(--accent-green);
        transform: translateY(-2px);
    }

    .back-btn i {
        margin-right: 8px;
    }

    .table-wrapper {
        width: 100%;
        overflow-x: auto;
        margin-top: 20px;
        border-radius: 10px;
        box-shadow: var(--shadow);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: var(--white);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #e0e0e0;
    }

    th {
        background-color: var(--primary-green);
        color: white;
        font-weight: 500;
        text-transform: uppercase;
        font-size: 0.8rem;
        letter-spacing: 1px;
    }

    tr:nth-child(even) {
        background-color: #f5f5f5;
    }

    tr:hover {
        background-color: #e8f5e9;
    }

    .red-text {
        color: #e74c3c;
        text-decoration: none;
        font-weight: 500;
        transition: var(--transition);
        display: inline-block;
        padding: 5px 10px;
        border-radius: 5px;
    }

    .red-text:hover {
        background-color: #e74c3c;
        color: white;
        transform: scale(1.05);
    }

    .action-cell {
        display: flex;
        justify-content: center;
    }

    .stats-card {
        background-color: var(--white);
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 30px;
        box-shadow: var(--shadow);
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
    }

    .stat-item {
        text-align: center;
        padding: 15px;
    }

    .stat-number {
        font-size: 2rem;
        font-weight: 700;
        color: var(--primary-green);
        margin-bottom: 5px;
    }

    .stat-label {
        font-size: 0.9rem;
        color: var(--text-dark);
        opacity: 0.8;
    }

    .tree-icon {
        color: var(--primary-green);
        margin-right: 8px;
    }

    @media (max-width: 768px) {
        .header {
            flex-direction: column;
            align-items: flex-start;
        }
        
        .back-btn {
            margin-top: 15px;
        }
        
        th, td {
            padding: 10px 5px;
            font-size: 0.8rem;
        }
    }
</style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1 class="title">Plantation Logs</h1>
        <a href="AdminPannel.jsp" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>

    <div class="stats-card">
        <div class="stat-item">
            <div class="stat-number" id="total-plantations">0</div>
            <div class="stat-label">Total Plantations</div>
        </div>
        <div class="stat-item">
            <div class="stat-number" id="trees-planted">0</div>
            <div class="stat-label">Trees Planted</div>
        </div>
        <div class="stat-item">
            <div class="stat-number" id="this-month">0</div>
            <div class="stat-label">This Month</div>
        </div>
    </div>

    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name of Tree</th>
                    <th>Place</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        int Vid = PLogs.getVid();
                        Connection con = ConnectDB.getConnect();
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM plant_logs");
                        ResultSet rs = ps.executeQuery();
                %>
                <%
                        while (rs.next()) {
                %>
                        <tr>
                            <td><%= rs.getString(1) %></td>
                            <td><i class="fas fa-tree tree-icon"></i><%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td class="action-cell"><a href="delete.jsp?pid=<%= rs.getInt(1)%>&p=1" class="red-text"><i class="fas fa-trash-alt"></i> Delete</a></td>
                        </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.sendRedirect("Failed.html");
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Count number of plantations for stats
        const rows = document.querySelectorAll('tbody tr');
        document.getElementById('total-plantations').textContent = rows.length;
        document.getElementById('trees-planted').textContent = rows.length ; // Assuming 10 trees per plantation
        document.getElementById('this-month').textContent = Math.floor(rows.length * 0.25); // Example calculation
        
        // Animate stats numbers
        const stats = document.querySelectorAll('.stat-number');
        stats.forEach(stat => {
            const target = parseInt(stat.textContent);
            let current = 0;
            const increment = target / 20;
            
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    clearInterval(timer);
                    stat.textContent = target;
                } else {
                    stat.textContent = Math.floor(current);
                }
            }, 50);
        });
        
        // Add animation to table rows
        const tableRows = document.querySelectorAll('tbody tr');
        tableRows.forEach((row, index) => {
            row.style.opacity = '0';
            row.style.transform = 'translateX(-20px)';
            row.style.transition = 'all 0.4s ease';
            
            setTimeout(() => {
                row.style.opacity = '1';
                row.style.transform = 'translateX(0)';
            }, index * 100);
        });
    });
</script>

</body>
</html>