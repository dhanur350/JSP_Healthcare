<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>appointment_backend</title>
</head>
<body>
<%

String Name=request.getParameter("name");
String number=request.getParameter("number");
String email=request.getParameter("email");
String Symptoms=request.getParameter("symptoms");
String date=request.getParameter("date");
String Department=request.getParameter("department");
String gender=request.getParameter("gender");
String time=request.getParameter("time"); 


Connection connection;
PreparedStatement statement;
int i;


try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("insert into appointment(patient_name,phone_number,email,symptoms,select_date,department,gender,time) values(?,?,?,?,?,?,?,?)");
	statement.setString(1,Name);
	statement.setString(2,number);
	statement.setString(3, email);
	statement.setString(4, Symptoms);
	statement.setString(5, date);
	statement.setString(6, Department);
	statement.setString(7, gender);
	statement.setString(8,time);
	i=statement.executeUpdate();
	
	if(i>0){
		out.print("<h1>Data Saved we will mail you when appointment is booked</h1>");
	}
	else{
		out.print("Data not Saved");
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