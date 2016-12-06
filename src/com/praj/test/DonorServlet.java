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

import com.praj.dao.ExpiryValidation;
import com.praj.dao.DBConnection;

/**
 * Servlet implementation class DonorServlet
 */
public class DonorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonorServlet() {
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
		
		String doe1=request.getParameter("Year");
		String doe2=request.getParameter("Month");
		String doe3=request.getParameter("Day");
		
		String doe=doe1+"-"+doe2+"-"+doe3;
		
		String dos=request.getParameter("dos");
		String mfname=request.getParameter("mfname");
		
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
			
			ExpiryValidation ev=new ExpiryValidation();
			long diffDays=ev.ValidateExpDate(doe);
			
		if(diffDays>30)
		{
			quantity=quantity+quant;
			PreparedStatement ps1=con.prepareStatement("update MRS_Medicine set Quantity='"+quantity+"' where Medicine_Name='"+mname+"'");
			ps1.executeUpdate();
			
			String sql="insert into MRS_Donor(Medicine_Type,Medicine_Name,Quantity,Expiry_Date,Dosage,Manufacturer_Name,User_ID)values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, mtype);
			ps.setString(2, mname);
			ps.setInt(3, quant);
			ps.setString(4, doe);
			ps.setString(5, dos);
			ps.setString(6, mfname);
			ps.setString(7, uid);
			
		    
			int i=ps.executeUpdate();
			
			
			if(i>0)
			{
				response.sendRedirect("Donor.jsp?success=1");
			}
			else
			{
				response.sendRedirect("Donor.jsp?info1=1");
			}
		 }
		else
		{
			response.sendRedirect("Donor.jsp?info2=1");
		}
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}