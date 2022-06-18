<%@page import="com.mysql.cj.xdevapi.Statement"%>
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
<title>Edit and Save</title>
</head>
<body>
<%

Connection connection;
PreparedStatement statement;


int S_N=Integer.parseInt(request.getParameter("sno"));
String Name=request.getParameter("name");
String Contact=request.getParameter("contact");
int Age=Integer.parseInt(request.getParameter("age"));
String Department=request.getParameter("department");
String Email=request.getParameter("email");
String Password=request.getParameter("password");
String Address=request.getParameter("address");


try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	
	statement=connection.prepareStatement("update alldoctor set name=?,contact=?,age=?,department=?,email=?,password=?,address=? where sno=?");
	
	statement.setString(1, Name);
	statement.setString(2, Contact);
	statement.setInt(3, Age);
	statement.setString(4, Department);
	statement.setString(5, Email);
	statement.setString(6, Password);
	statement.setString(7, Address);
	statement.setInt(8, S_N);
	statement.executeUpdate();
	%>
	
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

RequestDispatcher rd = request.getRequestDispatcher("show doctor.jsp");
rd.forward(request, response);

%>
</body>
</html>