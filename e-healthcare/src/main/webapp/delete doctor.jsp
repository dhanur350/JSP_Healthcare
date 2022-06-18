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
<title>Delete</title>
</head>
<body>


<% 
int S_N=Integer.parseInt(request.getParameter("sno"));

Connection connection;
PreparedStatement statement;


try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");

	statement=connection.prepareStatement("delete from alldoctor where sno=?");
	statement.setInt(1, S_N);
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