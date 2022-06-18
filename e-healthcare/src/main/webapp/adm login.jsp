<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv=“Pragma” content=”no-cache”>
<meta http-equiv=“Expires” content=”-1″>
<meta http-equiv=“CACHE-CONTROL” content=”NO-CACHE”>
<title>Admin_login</title> 
<link rel="stylesheet" href="adm login.css">
</head>
<body style="background-image:url('images/admin1.jpeg');
	height:84vh;
	background-repeat:no-repeat;
	background-size:100% 100%;">

<div class="box">

<div class="box1">
<h2>ADMIN LOGIN</h2>
<h4>Get access to your doctor , patients details</h4>
<img src="images/adm img.jpg">
</div>	

<div class="box2">
<div>
  <form class="form-container" action="admin login data.jsp" method="post" >
    <h1>Login</h1><br><br>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" autocomplete="new-password" required>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
    <button type="submit" class="btn">Login</button>
    
    <span id="sp_msg" class="span"> </span>
  </form>
</div>
</div>
</div>

<%
	if(session!=null)
	{
		if(session.getAttribute("msg")!=null)
		{
			String msg=String.valueOf(session.getAttribute("msg")).trim();
			
			if(!msg.equals(""))
			{
				session.setAttribute("msg", "");
			%>
				<script>
					document.getElementById("sp_msg").innerHTML="*<b>Incorrect email id or passsword</b>"
				</script>
			<%
			}
			else
			{
				%>
					<script>
						document.getElementById("sp_msg").innerHTML=""
					</script>
				<%
			}
		}
	}
%>

<script>

	function checkForm()
	{
		document.getElementById("sp_msg").innerHTML=""		
	
		return true;
	}
	
</script>
</body>
</html>