package com.gauarav.opretion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaurav.dbcon.ConnectDB;
import com.gaurav.pojo.Cinfo;

/**
 * Servlet implementation class Suggest
 */
public class Suggest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Suggest() {
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
			
			int Sid = 0;
			int Cid = Cinfo.getCid();
			String Location = request.getParameter("Location");

			String Describ = request.getParameter("Describ");
			String Date = request.getParameter("Date");

			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("insert into suggetion (Sid, Cid,Location ,Describ ,Date) values (?, ?, ?, ?, ?)");
			ps.setInt(1, Sid);
			ps.setInt(2, Cid);
			ps.setString(3, Location);
			ps.setString(4, Describ);
			ps.setString(5, Date);
			int i = ps.executeUpdate();
			if(i > 0)
			{

				response.sendRedirect("Suggestion.html");
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
