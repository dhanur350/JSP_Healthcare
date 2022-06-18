<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Appointment</title>
<link rel="stylesheet" href="checkappointment.css">
 <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<h1>Appointment-Details</h1>

<%
Connection connection;
PreparedStatement statement;

String department=String.valueOf(session.getAttribute("department"));
int aid;

try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("select * from appointment where department=? and astatus='accepted'");
	statement.setString(1, department);
	ResultSet rs=statement.executeQuery();
	
	
	String Name,Number,email,Symptoms,date,gender,time,astatus;
	%>
	
	<table style='margin:auto;height:80vh;width:200vh;text-align:center;font-family:sans-serif;border-color:#96D4D4;' border="2px solid black"><tr><th>Name</th><th>Number</th><th>Email</th><th>Symptoms</th><th>Date</th><th>Department</th><th>Gender</th><th>Time</th><th>Status</th></tr>
	
	<%
	
	while(rs.next()) {
		Name=rs.getString(1);
		Number=rs.getString(2);
		email=rs.getString(3);
		Symptoms=rs.getString(4);
		date=rs.getString(5);
		department=rs.getString(6);
		gender=rs.getString(7);
		time=rs.getString(8);
		astatus=rs.getString(9);
		aid=rs.getInt(10);
		
		%>
	<tr><td><%=Name%></td>
		<td><%=Number%></td>
		<td><%=email%></td>
		<td><%=Symptoms%></td>
		<td><%= date%></td>
		<td><%=department%></td>
		<td><%=gender%></td>
		<td><%=time%></td>
		<td class="status"><%=astatus%></td>
		
		<%
	}

	%> </table>
	
	<%
	
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