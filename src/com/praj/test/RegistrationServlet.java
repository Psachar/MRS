package com.praj.test;

import java.io.IOException;



import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.praj.dao.AgeCalculator;
import com.praj.dao.EncryptDecrypt;
import com.praj.dao.RegistrValidate;
import com.praj.dao.DBConnection;
import com.praj.dao.Rand;

/**
 * Servlet implementation class RegistrationServlet
 */
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	
    	try
    	{
		String fname=request.getParameter("First_Name");
		String lname=request.getParameter("Last_Name");
		
		String dob1=request.getParameter("Birthday_Year");
		String dob2=request.getParameter("Birthday_Month");
		String dob3=request.getParameter("DOB");
		String dob=dob1+dob2+dob3;
		
		int Byear=Integer.parseInt(dob1);
		
		int age=AgeCalculator.calculateAge(Byear);
		
		String email_id=request.getParameter("Email_ID");
		String contact=request.getParameter("Mobile_Number");
		String gender=request.getParameter("Gender");
		String address=request.getParameter("Address");
		String city=request.getParameter("City");
		int pin=Integer.parseInt(request.getParameter("Pincode"));
		String state=request.getParameter("State");
		String country=request.getParameter("Country");
		String pass=request.getParameter("pass");
		String cpass=request.getParameter("Confirm_Password");
		//String uid=request.getParameter("uid");  
	    
		String idnum=request.getParameter("ID_Number");
		
		EncryptDecrypt ed=EncryptDecrypt.getInstance();
		String encr1=ed.encrypt(pass);
		String encr2=ed.encrypt(cpass);
		
        Rand r=new Rand();
       String uid=r.RandNo();
		
		RegistrValidate rv=new RegistrValidate();
		

		
		PrintWriter out=response.getWriter();
	    
		
		
		Connection con=DBConnection.dbCon();
		if(rv.CheckCt(contact) && rv.CheckName(fname, lname) && rv.CheckEmail(email_id) && pass.equals(cpass))
		{
		PreparedStatement ps=con.prepareStatement("insert into MRS_Register(First_Name,Last_Name,DOB,Age,Email_ID,Mobile_Number,Gender,Address,City,Pincode,State,Country,Password,Confirm_Password,User_ID,idnum)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");		ps.setString(1,fname);
		ps.setString(2,lname);
		ps.setString(3,dob);
		ps.setInt(4,age);
		ps.setString(5,email_id);
		ps.setString(6,contact);
		ps.setString(7,gender);
		ps.setString(8,address);
		ps.setString(9,city);
		ps.setInt(10,pin);
		ps.setString(11,state);
		ps.setString(12,country);
		ps.setString(13,encr1);
		ps.setString(14,encr2);
		ps.setString(15,uid);
		ps.setString(16,idnum);
		int in=ps.executeUpdate();
		  if(in>0)
		  {
			response.sendRedirect("register.jsp?success=1&uif="+uid);
			//RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			//rd.forward(request, response);
		    //out.println("Your user id is"+uid);//
		  }
		  else
		  {
			  response.sendRedirect("register.jsp?info=1");   
		  
		  }
		}
		 else
		 {
			 response.sendRedirect("register.jsp?info=1"); 
         }
			  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
