<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Appointment</title>
</head>
<body>
<h1 style="color:;text-align:center;">ALL APPOINTMENTS</h1>
<%

int aid;
String patient_name,phone_number,email,symptoms,Select_date ,time ,department,gender,astatus ;

Connection connection;
PreparedStatement statement;
ResultSet rs;

try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	statement=connection.prepareStatement("select * from appointment");
	
	rs=statement.executeQuery();
	%>
	<table style='margin:auto;height:150vh;width:200vh;text-align:center;font-family:sans-serif;border-color:#96D4D4;' border="2px solid black"><tr><th>Patient_Name</th><th>Phone_Number</th><th>Email</th><th>Symptoms</th><th>Select_Date</th><th>Department</th><th>Gender</th><th>Time</th><th>Status</th><Th>App_id</Th></tr>
	
	<% 
	while(rs.next()){
		patient_name=rs.getString(1);
		phone_number=rs.getString(2);
		email=rs.getString(3);
		symptoms=rs.getString(4);
		Select_date=rs.getString(5);
		department=rs.getString(6);
		gender=rs.getString(7);
		time=rs.getString(8);
		astatus=rs.getString(9);
		aid=rs.getInt(10);
	
	%>
	
	
	<tr>
	<Td><%=patient_name%></Td>
	<Td><%=phone_number %></Td>
	<td><%=email%></td>
	<td><%=symptoms%></td>
	<Td><%=Select_date%></Td>
	<td><%=department%></td>
	<td><%=gender%></td>
	<td><%=time %></td>
	<td><%=astatus %></td>
	<td><%=aid%></td>
	</tr>
	<%
	}
	%>
	</table>
	
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