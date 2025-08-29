package com.gauarav.opretion;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaurav.dbcon.ConnectDB;
import com.gaurav.pojo.PLogs;

public class VolLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public VolLog() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{doGet(request, response);
	
	   
	try
	{
		
		String Vmail = request.getParameter("Vmail");
		String Vpass = request.getParameter("Vpass");
		
		
		Connection con = ConnectDB.getConnect();
		PreparedStatement ps = con.prepareStatement("select * from volenteer where Vmail=? and Vpass=?");
		ps.setString(1, Vmail);
		ps.setString(2, Vpass);
		ResultSet rs1 = ps.executeQuery();
		
		if(rs1.next())
		{
			PLogs.setVid(rs1.getInt(1));
			System.out.println("Done");
			
			

			response.sendRedirect("Volpannel.jsp");
		}
		else
		{
			response.sendRedirect("index.html");
		}
		
		
		
		
		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
		response.sendRedirect("index.html");
	}
	
	
	
	
	}

}
