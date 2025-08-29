<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password - GreenTrack</title>
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
        justify-content: center;
        align-items: center;
        padding: 20px;
        background-image: url('https://images.unsplash.com/photo-1476231682828-37e571bc172f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
    }

    .container {
        width: 100%;
        max-width: 500px;
        background-color: rgba(255, 255, 255, 0.95);
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        animation: fadeIn 0.8s ease;
        transform-style: preserve-3d;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.9); }
        to { opacity: 1; transform: scale(1); }
    }

    .logo {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 30px;
    }

    .logo img {
        height: 50px;
        margin-right: 15px;
        animation: bounce 2s infinite;
    }

    @keyframes bounce {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-10px); }
    }

    .logo-text {
        font-size: 1.8rem;
        font-weight: 700;
        color: var(--primary-green);
    }

    h2 {
        font-size: 1.8rem;
        color: var(--primary-green);
        text-align: center;
        margin-bottom: 30px;
        position: relative;
    }

    h2::after {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 4px;
        background: linear-gradient(90deg, var(--primary-green), var(--accent-green));
        border-radius: 2px;
    }

    .form-group {
        position: relative;
        margin-bottom: 25px;
    }

    .form-group input {
        width: 100%;
        padding: 15px 15px 15px 45px;
        border: 2px solid #e0e0e0;
        border-radius: 10px;
        font-size: 1rem;
        transition: var(--transition);
        outline: none;
    }

    .form-group input:focus {
        border-color: var(--accent-green);
        box-shadow: 0 0 0 3px rgba(50, 205, 50, 0.2);
    }

    .icon {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--primary-green);
        font-size: 1.1rem;
    }

    .register-btn {
        background: linear-gradient(135deg, var(--primary-green), var(--accent-green));
        color: white;
        border: none;
        padding: 15px;
        border-radius: 10px;
        font-size: 1.1rem;
        font-weight: 600;
        cursor: pointer;
        transition: var(--transition);
        width: 100%;
        margin-top: 10px;
        position: relative;
        overflow: hidden;
    }

    .register-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }

    .register-btn::after {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
        transition: 0.5s;
    }

    .register-btn:hover::after {
        left: 100%;
    }

    .strength-meter {
        height: 5px;
        background-color: #e0e0e0;
        border-radius: 5px;
        margin-top: 5px;
        overflow: hidden;
        transition: var(--transition);
    }

    .strength-meter::after {
        content: '';
        display: block;
        height: 100%;
        width: 0;
        background-color: red;
        transition: var(--transition);
    }

    input[name="Npass"]:focus ~ .strength-meter::after {
        background-color: orange;
        width: 50%;
    }

    input[name="Npass"]:valid ~ .strength-meter::after {
        background-color: var(--accent-green);
        width: 100%;
    }

    @media (max-width: 500px) {
        .container {
            padding: 30px 20px;
        }
        
        h2 {
            font-size: 1.5rem;
        }
    }
</style>
</head>
<body>

<div class="container">
    <div class="logo">
        <img src="https://cdn-icons-png.flaticon.com/512/2910/2910765.png" alt="GreenTrack Logo">
        <span class="logo-text">GreenTrack</span>
    </div>

    <form action="Password.jsp" method="post">
        <h2>Reset Password</h2>
        
        <div class="form-group">
            <input type="email" name="Vmail" placeholder="Your Email" required />
            <i class="fas fa-envelope icon"></i>
        </div>
        
        <div class="form-group">
            <input type="text" name="Vcont" placeholder="Contact number" required />
            <i class="fas fa-phone icon"></i>
        </div>
        
        <div class="form-group">
            <input type="password" name="Npass" placeholder="New Password" required />
            <i class="fas fa-lock icon"></i>
            <div class="strength-meter"></div>
        </div>
       
        <button class="register-btn" type="submit">Reset Password</button>
    </form>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Password strength indicator
        const passwordInput = document.querySelector('input[name="Npass"]');
        const strengthMeter = document.querySelector('.strength-meter');
        
        passwordInput.addEventListener('input', function() {
            const password = this.value;
            let strength = 0;
            
            if (password.length > 0) strength += 1;
            if (password.length >= 8) strength += 1;
            if (/[A-Z]/.test(password)) strength += 1;
            if (/[0-9]/.test(password)) strength += 1;
            if (/[^A-Za-z0-9]/.test(password)) strength += 1;
            
            const colors = ['red', 'orange', 'yellow', 'lightgreen', 'green'];
            strengthMeter.style.backgroundColor = colors[strength];
        });
    });
</script>

</body>
</html>