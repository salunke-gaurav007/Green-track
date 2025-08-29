<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.gaurav.dbcon.ConnectDB" %>
<%@ page import="com.gaurav.pojo.PLogs" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
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
                    url('https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #fff;
    }
    .container {
        width: 400px;
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        border-radius: 15px;
        padding: 30px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        border: 1px solid rgba(255,255,255,0.1);
    }
    .container h2 {
        text-align: center;
        margin-bottom: 25px;
        font-size: 28px;
        color: #4CAF50;
    }
    .form-group {
        position: relative;
        margin-bottom: 20px;
    }
    .form-group input {
        width: 100%;
        padding: 12px 15px;
        border: none;
        background: rgba(255,255,255,0.9);
        border-radius: 30px;
        font-size: 14px;
        outline: none;
        transition: all 0.3s;
    }
    .form-group input:focus {
        box-shadow: 0 0 10px rgba(76, 175, 80, 0.5);
    }
    .register-btn {
        width: 100%;
        padding: 12px;
        background: #4CAF50;
        color: white;
        border: none;
        border-radius: 30px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: all 0.3s;
        margin-top: 10px;
    }
    .register-btn:hover {
        background: #45a049;
        transform: translateY(-2px);
    }
</style>
</head>
<body>
<div class="container">
    <form action="PasswordC.jsp">
        <div>
            <h2>Change Password</h2>
            <div class="form-group">
                <input type="email" name="Cmail" placeholder="Your Email" required />
            </div>
            <div class="form-group">
                <input type="tel" name="Ccont" placeholder="Contact Number" required />
            </div>
            <div class="form-group">
                <input type="password" name="Npass" placeholder="New Password" required />
            </div>
            <button class="register-btn" type="submit">Update Password</button>
        </div>
    </form>
</div>

<% 
String Cmail = request.getParameter("Cmail");
if(Cmail != null) {
    String Ccont = request.getParameter("Ccont");
    String Npass = request.getParameter("Npass");
    
    Connection con = ConnectDB.getConnect();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM citizen where Cmail=? and Ccontact = ?");
    ps.setString(1, Cmail);
    ps.setString(2, Ccont);
    ResultSet rs = ps.executeQuery();
    
    while(rs.next()) {
        PreparedStatement ps1 = con.prepareStatement("UPDATE citizen SET Cpass = ? WHERE Cmail = ? AND Ccontact = ?");
        ps1.setString(1, Npass);     
        ps1.setString(2, Cmail); 
        ps1.setString(3, Ccont);         
        int i = ps1.executeUpdate();
        
        if(i>0) {
            response.sendRedirect("CitizenLog.html");
        } else {
            response.sendRedirect("Failed.html");
        }
    }
}
%>
</body>
</html>
