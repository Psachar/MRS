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
 * Servlet implementation class ResetServlet
 */
public class ResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uid=request.getParameter("uid");
		String fname=request.getParameter("First_Name");
		String pass=request.getParameter("pass");
		String cpass=request.getParameter("Confirm_Password");
		
		Connection con=DBConnection.dbCon();
		try
		{
			Statement st=con.createStatement();
			String sql="select First_Name,User_ID from MRS_Register where First_Name='"+fname+"'&& User_ID='"+uid+"'";
			ResultSet rs=st.executeQuery(sql);
			
			String id=null;
			String name=null;
			
			while(rs.next())
			{
			id=rs.getString("User_ID");
			name=rs.getString("First_Name");
			}
			
			PrintWriter out=response.getWriter();
			
			if(uid.equals(id)&&fname.equals(name)&&pass.equals(cpass))
			{
				PreparedStatement ps=con.prepareStatement("update MRS_Register set Password='"+pass+"', Confirm_Password='"+cpass+"' where User_ID='"+uid+"'");
				int i=ps.executeUpdate();
			     
				if(i>0)
				{
					response.sendRedirect("reset.jsp?success=1");
				}
				else
				{
					response.sendRedirect("reset.jsp?info1=1");
				}
			}
			else
			{
				response.sendRedirect("reset.jsp?info2=1");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
