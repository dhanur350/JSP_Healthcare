<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Doctor</title>
<link rel="stylesheet" href="all Doctor id.css">
</head>
<body>
<%

String email=session.getAttribute("user").toString();


Connection connection;
PreparedStatement statement;
ResultSet set;


String name="",contact="",department="";
int age=0;
int sno;

String image;
Blob blob;

try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("select * from alldoctor where email=?");
	statement.setString(1, email);
    set=statement.executeQuery();
	
    if(set.next())
    {
    	sno=set.getInt(1);
    	blob=set.getBlob(2);
    	name=set.getString(3);
    	contact=set.getString(4);
    	age=set.getInt(5);
    	department=set.getString(6);
    
    	session.setAttribute("department", department);
    	session.setAttribute("sno", sno);
    
    	
    	if(blob!=null)
    	{
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
    	}

    	%>
    	
    	<div class="container">
		<div>
		<h4>E-Health Care Management System</h4>
		<p>A portal for e-healthcare system</p>
		</div>
		<div class="form">
			
<form action="https://www.google.com/search?q=" target="_blank">
    <input type="text" name="q"  />
    <button class="search">search</button>
</form>

		</div>
	</div>
	
<div class="container1">
	<div>
		<img src="images/healthcare.png">
	</div>		
	<div >
		<ul>
		    <li><a href="#">DOCTOR</a></li>
			<li><a href="#">CHECK APPOINTMENT</a></li>
			<li><a href="">DOCTOR(LOG OUT)</a></li>
		</ul>
	</div>
   </div>		
	
<section>

<div class="display">

<div class="container2">

<h2><%=name%></h2>
<hr class="hr" width="100%"/>

<div class="img_table">

<div class="img">
<img src="data:image/jpg;base64,${image}" alt="no image" height="100" width="150" id="output">
<div class="new_image">
<form action="ChangeProfilePic"  method="post" enctype="multipart/form-data">
<script>
	var loadFile = function(event)
	{
		var output = document.getElementById('output');
		
		output.src = URL.createObjectURL(event.target.files[0]);
	};
</script>
<input type="file" name="file" accept="image/*" onchange="loadFile(event)" required>
<button type="submit" class="cds">Change profile pic</button>
</form>
</div>
</div>



<div class="button">

<Table style="height:200px;width:380px;text-align:center;font-family:sans-serif;border-color:#96D4D4;" border="1px solid black">
<tr>
<td>Name</td>
<td><%=name%></td>
</tr>
<Tr>
<Td>Contact</Td>
<td><%=contact%></td>
</Tr>

<tr>
<Td>Department</Td>
<Td><%=department%></Td>
</tr>

<Tr>
<Td>Age</Td>
<td><%=age%></td>
</Tr>


</Table>

<div class="hello">
<button class="ca"><a href="checkappointmentpending.jsp">Pending Appointment</a></button>
<button class="cp"><a href="checkappointment.jsp">Accepted Appointment</a></button>

<br>



</div>
<button class="tal"><a href="take a leave.jsp">Take A Leave</a></button>

</div>

</div>

</div>


<div class="container3">

<div class="img">
	<img src="images/doctorprofile img.jpg">
</div>

<div class="img">
	<img src="images/doctorprofile img1.jpg">
</div>


</div>

</div>

</section>		
	
	<%
    }
    else
    {
    	out.print("<h3>Record Not Found</h3>");
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