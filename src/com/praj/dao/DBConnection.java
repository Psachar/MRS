package com.praj.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.praj.dao.EncryptDecrypt;



public class DBConnection {
	
	public static Connection dbCon(){
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		 
		try {
			con = DriverManager.getConnection
			               ("jdbc:mysql://localhost:3306/MRSystem","root","root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static boolean checkUser(String uid,String pass)
	{
		boolean st=false;
		try
		{
			Connection con = dbCon();
	         Statement ps = con.createStatement();
	         EncryptDecrypt ed=EncryptDecrypt.getInstance();
	         String encr=ed.encrypt(pass);
	         String sql = "select * from MRS_Register where User_ID='"+uid+"' && Password='"+encr+"'";
	         ResultSet rs=ps.executeQuery(sql);
	         Statement s1=con.createStatement();
	         String sql1="select * from MRS_Staff where User_ID='"+uid+"'&& Password='"+pass+"'";
	         ResultSet rs1=s1.executeQuery(sql1);
	         
	         String decr=ed.decrypt(encr);
	         
	        if((rs.next()&& decr.equals(pass))||rs1.next())
	         {
	        	 st=true;
	         }
	       
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return st;
	}
	

}
