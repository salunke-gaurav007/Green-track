<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Citizen Panel</title>
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
                    url('https://images.unsplash.com/photo-1470004914212-05527e49370b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        min-height: 100vh;
        color: #fff;
    }
    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 40px 20px;
    }
    .panel-header {
        text-align: center;
        margin-bottom: 40px;
        position: relative;
    }
    .panel-header h1 {
        font-size: 36px;
        color: #4CAF50;
        margin-bottom: 10px;
    }
    .logout-btn {
        position: absolute;
        top: 0;
        right: 0;
        padding: 8px 20px;
        background: #f44336;
        color: white;
        border: none;
        border-radius: 30px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 500;
        transition: all 0.3s;
        display: flex;
        align-items: center;
        gap: 5px;
    }
    .logout-btn:hover {
        background: #d32f2f;
        transform: translateY(-2px);
    }
    .panel-options {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 30px;
    }
    .option-card {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        border-radius: 15px;
        padding: 30px;
        width: 300px;
        text-align: center;
        transition: all 0.3s;
        border: 1px solid rgba(255,255,255,0.1);
        cursor: pointer;
    }
    .option-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0,0,0,0.3);
    }
    .option-card a {
        text-decoration: none;
        color: #fff;
        font-size: 18px;
        font-weight: 500;
        display: block;
    }
    .option-card i {
        font-size: 50px;
        margin-bottom: 20px;
        color: #4CAF50;
    }
    .option-card p {
        margin-top: 15px;
        font-size: 14px;
        opacity: 0.8;
    }
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<div class="container">
    <div class="panel-header">
        <h1>Citizen Dashboard</h1>
        <p>Welcome to your community service portal</p>
        <button class="logout-btn" onclick="window.location.href='index.html'">
            <i class="fas fa-sign-out-alt"></i> Logout
        </button>
    </div>
    
    <div class="panel-options">
        <div class="option-card">
            <i class="fas fa-tree"></i>
            <a href="ViewFCity.jsp">View Plantation Activities</a>
            <p>Check upcoming and past plantation events in your city</p>
        </div>
        
        <div class="option-card">
            <i class="fas fa-lightbulb"></i>
            <a href="Suggestion.html">Suggest New Locations</a>
            <p>Recommend areas that need green cover improvement</p>
        </div>
    </div>
</div>
</body>
</html>