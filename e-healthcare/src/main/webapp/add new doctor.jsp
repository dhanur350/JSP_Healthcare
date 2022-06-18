<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Doctor</title>
<link rel="stylesheet" href="add new doctor.css">
</head>
<body style="background-image:url('images/add doctor bg.jpg');
    height:100vh;
	background-repeat:no-repeat;
	background-size:100% 100%;">



<div class="box">
<h1>Lets Add A New Doctor</h1>

	<div class="book">
<h3>Doctor Form</h3>
	<div class="form">
			<form action="AddDoctorData" method="post" enctype="multipart/form-data">
				
			<div class="container1">
			
			<div class="ct1">
				<p>Name</p>
					<input type="text" name="name" placeholder="Enter your Name" autocomplete="new-password" required>
				</div>	
			<div class="ct2">	
				<p>Image</p>
					<input type="file"  name="image" accept="image/*" required>
				</div>
				</div>
			<div class="container2">
			
				<div class="ct3">
				<p>Contact</p>
				<input type="text" name="contact" placeholder="Enter your Contact" autocomplete="new-password" required>
				</div>
				
				<div class="ct4">
				<p>Age</p>
				<input type="text" name="age" placeholder="Enter your Age" autocomplete="new-password" required>
		     	</div>
			</div>	
			
		<div class="container3">
						
			<div class="ct7">
				<p>Department</p>	
				<input type="text" name="department" placeholder="Enter your Department" autocomplete="new-password">	
			</div>
			
		    <div class="ct6">
				<p>Address</p>	
					<input type="text" name="address" placeholder="Enter your Address" autocomplete="new-password">
			</div>
			</div>
			
			<div class="container4">
			
			<Div class="ct5">
				<p>Email</p>		
				<input type="email" name="email" placeholder="Enter your Email" autocomplete="new-password">
					</Div>
					
		
			
			<div class="ct8">
				<p>Password</p>		
					<input type="password" name="password" placeholder="Enter your password" autocomplete="new-password">	
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