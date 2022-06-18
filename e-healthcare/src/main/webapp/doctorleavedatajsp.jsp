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

String Name=request.getParameter("name");
String Contact=request.getParameter("number");
String Email=request.getParameter("email");
String Reason=request.getParameter("reason");
String From_Date=request.getParameter("date");
String To_Date=request.getParameter("todate");


Connection connection;
PreparedStatement statement;
int i;


try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("insert into doctorleave(Name,Contact,Email,Reason,From_Date,To_Date) values(?,?,?,?,?,?)");
	statement.setString(1, Name);
	statement.setString(2,Contact);
	statement.setString(3, Email);
	statement.setString(4, Reason);
	statement.setString(5, From_Date);
	statement.setString(6, To_Date);
	i=statement.executeUpdate();
	
	if(i>0){
		out.print("<h1>Request send we will notify when accepted</h1>");
	}
	else{
		out.print("error occured");
	}
}
catch(ClassNotFoundException e)
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