<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="basic.SendMail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>backend</title>
</head>
<body>
<% 

Connection connection;
PreparedStatement statement;
ResultSet set;

String status="Accepted";
int id=Integer.parseInt(request.getParameter("id"));
String email="";



try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("update doctorleave set status=? where id=?");
	statement.setString(1, status);
	statement.setInt(2, id);
	statement.executeUpdate();

	
	statement=connection.prepareStatement("select * from doctorleave where id=?");
	statement.setInt(1, id);
    set=statement.executeQuery();
	
    if(set.next()){
    	email=set.getString(3);

    	SendMail sm = new SendMail();
    	String mess=("<html>"
    			+"<head>"
    			+"</head>"
    			+"<body>"
    			+"<h2>your request is accepted</h2>"
    			+"</body>"
    			+"</html>");
    	sm.send(email, "your request for leave", mess);

    }
    
    else{
    	out.print("<h3>Record Not Found</h3>");
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

RequestDispatcher rd = request.getRequestDispatcher("showdoctorleave.jsp");
rd.forward(request, response);

%>

</body>
</html>