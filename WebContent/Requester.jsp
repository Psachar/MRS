<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%@page import="javax.servlet.http.HttpSession"%>  
<% HttpSession s=request.getSession();
   String uid=(String)s.getAttribute("uid");
   if(uid!=null){%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Request</title>
	
	
    <link rel="stylesheet"  href="style_login.css" />
  <% if(request.getParameter("success")!=null){%>
<div class="alert3">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span>
  Thank you!!Your request has been processed.Please come and collect your medicine in 2 days 
</div>
<%} %>

<%if ((request.getParameter("info1"))!=null){ %>
<div class="alert2">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Sorry!!Enter the medicine details correctly
</div>
<%} %>	 
 
 <%if ((request.getParameter("info2"))!=null){ %>
<div class="alert2">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Sorry!!You can't procure more than 100 tablets at a time
</div>
<%} %>

 <%if ((request.getParameter("info3"))!=null){ %>
<div class="alert2">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Sorry!!Sufficient medicine which you requested is not present.Please try after 1 day
</div>
<%} %>
</head>
<script type="text/javascript">
  function showfield(name){
    if(name=='others')
    	document.getElementById('div1').style.display="block";
    else 
    	document.getElementById('div1').style.display="none";
  }
 
 function hidefield() {
 document.getElementById('div1').style.display='none';
 }
 </script>
 <style>
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
 <body onload="hidefield()">
 <form method="post" action="RequesterServlet">
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
				<h2>Request for medicine</h2>
			</div>
			<table align="center" cellpadding="10" >
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td>User ID</td>
                    <td><input type="text" name="uid" required=""></td>
                    </tr>
                    <tr>
                        <td>Medicine Type</td>
                        <td><select name="mtype" id="mtype" onchange="showfield(this.options[this.selectedIndex].value)" required="">
                            <option value="-1">Select</option>
                            <option value="Tablets">Tablets</option>
                            <option value="Syrup">Syrup</option>
                            <option value="Ointment">Ointment</option>
                            <option value="Others">Others</option>
                            </select> 
                            <div id="div1">Please Specify:</br><input type="text" name="whatever" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Medicine Name</td>
                        
                          <td><select class="select-type" name="mname" required="">
                             <option value="-1">Select</option>
				             <option value="Aspirin">Aspirin</option>
                             <option value="crocin">Crocin</option>
                             <option value="Imol">Imol</option>
                             <option value="Anacin">Anacin</option>
                             <option value="Paracetamol">Paracetamol</option>
                             <option value="Mederma">Mederma</option>
                             <option value="Desitin">Desitin</option>
                             <option value="Soframycin">Soframycin</option>
                             <option value="Dolo">Dolo</option>
                             <option value="Burnol">Burnol</option>
                           </select></td>
                    </tr> 
                    <tr>
                        <td>Quantity</td>
                        <td><input type="text" name="quant" value="" required=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Dosage in mg</td>
                        <td><input type="text" name="dos" value="" required="" /></td>
                    </tr>
                     
                     <tr>
				         <td colspan="2" align="center">
				         <input type="submit" value="Submit"/>&nbsp;&nbsp;
				         <input type="reset" value="Cancel"/>
				         </td>
					</tr>
					
					</tbody>
            </table>
		</div>
	</div>
	</form>
	<a href="logout.jsp">Log Out</a>
</body>     
    <%} %>
</html>
