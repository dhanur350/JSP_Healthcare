<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Appointment</title>
<link rel="stylesheet" href="checkappointmentpending.css">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>Appointment-Details</h1>

<%
Connection connection;
PreparedStatement statement;

String department=String.valueOf(session.getAttribute("department"));
int aid;

try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("select * from appointment where department=? and astatus IS NULL");
	statement.setString(1, department);
	ResultSet rs=statement.executeQuery();
	
	
	String Name,Number,email,Symptoms,date,gender,time;
	%>
	
	<table style='margin:auto;height:30vh;width:200vh;text-align:center;font-family:sans-serif;border-color:#96D4D4;' border="2px solid black"><tr><th>Name</th><th>Number</th><th>Email</th><th>Symptoms</th><th>Date</th><th>Department</th><th>Gender</th><th>Time</th><th colspan="2">Status</th></tr>
	
	<%
	
	while(rs.next()) {
		Name=rs.getString(1);
		Number=rs.getString(2);
		email=rs.getString(3);
		Symptoms=rs.getString(4);
		date=rs.getString(5);
		department=rs.getString(6);
		gender=rs.getString(7);
		time=rs.getString(8);
		aid=rs.getInt(10);
		
		%>
	<tr><td><%=Name%></td>
		<td><%=Number%></td>
		<td><%=email%></td>
		<td><%=Symptoms%></td>
		<td><%= date%></td>
		<td><%=department%></td>
		<td><%=gender%></td>
		<td><%=time%></td>
<!--		<td><button class="btn btn-primary btn-sm mb-2" data-toggle="modal" data-target="#accept_appointment_Modal" data-id="<%=aid%>" id="accept_appointment_button">Accept<%=aid %></button></td> -->
<!--		<td><button class="btn btn-primary btn-sm mb-2" data-toggle="modal" data-target="#reject_appointment_Modal" data-id="<%=aid%>" id="reject_appointment_button">Reject<%=aid %></button></td> -->
		<td><button class="btn btn-primary btn-sm mb-2" data-toggle="modal" data-target="#accept_appointment_Modal" onclick="setAccept(<%=aid%>)" id="accept_appointment_button">Accept</button></td>
		<td><button class="btn btn-primary btn-sm mb-2" data-toggle="modal" data-target="#reject_appointment_Modal" onclick="setReject(<%=aid%>)" id="reject_appointment_button">Reject</button></td>
		<%
	}

	%> </table>
	
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

%>
<div  class="modal fade" id="accept_appointment_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog " role="document">
        <div class="modal-content">
		<form action="Accept.jsp" method="post">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to Accept Appointment?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
		  
            <div class=" font-weight-bold text-primary text-uppercase mb-1">
                  <input type="hidden" name="aid" class="form-control" id="aid" required />
			</div>
		  
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
            <button style="width:20vh;" class="btn btn-primary" type="submit">Accept Appointment</button>
          </div>
		</form>
        </div>
      </div>
    </div>
    

<div  class="modal fade" id="reject_appointment_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog " role="document">
        <div class="modal-content">
		<form action="Reject appointment.jsp" method="post">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to Reject Appointment?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
		  
            <div class=" font-weight-bold text-primary text-uppercase mb-1">
                  <input type="hidden" name="sno" class="form-control" id="sno" required />
			</div>
		  
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
            <button style="width:20vh;" class="btn btn-primary" type="submit">Reject Appointment</button>
          </div>
		</form>
        </div>
      </div>
    </div>
    
       <script type="text/javascript">
/*        $("#accept_appointment_button").click(function (e) {


			var sn = $('#accept_appointment_button').attr('data-id');	
	
			$("#aid").val(sn);
        });
 */   </script>
    
    
    <script type="text/javascript">
   /*     $("#reject_appointment_button").click(function (e) {

			var sn = $('#reject_appointment_button').attr('data-id');	

			$("#sno").val(sn);
        });
    */
    </script>
    
    <script>
    
    	function setAccept(x)
    	{
			$("#aid").val(x);
    	}
    	
    </script>

    <script>
    
    	function setReject(y)
    	{
			$("#sno").val(y);
    	}
    	
    </script>

</body>
</html>