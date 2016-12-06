package com.praj.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.praj.dao.DBConnection;

/**
 * Servlet implementation class RequesterServlet
 */
public class RequesterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequesterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid=request.getParameter("uid");
		String mtype=request.getParameter("mtype");
		String mname=request.getParameter("mname");
		int quant=Integer.parseInt(request.getParameter("quant"));
		String dos=request.getParameter("dos");
		
		PrintWriter out=response.getWriter();
		try
		{
			Connection con = DBConnection.dbCon();
			String s="select * from MRS_Medicine where Medicine_Name='"+mname+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(s);
			int quantity=0;
			
			while(rs.next())
			{
				quantity=rs.getInt("Quantity");
			}
		 if(quantity>=quant && quant<=100)
		 {	
			quantity=quantity-quant;
			PreparedStatement ps1=con.prepareStatement("update MRS_Medicine set Quantity='"+quantity+"' where Medicine_Name='"+mname+"'");
			ps1.executeUpdate();
			
			
			
			String sql="insert into MRS_Requester(Medicine_Type,Medicine_Name,Quantity,Dosage,User_ID)values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, mtype);
			ps.setString(2, mname);
			ps.setInt(3, quant);
			ps.setString(4, dos);
			ps.setString(5, uid);
			
		    
			int i=ps.executeUpdate();
			
			
			if(i>0)
			{
				response.sendRedirect("Requester.jsp?success=1");
			}
			else
			{
				response.sendRedirect("Requester.jsp?info1=1");
			}
		  }
		 else if(quantity>=quant && quant>100)
		 {
			 response.sendRedirect("Requester.jsp?info2=1");
		 }
		 else
		 {
			 
			    response.sendRedirect("Requester.jsp?info3=1");
				String s1="insert into MRS_Wishlist(Medicine_Type,Medicine_Name,Quantity,Dosage)values(?,?,?,?)";
				PreparedStatement ps1=con.prepareStatement(s1);
				
				ps1.setString(1, mtype);
				ps1.setString(2, mname);
				ps1.setInt(3, quant);
				ps1.setString(4, dos);
				
				int in=ps1.executeUpdate();  
		 }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
