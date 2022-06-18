<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>show Patient</title>
<link rel="stylesheet" href="show patient.css">
</head>
<body style="background-color:#f1f2f6;">

<h1>Patient-Details</h1>
<%
Connection connection;
PreparedStatement statement;

try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("select * from appointment");
	ResultSet rs=statement.executeQuery();
	
	
	String Name,Number,email,Symptoms,date,department,gender,time;
	%>
	
	<table style='margin:auto;height:150vh;width:180vh;text-align:center;font-family:sans-serif;border-color:#96D4D4;' border="2px solid black"><tr><th>Name</th><th>Number</th><th>email</th><th>Symptoms</th><th>date</th><th>department</th><th>gender</th><th>time</th></tr>
	
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

		
		%>
	<tr><td><%=Name%></td>
		<td><%=Number%></td>
		<td><%=email%></td>
		<td><%=Symptoms%></td>
		<td><%=date%></td>
		<td><%=department%></td>
		<td><%=gender%></td>
		<td><%=time%></td>
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