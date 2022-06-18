<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="public.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<title>Admin</title>
</head>
<body style="background-color:#f1f2f6;">

<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

	if(session==null)
	{
		response.sendRedirect("adm login.jsp");
	}
	else if(session.getAttribute("user")==null)
	{
		response.sendRedirect("adm login.jsp");
	}
	else if(session.getAttribute("user")=="")
	{
		response.sendRedirect("adm login.jsp");
	}

%>
		<div class="container">
			<div>
			<h4>Monday - Saturday, 9am to 8pm</h4>
			</div>
			<div>
			<h4>Call us now +91 9855406286</h4>
			</div>
		</div>
		
     <div class="container1">
		<div>
			<img src="images/healthcare.png">
		</div>		
		<div >
			<ul>
			    <li><a href="#">HOME</a></li>
			    <li><a href="#">DOCTOR</a></li>
				<li><a href="#">PATIENT</a></li>
				<li><a href="#">APPOINTMENT</a></li>
				<li><a href="logout.jsp">ADMIN(LOG OUT)</a></li>
			</ul>
		</div>
       </div>

<section>

<div class="display">

<div class="container2">

<h2>Welcome to E-HealthCare Management System DashBoard</h2>
<hr class="hr" width="96%"/>

<div class="box0">
<h1><a href="add new doctor.jsp">ADD NEW DOCTOR</a></h1>
</div>

<div class="box1">
<h1><a href="show doctor.jsp">All DOCTOR</a></h1>
</div>
<div class="box2">
<h1><a href="show patient.jsp">All PATIENTS</a></h1>
</div>
<div class="box3">
<h1><a href="show all appointment.jsp">All APPOINTMENTS</a></h1>
</div>
<div class="box4">
<h1><a href="showdoctorleave.jsp">DOCTOR LEAVE STATUS</a></h1>
</div>
<div class="box5">
<h1><a href="showalldoctorleave.jsp">ALL DOCTOR STATUS</a></h1>
</div>



</div>
	
	
	<div class="container3">
	
	<div class="img">
		<img src="images/publicimg1.jpg">
	</div>
	
	<div class="img">
		<img src="images/publicimg2.jpg">
	</div>
	
	
	</div>
	
	</div>
	
</section>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>

</body>
</html>