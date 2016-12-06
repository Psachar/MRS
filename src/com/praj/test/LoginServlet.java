package com.praj.test;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.praj.dao.DBConnection;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			RequestDispatcher rd = null;
			String uid=request.getParameter("uid");
			String password=request.getParameter("pass");
			String utype=request.getParameter("utype");
	        
	        
			 if(DBConnection.checkUser(uid,password))
			 {
				if(utype.equals("Donor") && !(password.contains("StaffMRS")))
				{
				HttpSession session=request.getSession();
		        session.setAttribute("uid", uid);
				rd = request.getRequestDispatcher("Donor.jsp");
	            rd.forward(request, response);	
	            }
				else if(utype.equals("Requester")&& !(password.contains("StaffMRS")))
				{
				HttpSession session=request.getSession();
			    session.setAttribute("uid", uid);
				rd = request.getRequestDispatcher("Requester.jsp");
	            rd.forward(request, response);	
	            }
				else if(utype.equals("Staff") && password.contains("StaffMRS") && uid.contains("Staff"))
				{
			    HttpSession session=request.getSession();
			    session.setAttribute("uid", uid);
				rd = request.getRequestDispatcher("Staff.jsp");
	            rd.forward(request, response);	
				}
				else
				{
					response.sendRedirect("login.jsp?info=1");
				}    
			 }
			 else
			 {
			   response.sendRedirect("login.jsp?success=1");
			 }
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	}

}
