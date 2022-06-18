<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>doctor_backend</title>
</head>
<body>
<% 	 

String email=request.getParameter("email");
String password=request.getParameter("password");
String department;
String name;

Connection connection;
PreparedStatement statement;
ResultSet set;
		  
		    
		    try 
		    {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Admin","root","SaHiL@123");
				
				statement=connection.prepareStatement("select * from  alldoctor where email=? and password=?");
				statement.setString(1, email);
				statement.setString(2, password);
				set=statement.executeQuery();
				
			if(set.next()){

				name=set.getString(3);
				department=set.getString(6);
				
				session.setAttribute("user", email);
				session.setAttribute("doctor_name", name);
				session.setAttribute("department", department);
			
				RequestDispatcher rd = request.getRequestDispatcher("all Doctor id.jsp");
				rd.forward(request, response);
			}
			else{
				session.setAttribute("msg", "invalid username or password");
				response.sendRedirect("Doctorlogin.jsp");
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