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

<h1>Leave-Details</h1>

<%
Connection connection;
PreparedStatement statement;

int id;
String Name,Contact,Email,Reason,From_Date,To_Date,Status;

try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("select * from doctorleave where status='accepted'");
	ResultSet rs=statement.executeQuery();
	
	%>
	
	<table style='margin:auto;height:20vh;width:200vh;text-align:center;font-family:sans-serif;border-color:#96D4D4;' border="2px solid black"><tr><th>Name</th><th>Contact</th><th>Email</th><th>Reason</th><th>From_Date</th><th>To_Date</th><th>Status</th><th>id</th></tr>
	
	<%
	
	while(rs.next()) {
		Name=rs.getString(1);
		Contact=rs.getString(2);
		Email=rs.getString(3);
	    Reason=rs.getString(4);
		From_Date=rs.getString(5);
		To_Date=rs.getString(6);
		Status=rs.getString(7);
		id=rs.getInt(8);
		
		%>
	<tr><td><%=Name%></td>
		<td><%=Contact%></td>
		<td><%=Email%></td>
		<td><%=Reason%></td>
		<td><%=From_Date%></td>
		<td><%=To_Date%></td>
		<td class="status"><%=Status%></td>
		<td><%=id%></td>
		
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