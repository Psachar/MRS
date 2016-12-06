<!DOCTYPE html>
<html>
<%@page import="javax.servlet.http.HttpSession"%>  
<% HttpSession s1=request.getSession();
   String uid=(String)s1.getAttribute("uid");
   if(uid!=null){%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome Staff</title>
<link rel="stylesheet" href="style_login.css">
<style>

input[name="search1"]:focus {
font-family:Arial, Helvetica, sans-serif;
    width: 40%;
    margin-bottom: 0px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 2px;
	font-size: .9em;
	color: #888;

}
input[name="submit2"] {
    width:auto;
}
input[name="submit2"] {
    width:auto;
}
.login-box input {
	margin-bottom: 0px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 2px;
	font-size: .9em;
	color: #888;
}

a:link, a:visited {
    background-color: #428bca;
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    position:fixed;
    right:30px;
    top:190px;
}


a:hover, a:active {
    background-color:#428bca;
}


</style>

<%if(request.getParameter("success")!=null){%>
<div class="alert3">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span>
  Medicine has been delivered successfully!! 
</div>
<%} %>

<%if(request.getParameter("info")!=null){ %>
<div class="alert2">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Sorry!!Allotment failed.Check all the details carefully
</div>
<%} %>

</head>
<body>
<div class="container">
	 <header>
	 <div id="strapline">
	    <div id="welcome">
	      <h3>Medicine Reusable System <span></span></h3>
	    </div>
      </div> 
	  </header> </br></br>

<form name="form1" action="Staff.jsp" method="post">
<center>

  <input type="text" name="search1" placeholder="Search by ID..">  
  <input type="submit" value="Search"/>
  	
  
 </form> 
</center>
<%if(request.getParameter("search1")!=null) {%>


<%@page import="java.sql.*" %>
<%@page import="com.praj.dao.DBConnection" %>

<% 	try
	{
		Connection Con= DBConnection.dbCon();
		Statement s=Con.createStatement();
		uid=request.getParameter("search1");
		String sql="select * from MRS_Requester where User_ID='"+uid+"'";
		ResultSet rs=s.executeQuery(sql);
		if(rs.next())
		{
%>


<div class="login-box">
			<div class="box-header">
				<h2>Search Results</h2>
			</div>
<form name="form2" action="AllotServlet" method="post">
  <table align="center" cellpadding="10" >
                
                <tbody>
			
                   
                    <td><input type="hidden" name="uid" value="<%=uid%>"></td>
                   
                  
					 <tr>
                        <td>Medicine Type</td>
                        <td><input type="text" name="mtype" value="<%=rs.getString("Medicine_Type") %>" required=""/></td>
                    </tr>
                    <tr>
                        <td>Medicine Name</td>
                        <td><input type="text" name="mname" value="<%=rs.getString("Medicine_Name") %>" required="" /></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="text" name="quant" value="<%=rs.getInt("Quantity") %>" required="" /></td>
                    </tr>
                    
                    <tr>
                        <td>Dosage</td>
                        <td><input type="text" name="dos" value="<%=rs.getString("Dosage")%>" required="" /></td>
                    </tr>
					 <tr>
                        <td>Collector FirstName</td>
                        <td><input type="text" name="Cfname" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Collector LastName</td>
                        <td><input type="text" name="Clname" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>ID Number</td>
                        <td><input type="text" name="idnum" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Relationship with Requester </td>
                        <td><input type="text" name="Relationship" value="" required=""/></td>
                    </tr>
					<tr>
                        <td>Phone number</td>
                        <td><input type="text" name="PhNo" value="" required="" /></td>
                    </tr>
                     
                    <tr>
                        <td colspan="2" align="center">
                        <input type="submit" name="submit1" value="Allot"/>&nbsp;&nbsp;
                        <input type="reset" name="submit2"  value="Cancel" />
                        </td>
                    </tr>
                    
                    
                </tbody>
            </table>
  
  
</form>
<%}
	}
		catch(Exception e)
		{
		e.printStackTrace();
		}
 }%>
	</div>
	</div>
<a href="logout.jsp">Log Out</a>	
</body>
<%}%>
</html>

