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
import com.gaurav.pojo.Cinfo;
import com.gaurav.pojo.PLogs;

/**
 * Servlet implementation class Clog
 */
public class Clog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Clog() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		try
		{
			
			String Cmail = request.getParameter("Cmail");
			String Cpass = request.getParameter("Cpass");
			
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("select * from citizen where Cmail=? and Cpass=?");
			ps.setString(1, Cmail);
			ps.setString(2, Cpass);
			ResultSet rs1 = ps.executeQuery();
			
			if(rs1.next())
			{
				Cinfo.setCid(rs1.getInt(1));;
				System.out.println("Done");

				response.sendRedirect("Cpannel.jsp");
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
