<%@page import="java.sql.ResultSet"%>
<%@page import="basic.SendMail"%>
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
<title>Accept</title>
</head>
<body>
<% 

Connection connection;
PreparedStatement statement;
ResultSet set;

String astatus="Accepted";
int aid=Integer.parseInt(request.getParameter("aid"));
String email="",date="",time="";
String doctor_name;

try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("update appointment set astatus=? where aid=?");
	statement.setString(1, astatus);
	statement.setInt(2, aid);
	statement.executeUpdate();

	
	statement=connection.prepareStatement("select * from appointment where aid=?");
	statement.setInt(1, aid);
    set=statement.executeQuery();
	
    if(set.next()){
    	email=set.getString(3);
    	date=set.getString(5);
    	time=set.getString(8);

    	doctor_name=String.valueOf(session.getAttribute("doctor_name"));
    	
    	SendMail sm = new SendMail();
    	
    	String msg=("<html>"
    			+"<head>"
    			+"</head>"
    			+"<body>"
    			+"<table height=\"300px\" width=\"300px\" margin=\"auto\" text-align=\"center\" font-family=\"sans-serif\" border-color=\"#96D4D4\" border=\"1px solid black\">"
    			+"<tr>"
    			+"<td colspan=\"2\">Your appointment is booked with doctor </td>"
    			+"</tr>"
    			+"<Tr>"
    			+"<td>Doctor Name</td>"
    			+"<Td>"+doctor_name+"</Td>"
    			+"</Tr>"
    			+"<tr>"
    			+"<Td>At This Date</Td>"
    			+"<td>"+date+"</td>"
    			+"</tr>"
    			+"<Tr>"
    			+"<td>At This Time</td>"
    			+"<td>"+time+"</td>"
    			+"</Tr>"
    			+"</table>"
    			+"</body>"
    			+"</html>");
    	
    	sm.send(email, "Your appointment is booked", msg);	
    
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

RequestDispatcher rd = request.getRequestDispatcher("checkappointment.jsp");
rd.forward(request, response);

%>

</body>
</html>