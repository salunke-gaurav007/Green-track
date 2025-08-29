0<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.gaurav.dbcon.ConnectDB" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	 try
	{

				 String Cid = request.getParameter("Vid");
				 System.out.println(Cid);
				 Connection con = ConnectDB.getConnect();
				 
				 PreparedStatement ps = con.prepareStatement("delete from volenteer where Vid=?");
				 ps.setString(1,Cid);
				 
				 int i = ps.executeUpdate();
				 
				 if(i>0)
				 {
				 
			 	response.sendRedirect("V_view.jsp");
				 }
				 else
				 {
					 	response.sendRedirect("Failed.html");
				 }
			 
		 
		 
	}
	catch(Exception e)
	{
		
	}
	
	
	
	
	
	%>



</body>
</html>