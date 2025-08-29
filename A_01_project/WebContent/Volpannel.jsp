<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Actions - GreenTrack</title>
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
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 80px 20px;
        background-image: url('https://images.unsplash.com/photo-1476231682828-37e571bc172f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
    }

    .container {
        background-color: rgba(255, 255, 255, 0.85);
        border-radius: 20px;
        padding: 40px 30px;
        max-width: 800px;
        width: 100%;
        box-shadow: var(--shadow);
        text-align: center;
        position: relative;
    }

    h1 {
        font-size: 2.2rem;
        color: var(--primary-green);
        margin-bottom: 30px;
        position: relative;
        padding-bottom: 10px;
    }

    h1::after {
        content: '';
        position: absolute;
        width: 80px;
        height: 4px;
        background-color: var(--accent-green);
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        border-radius: 2px;
    }

    .actions {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
        margin-top: 20px;
    }

    .action-link {
        background-color: var(--white);
        color: var(--primary-green);
        padding: 25px 20px;
        border-radius: 15px;
        text-decoration: none;
        font-weight: 600;
        border: 2px solid var(--primary-green);
        transition: var(--transition);
        box-shadow: var(--shadow);
        position: relative;
    }

    .action-link:hover {
        background: linear-gradient(135deg, var(--primary-green), var(--accent-green));
        color: white;
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
    }

    .action-link i {
        display: block;
        font-size: 2rem;
        margin-bottom: 10px;
        transition: var(--transition);
    }

    .action-link:hover i {
        color: white;
    }

    footer {
        margin-top: 40px;
        color: var(--white);
        text-align: center;
    }

    /* Logout Button Styles */
    .logout-btn {
        position: absolute;
        top: 20px;
        right: 20px;
        background-color: #e74c3c;
        color: white;
        border: none;
        padding: 8px 15px;
        border-radius: 5px;
        cursor: pointer;
        font-weight: 500;
        transition: var(--transition);
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .logout-btn:hover {
        background-color: #c0392b;
        transform: translateY(-2px);
    }

    @media (max-width: 600px) {
        .container {
            padding: 30px 20px;
        }

        h1 {
            font-size: 1.8rem;
        }
        
        .logout-btn {
            top: 10px;
            right: 10px;
            padding: 6px 12px;
            font-size: 0.9rem;
        }
    }
</style>
</head>
<body>

<div class="container">
    <!-- Logout Button -->
    <button class="logout-btn" onclick="window.location.href='index.html'">
        <i class="fas fa-sign-out-alt"></i> Logout
    </button>
    
    <h1>Volunteer</h1>
    <div class="actions">
        <a href="PlantLog.jsp" class="action-link">
            <i class="fas fa-seedling"></i>
            Plant Log
        </a>
        <a href="ViewS.jsp" class="action-link">
            <i class="fas fa-lightbulb"></i>
            View Suggestions
        </a>
    </div>
</div>

<footer>
    &copy; 2025 Gaurav Salunke | GreenTrack System
</footer>

</body>
</html>