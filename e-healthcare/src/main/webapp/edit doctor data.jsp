<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit doctor form</title>
<link rel="stylesheet" href="edit doctor data.css">
</head>
<body style="background-image:url('images/editdoctorbg.jpg');
    height:100vh;
	background-repeat:no-repeat;
	background-size:100% 100%;">
<%

int S_N=Integer.parseInt(request.getParameter("id"));

String Name, Contact, Email, Address, Department,Password;
int Age;

String image;
Blob blob;

Connection connection;
PreparedStatement statement;

try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("select * from alldoctor where sno=?");
	statement.setInt(1,S_N);
	ResultSet rs=statement.executeQuery();
	
	
	if(rs.next()) {
		S_N=rs.getInt(1);
		blob=rs.getBlob(2);
		Name=rs.getString(3);
		Contact=rs.getString(4);
		Age=rs.getInt(5);
		Department=rs.getString(6);
		Email=rs.getString(7);
		Password=rs.getString(8);
		Address=rs.getString(9);

		InputStream inputStream = blob.getBinaryStream();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		byte buffer[]=new byte[4096];
		
		int bytesread = -1;
		
		while((bytesread=inputStream.read(buffer))!=-1)
		{
			outputStream.write(buffer, 0, bytesread);
			
			byte imagesBytes[] = outputStream.toByteArray();
			
			String base64Image = Base64.getEncoder().encodeToString(imagesBytes);
			
			inputStream.close();
			outputStream.close();
			
			pageContext.setAttribute("image", base64Image);
			
		}
		

%>
<div class="box">
<h3>Edit Doctor Form</h3>
	<div class="book">

<div class="form">

<form action="edit doctor data cont.jsp" method="post">
				
			<div class="container1">
			<div class="ct3">
				<input type="hidden" name="sno" value="<%=S_N%>" required>
				<p>Name</p>
				<input type="text" name="name" placeholder="Enter your Name" value="<%=Name %>" required>
				</div>
				
				
				</div>
				<div class="ct2">	
				<p>Image</p>
				
				<img src="data:image/jpg;base64,${image }" alt="no image" height="100" width="150">
					<input type="file"  name="image" >
				
				
				</div>
			<div class="container2">
			
						
			<div class="ct7">
				<p>Age</p>	
				<input type="text" name="age" placeholder="Enter your Age" value="<%=Age %>" >	
			</div>
			
				<div class="ct4">
				<p>Contact</p>
				<input type="text" name="contact" placeholder="Enter your Contact" value="<%=Contact %>" required>
		     	</div>
			</div>	
			
		<div class="container3">
			
			
		    <div class="ct6">
				<p>Department</p>	
					<input type="text" name="department" placeholder="Enter your Department" value="<%=Department %>" >
			</div>
			
			<div class="address">
				<p>Address</p>
				<input type="text" name="address" placeholder="Enter your Address" value="<%=Address%>">
			</div>
			</div>
			
			<div class="container4">
			
			<Div class="ct5">
				<p>Email</p>		
				<input type="email" name="email" placeholder="Enter your Email" value="<%=Email %>" >
					</Div>
					
			<div class="ct9">
				<p>Password</p>
				<input type="password" name="password" placeholder="Enter your Password" value="<%=Password%>">
			</div>		
		
			
			</div>
				
			<div class="clear">
		    <button type="submit" class="button">Submit</button>
		    </div>
			</form>
			</div>
			
		</div>

</div>			

<% 
	}
	else
	{
		out.print("error");
	}

	
}
catch (ClassNotFoundException e) 
{
	e.printStackTrace();
}
catch(SQLException e)
{
	e.printStackTrace();
}

%>

</body>
</html>