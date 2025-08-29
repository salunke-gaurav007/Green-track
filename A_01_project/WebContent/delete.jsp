<%@ page import="java.sql.*" %>
<%@ page import="com.gaurav.dbcon.ConnectDB" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Record</title>
</head>
<body>

<%
try {
    String Pid = request.getParameter("pid");
    int P = Integer.parseInt(request.getParameter("p"));

    System.out.println(Pid);
    System.out.println(P);

    Connection con = ConnectDB.getConnect();
    PreparedStatement ps = con.prepareStatement("DELETE FROM plant_logs WHERE Pid=?");
    ps.setString(1, Pid); 

    int i = ps.executeUpdate();

    if (i > 0) {
        if (P == 1) {
            response.sendRedirect("ViewAll.jsp");
        } else {
            response.sendRedirect("PlantLog.jsp");
        }
    }

} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
