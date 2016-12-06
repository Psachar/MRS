<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <% HttpSession sess=request.getSession(false);
   String s = (String)sess.getAttribute("uid");
   if(s!=null) { %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Donor</title>
<link rel="stylesheet" href="style_login.css">

<% if(request.getParameter("success")!=null){%>
<div class="alert3">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span>
  Thank you!!Your medicine details will be updated. 
</div>
<%} %>

<%if ((request.getParameter("info1"))!=null){ %>
<div class="alert2">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Sorry!!Enter the medicine details correctly.
</div>
<%} %>

<%if ((request.getParameter("info2"))!=null){ %>
<div class="alert2">
  <span class="closebtn2" onclick="this.parentElement.style.display='none';">&times;</span> 
  Hey!!The medicine which you have given has expired.Please give the correct medicine.
</div>
<%} %>	 
</head>

<script type="text/javascript">
  function showfield(name){
    if(name=='Others')
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
<form method="post" action="DonorServlet" >
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
				<h2>Donate Medicine</h2>
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
                        
                            <option value="Tablets">Tablets</option>
                            <option value="Syrup">Syrup</option>
                            <option value="Ointment">Ointment</option>
                            <option value="Others">Others</option>
                            </select> 
                            <div id="div1">Please specify:<input type="text" name="whatever" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Medicine Name</td>
                        <td><input type="text" name="mname" value="" required="" /></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="text" name="quant" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Expiry Date</td>
                        <td><select name="Year" id="Year" required="">
                             <option value="-1">Year:</option>
                             <option value="2016">2016</option>
                             <option value="2017">2017</option>
                             <option value="2018">2018</option>
                             <option value="2019">2019</option>
                             <option value="2020">2020</option>
                            </select>
                            
                            <select id="Month" name="Month" required="">
                              <option value="-1">Month:</option>
                              <option value="1">01</option>
                              <option value="2">02</option>
                              <option value="3">03</option>
                              <option value="4">04</option>
                              <option value="5">05</option>
                              <option value="6">06</option>
                              <option value="7">07</option>
                              <option value="8">08</option>
                              <option value="9">09</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                            </select>
                            
                             <select name="Day" id="ExpiryDay" required="">
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
                    <tr>
                        <td>Dosage</td>
                        <td><input type="text" name="dos" value="" required="" /></td>
                    </tr>
                     <tr>
                        <td>Manufacturer name</td>
                        <td><input type="text" name="mfname" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                        <input type="submit" value="Submit" />&nbsp;&nbsp;
                        <input type="reset" value="Cancel" />
                    </tr>
                   
                </tbody>
            </table>
        
          </div>
          </div>   
        </form>
        

           
 <a href="logout.jsp">Log Out</a>    

        
        
</body>
<%}%>
</html>