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
 * Servlet implementation class AllotServlet
 */
public class AllotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllotServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
/*public void test()
{
	
}
*/	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			String uid=request.getParameter("uid");
			String mtype=request.getParameter("mtype");
			String mname=request.getParameter("mname");
			int quant=Integer.parseInt(request.getParameter("quant"));
			String dos=request.getParameter("dos");
			String cfname=request.getParameter("Cfname");
			String clname=request.getParameter("Clname");
			String rel=request.getParameter("Relationship");
			String phno=request.getParameter("PhNo");
			String Idnum=request.getParameter("idnum");
			
			PrintWriter out=response.getWriter();
			
			
			Connection con = DBConnection.dbCon();
			
			String s="insert into MRS_Allotment(Medicine_Type,Medicine_Name,quantity,Dosage,User_ID,First_Name,Last_Name,Relation,PhoneNo,Idnum)values(?,?,?,?,?,?,?,?,?,?)";
			String s1="select * from MRS_Register where User_ID='"+uid+"'";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, mtype);
			ps.setString(2, mname);
			ps.setInt(3, quant);
			ps.setString(4, dos);
			ps.setString(5, uid);
			ps.setString(6, cfname);
			ps.setString(7, clname);
			ps.setString(8, rel);
			ps.setString(9, phno);
			ps.setString(10, Idnum);
			
			int i=ps.executeUpdate();
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(s1);
			String idnum=null;
			while(rs.next())
			{
				idnum=rs.getString("idnum");
			}
			
			if(i>0 && Idnum.equals(idnum))
			{
				String s2="delete from MRS_Requester where User_ID='"+uid+"'";
				Statement st1=con.createStatement();
				int i1=st1.executeUpdate(s2);
				if(i1>0)
				{
				response.sendRedirect("Staff.jsp?success=1");
				}
			}
			else
			{
				response.sendRedirect("Staff.jsp?info=1");

			}
    	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
