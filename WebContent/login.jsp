<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>

<%String success=request.getParameter("success");%>
	    

	<title>welcome</title>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>


	<link rel="stylesheet" href="style_login.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<%if((request.getParameter("info"))!=null)
{%>
 <div class="alert1">
  <span class="closebtn1" onclick="this.parentElement.style.display='none';">&times;</span> 
  Select appropriate user type!!
</div>
<%} %>


<%if (success!=null){ %>
<div class="alert2">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Invalid User ID or Password!!
</div>
<%} %>
<body>
<form method="post" action="LoginServlet">
	<div class="container">
	 <header>
	 <div id="strapline">
	    <div id="welcome">
	      <h3>Medicine Reusable System <span></span></h3>
	    </div>
      </div> 
	  </header>
			
		
		<div class="login-box1">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
			<label for="User_ID">User_ID</label>
			<br/>
			<input type="text" id="User_ID" name="uid" >
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password" name="pass">
			<br/>
			<br/>
			User Type:
			<input type="radio" name="utype" value="Donor" required=""><b>Donor</b>
			
			<input type="radio" name="utype" value="Requester" required=""><b>Requester</b>
			
			<input type="radio" name="utype" value="Staff" required=""><b>Staff</b>
			<br/>
			<br/>
			<button type="submit" >Login</button>
			<br/>
			<br/>
			<a href="reset.jsp">Forgot your password?</a>
		</div>
	</div>
	</form>
</body>
</html>
