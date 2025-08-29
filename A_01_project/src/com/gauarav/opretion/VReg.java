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
 * Servlet implementation class VReg
 */
public class VReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VReg() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		try
		{
			

			String Vmail = request.getParameter("Vmail");

			Connection con = ConnectDB.getConnect();
			PreparedStatement ps1 = con.prepareStatement("select * from volenteer where Vmail = ? ");
			ps1.setString(1, Vmail);
			ResultSet rs1 = ps1.executeQuery();

			
			if(rs1.next())
			{

				response.sendRedirect("Failed.html");
				
			}
			else
			{
			int Vid = 0;
			String Vname = request.getParameter("Vname");
			String Vcont = request.getParameter("Vcont");
			String Vpass = request.getParameter("Vpass");

			PreparedStatement ps = con.prepareStatement("insert into volenteer (Vid, Vname, Vmail, Vcont, Vpass) values (?, ?, ?, ?, ?)");
			ps.setInt(1, Vid);
			ps.setString(2, Vname);
			ps.setString(3, Vmail);
			ps.setString(4, Vcont);
			ps.setString(5, Vpass);
			int i = ps.executeUpdate();
			if(i > 0)
			{

				response.sendRedirect("Volregister.html");
			}
			else
			{
				response.sendRedirect("AdminPannel.jsp");
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
