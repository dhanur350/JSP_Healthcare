<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment_form</title>
<link rel="stylesheet" href="appointment_form.css">
</head>
<body style="background-image:url('images/appointmentbg.jpg');
    height:100%;
	background-repeat:no-repeat;
	background-size:100% 100%;">

<div class="box">
<h1>Medical Appointment form</h1>

	<div class="book">
<h3>Make an appointment</h3>
	<div class="form">
			<form action="appointmentdata.jsp" method="post">
				
			<div class="container1">
			
			<div class="ct1">
				<p>Patient Name</p>
					<input type="text" name="name" placeholder="Enter your name"  autocomplete="new-password" required>
				</div>	
			<div class="ct2">	
				<p>Phone Number</p>
					<input type="text" onkeydown="validateNumber(event);" name="number" placeholder="Enter your number"  autocomplete="new-password" required>
				</div>
				</div>
			<div class="container2">
			
				<div class="ct3">
				<p>Email</p>
				<input type="email" name="email" placeholder="Enter your mail id" autocomplete="new-password" required>
				</div>
				
				<div class="ct4">
				<p>Symptoms</p>
				<input type="text" name="symptoms" placeholder="Enter your symptoms" autocomplete="new-password" required>
		     	</div>
			</div>	
			
		<div class="container3">
						
			<div class="ct7">
				<p>Gender</p>	
					<select class="select1" name="gender">
						<option value="select">select your gender</option>
						<option value="male">Male</option>
						<option value="female">Female</option>
					</select>
			</div>
			
		    <div class="ct6">
				<p>Department</p>	
					<select class="select" name="department">
						<option value="enter">Select your department</option>
						<option value="Dermatologist">Dermatologist</option>
						<option value="Cardiologist">Cardiologist</option>
						<option value="Dentist">Dentist</option>
						<option value="Opthamologist">Ophthalmologist</option>
						<option value="Physiotherapist">physiotherapist</option>
					</select>
			</div>
			</div>
			
			<div class="container4">
			
			<Div class="ct5">
				<p>Select Date</p>		
				<input type="date" name="date">
					</Div>
					
		
			
			<div class="ct8">
				<p>Time</p>		
					<input type="time" name="time" class="timepicker">	
			</div>
			</div>
				
			<div class="clear">
		    <button type="submit" class="button">Submit</button>
		    </div>
			</form>
			</div>
			
		</div>
		
		
</div>

<script type="text/javascript" src="js/myscript.js"></script>
</body>
</html>