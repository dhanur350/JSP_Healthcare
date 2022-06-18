<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>change profile </title>
</head>
<body>
<%

String image=request.getParameter("image");
int sno=Integer.parseInt(String.valueOf(session.getAttribute("sno")));
Blob blob;

Connection connection;
PreparedStatement str;

try{

	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	str=connection.prepareStatement("Update all doctor set image=? where sno=?");
	str.setString(2, image);
	str.setInt(1, sno);
    int i=str.executeUpdate();

	if(i>0){
		
		RequestDispatcher rd = request.getRequestDispatcher("all Doctor id.jsp");
		rd.forward(request, response);
		
	}
	else{
		out.print("profile was not updated");	
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