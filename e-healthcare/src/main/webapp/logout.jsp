<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>logout</title>
</head>
<body>
<%

response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

	if(session==null)
	{
		response.sendRedirect("adm login.jsp");
	}
	else if(session.getAttribute("user")==null)
	{
		response.sendRedirect("adm login.jsp");
	}
	else if(session.getAttribute("user")=="")
	{
		response.sendRedirect("adm login.jsp");
	}

	session.setAttribute("user", "");
	session.setAttribute("msg", "");
	session.invalidate();
	
	response.sendRedirect("adm login.jsp");

//	RequestDispatcher rd = request.getRequestDispatcher("adm login.jsp");
//	rd.forward(request, response);
%>
</body>
</html>