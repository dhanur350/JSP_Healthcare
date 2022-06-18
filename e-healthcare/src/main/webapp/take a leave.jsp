<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leave Form</title>
<link rel="stylesheet" href="take a leave.css">
</head>

<body style="background-image:url('images/doctorleavebg.jpg');
background-repeat:no-repeat;
background-size:100% 100%;
height:100vh;">


<div class="box">

	<div class="book">
<h3>Doctor leave form</h3>
	<div class="form">
			<form action="doctorleavedatajsp.jsp" method="post">
				
			<div class="container1">
			
			<div class="ct1">
				<p>Name</p>
					<input type="text" name="name" placeholder="Enter your name"  autocomplete="new-password" required>
				</div>	
			<div class="ct2">	
				<p>Contact</p>
					<input type="text" name="number" placeholder="Enter your number"  autocomplete="new-password" required>
				</div>
				</div>
			<div class="container2">
			
				<div class="ct3">
				<p>Email</p>
				<input type="email" name="email" placeholder="Enter your mail id" autocomplete="new-password" required>
				</div>
				
				<div class="ct4">
				<p>Reason</p>
				<Textarea name="reason" rows="1" cols="20" autocomplete="new-password"></Textarea>
		     	</div>
			</div>	
			
		<div class="container3">
						
			<div class="ct5">
				<p>From_Date</p>	
				<input type="date" name="date">
			</div>
			
		    <div class="ct6">
				<p>To_Date</p>	
				<input type="date" name="todate">	
			</div>
			
			</div>
			
			<div class="clear">
		    <button type="submit" class="button">Submit</button>
		    </div>
			
			
			
</form>
</div>
</div>


</div>
</body>
</html>