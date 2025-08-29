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

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		
		
		try
		{
			
			String Amail = request.getParameter("Amail");
			String Apass = request.getParameter("Apass");
			
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("select * from admin where Amail=? and Apass=?");
			ps.setString(1, Amail);
			ps.setString(2, Apass);
			ResultSet rs1 = ps.executeQuery();
			
			if(rs1.next())
			{
				System.out.println("Done");

				response.sendRedirect("AdminPannel.jsp");
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
