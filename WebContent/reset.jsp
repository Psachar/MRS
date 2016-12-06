<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>

	


	<link rel="stylesheet" href="style_login.css">

<% if(request.getParameter("success")!=null){%>
<div class="alert3">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span>
  Your password has been successfully reset!! 
</div>
<%} %>

<%if ((request.getParameter("info1"))!=null){ %>
<div class="alert2">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Sorry!!Password reset failed.
</div>
<%} %>

<%if ((request.getParameter("info2"))!=null){ %>
<div class="alert2">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Hey!!Enter your ID and name correctly.
  </div>
<%} %>
	 	
</head>

<body>  
<form method="post" action="ResetServlet" >
	<div class="container">
	 <header>
	 <div id="strapline">
	    <div id="welcome">
	      <h3>Medicine Reusable System <span></span></h3>
	    </div>
      </div> 
	  </header>
		
		
		<div class="login-box">
			<div class="box-header">
				<h2>RESET PASSWORD HERE</h2>
			</div>
			<table align="center" cellpadding="10" >
                <thead>
                    
                </thead>
                <tbody>
                    <tr>
                    <td>User ID</td>
                    <td><input type="text" name="uid" required=""></td>
                    </tr>
                   
                    <tr>
                        <td>Registered Name</td>
                        <td><input type="text" name="First_Name" value="" required="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="text" name="pass" value="" required=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Confirm Password</td>
                        <td><input type="text" name="Confirm_Password" value="" required="" /></td>
                    </tr>
                     
                     <tr>
				<td colspan="2" align="center">
				<input type="submit" value="Update" /></br></br>
				<a href="login.jsp"><u><font color="0000ff">Go to Login page</font></u></a>
				
				</td>
					</tr>





                </tbody>
            </table>
			
			
			
			
			
			
			
			
			
			
		</div>
	</div>
	</form>
</body>
</html>
