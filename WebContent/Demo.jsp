<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<input name= "date" type="text" readonly="readonly"  />

<select id="Ultra" onchange="run()">  
 <option value="11/15/1991">1991-11-15</option> <!-- year value was 991 instead of 1991, might cause you to think the calculation is wrong -->
 <option value="10/23/1992">1992-10-23</option>
</select><br><br>
TextBox1<br>
 <input type="text" id="srt" placeholder="get value on option select"   readonly="readonly"><br>
<script type="text/javascript">
function run() {
  var birth = new Date(document.getElementById("Ultra").value); //string containing date has to be passed as parameter to Date() function to create a date object that can be used with the current date object below
  var check = new Date();
  var milliDay = 1000 * 60 * 60 * 24;

  var AgeinDay = (check - birth) / milliDay; //variable here was milliday all small case, declared above as milliDay with a capital D
  var ComputAge = Math.floor(AgeinDay / 365 );
  var age = ComputAge / 365;
  document.getElementById("srt").value = age;
}
 </script>
</body>
</html>