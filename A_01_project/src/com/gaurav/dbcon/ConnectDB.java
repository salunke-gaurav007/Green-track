package com.gaurav.dbcon;

import java.sql.*;

public class ConnectDB 
{
	static Connection con = null;
	public static Connection getConnect()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plantation","root","");
		} 
		catch (Exception e) 
		{
			System.out.println("faild to connect database");
			e.printStackTrace();
		}
		
		
		return con;
	}

}
