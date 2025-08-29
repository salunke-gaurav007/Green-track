<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Panel - GreenTrack</title>
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
        padding: 100px 20px;
        background-image: url('https://images.unsplash.com/photo-1476231682828-37e571bc172f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
    }

    .container {
        max-width: 1200px;
        width: 100%;
        background-color: rgba(255, 255, 255, 0.75);
        border-radius: 20px;
        padding: 40px;
        box-shadow: var(--shadow);
        position: relative;
    }

    .back-btn {
        position: absolute;
        top: 30px;
        left: 30px;
        background-color: var(--primary-green);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 50px;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 8px;
        font-weight: 500;
        transition: var(--transition);
        box-shadow: var(--shadow);
    }

    .back-btn:hover {
        background-color: var(--accent-green);
        transform: translateY(-2px);
    }

    /* Rest of your existing CSS remains the same */
    h1 {
        font-size: 2.5rem;
        color: var(--primary-green);
        margin-bottom: 40px;
        text-align: center;
        position: relative;
        padding-bottom: 15px;
    }

    h1::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 100px;
        height: 4px;
        background-color: var(--accent-green);
        border-radius: 2px;
    }

    .panel-links {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 30px;
        margin-top: 30px;
    }

    .panel-link {
        background-color: var(--white);
        color: var(--text-dark);
        border-radius: 15px;
        padding: 30px 20px;
        text-align: center;
        text-decoration: none;
        box-shadow: var(--shadow);
        transition: var(--transition);
        position: relative;
        overflow: hidden;
        opacity: 0;
        transform: translateY(30px);
        z-index: 1;
        border: 2px solid var(--primary-green);
    }

    .panel-link::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(135deg, var(--primary-green), var(--accent-green));
        z-index: -1;
        opacity: 0;
        transition: var(--transition);
    }

    .panel-link i {
        font-size: 2.5rem;
        color: var(--primary-green);
        margin-bottom: 20px;
        transition: var(--transition);
    }

    .panel-link h3 {
        margin-bottom: 10px;
        color: var(--primary-green);
        font-size: 1.25rem;
        font-weight: 600;
        transition: var(--transition);
    }

    .panel-link p {
        color: var(--text-dark);
        font-size: 0.9rem;
        opacity: 0.8;
        transition: var(--transition);
    }

    .panel-link:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        border-color: transparent;
    }

    .panel-link:hover::before {
        opacity: 1;
    }

    .panel-link:hover i,
    .panel-link:hover h3,
    .panel-link:hover p {
        color: var(--white);
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    footer {
        margin-top: 50px;
        padding: 5px;
        text-align: center;
        color: var(--white);
        width: 100%;
        border-radius: 10px;
    }

    .logo {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 20px;
    }

    .logo img {
        height: 60px;
        margin-right: 15px;
    }

    .logo-text {
        font-size: 1.8rem;
        font-weight: 700;
        color: var(--primary-green);
    }

    @media (max-width: 768px) {
        .panel-links {
            grid-template-columns: 1fr;
        }
        
        h1 {
            font-size: 2rem;
        }
        
        .container {
            padding: 20px;
        }

        .back-btn {
            top: 15px;
            left: 15px;
            padding: 8px 15px;
            font-size: 0.9rem;
        }
    }
</style>
</head>
<body>

<div class="container">
    <button class="back-btn" onclick="window.location.href='index.html'">
        <i class="fas fa-arrow-left"></i> Back to Home
    </button>
    
    <div class="logo">
        <img src="https://cdn-icons-png.flaticon.com/512/2910/2910765.png" alt="GreenTrack Logo">
        <span class="logo-text">GreenTrack</span>
    </div>
    
    <h1>Admin Dashboard</h1>

    <div class="panel-links">
        <a href="Volregister.html" class="panel-link">
            <i class="fas fa-user-plus"></i>
            <h3>Register Volunteer</h3>
            <p>Add new volunteers to the system</p>
        </a>

        <a href="V_view.jsp" class="panel-link">
            <i class="fas fa-users"></i>
            <h3>View Volunteers</h3>
            <p>Manage existing volunteers</p>
        </a>

        <a href="C_view.jsp" class="panel-link">
            <i class="fas fa-user-friends"></i>
            <h3>View Citizens</h3>
            <p>See registered citizens</p>
        </a>

        <a href="ViewAll.jsp" class="panel-link">
            <i class="fas fa-tree"></i>
            <h3>View Plantation Logs</h3>
            <p>Check all plantation activities</p>
        </a>
    </div>
</div>

<footer>
    &copy; 2025 Gaurav salunke | Tree Plantation Monitoring System
</footer>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const links = document.querySelectorAll(".panel-link");
        links.forEach((link, index) => {
            setTimeout(() => {
                link.style.animation = `fadeInUp 0.6s ease forwards`;
                link.style.animationDelay = `${index * 0.15}s`;
            }, index * 100);
        });
        
        // Add ripple effect to buttons
        links.forEach(link => {
            link.addEventListener('click', function(e) {
                let x = e.clientX - e.target.getBoundingClientRect().left;
                let y = e.clientY - e.target.getBoundingClientRect().top;
                
                let ripple = document.createElement('span');
                ripple.className = 'ripple';
                ripple.style.left = `${x}px`;
                ripple.style.top = `${y}px`;
                
                this.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 1000);
            });
        });
    });
</script>

</body>
</html>