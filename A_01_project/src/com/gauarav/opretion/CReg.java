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
 * Servlet implementation class CReg
 */
public class CReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CReg() {
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
	{doGet(request, response);
	
	
	try
	{
		
		String Cmail = request.getParameter("Cmail");

		Connection con = ConnectDB.getConnect();
		PreparedStatement ps1 = con.prepareStatement("select * from citizen where Cmail = ? ");
		ps1.setString(1, Cmail);
		ResultSet rs1 = ps1.executeQuery();

		
		if(rs1.next())
		{

			response.sendRedirect("Failed.html");
			
		}
		else
		{
		
		
		
		int Cid = 0;
		String Cname = request.getParameter("Cname");
		String Cadd = request.getParameter("Cadd");

		String Ccity = request.getParameter("Ccity");
		String Ccontact = request.getParameter("Ccontact");
		String Cpass = request.getParameter("Cpass");

		PreparedStatement ps = con.prepareStatement("insert into citizen (Cid, Cname,Cadd ,Ccity ,Ccontact, Cmail, Cpass) values (?, ?, ?, ?, ?,?,?)");
		ps.setInt(1, Cid);
		ps.setString(2, Cname);
		ps.setString(3, Cadd);
		ps.setString(4, Ccity);
		ps.setString(5, Ccontact);
		ps.setString(6, Cmail);
		ps.setString(7, Cpass);
		int i = ps.executeUpdate();
		if(i > 0)
		{

			response.sendRedirect("CitizenLog.html");
		}
		else
		{
			response.sendRedirect("index.html");
		}
		
		
		}
		
		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
		response.sendRedirect("index.html");
	}
	
	
	
	}

}
