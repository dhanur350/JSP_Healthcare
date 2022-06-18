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
<title>Insert title here</title>
</head>
<body>
<%

int id=Integer.parseInt(request.getParameter("id"));

Connection connection;
PreparedStatement statement;


try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");

	statement=connection.prepareStatement("delete from doctorleave where id=?");
	statement.setInt(1, id);
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

RequestDispatcher rd = request.getRequestDispatcher("showalldoctorleave.jsp");
rd.forward(request, response);

%>
</body>
</html>