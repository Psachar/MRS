<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" href="style_login.css">
 <script type="text/javascript">
function phonenumber(inputtxt)  
{  
  var phoneno = /^\d{10}$/;  
  if(inputtxt.value.match(phoneno))  
  {  
      return true;  
  }  
  else  
  {  
     alert("Not a valid Mobile Number");  
     return false;  
  }  
 } 
</script>

<%@page import="java.io.PrintWriter" %>
<%
String success=request.getParameter("success");
String uid=request.getParameter("uif");

if(success!=null){
//out.println(uid);
%>
<div class="alert3">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Registration Successful!!
  User ID:<input type="text" name="uid" value="<%=uid%>"><br><font size=3>Please note down this number,as it is required for further procedures</font>
</div>
<%}
%>
<%if ((request.getParameter("info"))!=null){ %>
<div class="alert2">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Registration failed!! Please fill all the fields correctly
</div>
<%} %>	 
	

<script src="javaScript.js" > </script>

</head>
 
<body bgcolor="#d4d4d8">

<form name="form1" action="RegistrationServlet"  method="POST">
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
				<h2>Register </h2>
			</div>
<table align="center" cellpadding = "10">
 
<!----- First Name ---------------------------------------------------------->
<tr>
<td>First Name</td>
<td><input type="text" name="First_Name" maxlength="30" required=""/>
(max 30 characters a-z and A-Z)
</td>
</tr>
 
<!----- Last Name ---------------------------------------------------------->
<tr>
<td>Last Name</td>
<td><input type="text" name="Last_Name" maxlength="30" required=""/>
(max 30 characters a-z and A-Z)
</td>
</tr>
 
<!----- Date Of Birth -------------------------------------------------------->
<tr>
<td>Date Of Birth</td>
<td>
<select name="Birthday_Year" id="Birthday_Year"  required="">
 
<option value="-1">Year:</option>
<option value="2012">2012</option>
<option value="2011">2011</option>
<option value="2010">2010</option>
<option value="2009">2009</option>
<option value="2008">2008</option>
<option value="2007">2007</option>
<option value="2006">2006</option>
<option value="2005">2005</option>
<option value="2004">2004</option>
<option value="2003">2003</option>
<option value="2002">2002</option>
<option value="2001">2001</option>
<option value="2000">2000</option>
 
<option value="1999">1999</option>
<option value="1998">1998</option>
<option value="1997">1997</option>
<option value="1996">1996</option>
<option value="1995">1995</option>
<option value="1994">1994</option>
<option value="1993">1993</option>
<option value="1992">1992</option>
<option value="1991">1991</option>
<option value="1990">1990</option>
 
<option value="1989">1989</option>
<option value="1988">1988</option>
<option value="1987">1987</option>
<option value="1986">1986</option>
<option value="1985">1985</option>
<option value="1984">1984</option>
<option value="1983">1983</option>
<option value="1982">1982</option>
<option value="1981">1981</option>
<option value="1980">1980</option>

<option value="1979">1979</option>
<option value="1978">1978</option>
<option value="1977">1977</option>
<option value="1976">1976</option>
<option value="1975">1975</option>
<option value="1974">1974</option>
<option value="1973">1973</option>
<option value="1972">1972</option>
<option value="1971">1971</option>
<option value="1970">1970</option>
 
<option value="1969">1969</option>
<option value="1968">1968</option>
<option value="1967">1967</option>
<option value="1966">1966</option>
<option value="1965">1965</option>
<option value="1964">1964</option>
<option value="1963">1963</option>
<option value="1962">1962</option>
<option value="1961">1961</option>

</select>
 
<select id="Birthday_Month" name="Birthday_Month"  required="">
<option value="-1">Month:</option>
<option value="1">Jan</option>
<option value="2">Feb</option>
<option value="3">Mar</option>
<option value="4">Apr</option>
<option value="5">May</option>
<option value="6">Jun</option>
<option value="7">Jul</option>
<option value="8">Aug</option>
<option value="9">Sep</option>
<option value="10">Oct</option>
<option value="11">Nov</option>
<option value="12">Dec</option>
</select>
 
 
 <select name="DOB" id="Birthday_Day" required="">
<option value="-1">Day:</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
 
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
 
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
 
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
 
<option value="31">31</option>

</select>
</td>

</tr> 

 
<!----- Email Id ---------------------------------------------------------->
<tr>
<td>Email ID</td>
<td><input type="email" name="Email_ID" maxlength="50"  /></td>
</tr>
 
<!----- Mobile Number ---------------------------------------------------------->
<tr>
<td>Mobile Number</td>
<td>
<input type="text" name="Mobile_Number" required="" onclick="return myfunction()"/>
(10 digit number)
</td>
</tr>
 
<!----- Gender ----------------------------------------------------------->
<tr>
<td>Gender</td>
<td>
Male <input type="radio" name="Gender" value="Male" onclick="phonenumber(document.form1.Mobile_Number)"/>
Female <input type="radio" name="Gender" value="Female" onclick="phonenumber(document.form1.Mobile_Number)"/>
</td>
</tr>

<!----- ID Proof ----------------------------------------------------------->
   <tr>
 <td>ID Proof Number</td>
 <td>
 <input type="text" name="ID_Number" id="idnum" required="" maxlength="20" />
 (Enter your ID number)
 </td>
 <tr>
 <td></td>
<td> <label for="idnum">Please carry the same ID Proof while coming to our center</label></td>
</tr>
 </tr>
 
 
<!----- Address ---------------------------------------------------------->
<tr>
<td>Address<br /><br /><br /></td>
<td><textarea name="Address" rows="6" cols="30" required="" ></textarea></td>
</tr>
 
<!----- City ---------------------------------------------------------->
<tr>
<td>City</td>
<td><input type="text" name="City" maxlength="30" />
(max 30 characters a-z and A-Z)
</td>
</tr>
 
<!----- Pin Code ---------------------------------------------------------->
<tr>
<td>Pin Code</td>
<td><input type="text" name="Pincode" maxlength="6" />
(6 digit number)
</td>
</tr>
 
<!----- State ---------------------------------------------------------->
<tr>
<td>State</td>
<td><input type="text" name="State" maxlength="30" />
(max 30 characters a-z and A-Z)
</td>
</tr>


<tr>
<td>Country</td>
<td><input type="text" name="Country" value="India" readonly="readonly" /></td>
</tr>
 
<!----- Hobbies ---------------------------------------------------------->
 



<tr>
<td>Password</td>
<td><input type="password" name="pass" maxlength="15" id="pass1" required=""/></td>
</tr>
<tr>
<td>Confirm password</td>
<td><input type="password" name="Confirm_Password" maxlength="15" id="pass2" required=""/></td>
</tr>

<!----- User ID ---------------------------------------------------------->




<!----- Submit and Reset ------------------------------------------------->


<tr>
<td colspan="2" align="center">
<input type="submit" value="Submit" />&nbsp;&nbsp;
<input type="reset" value="Reset">
</td>
</tr>
 </div>
 </div>
 
</table><br><br>
<center>Already Registered?<a href="index.jsp"><font color=#0000ff><u>Go to Home page</u></font></a></center>
</form>
 

</body>
</html>