<%@page import="java.sql.ResultSet"%>
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
<title>Doctor leave status</title>
<link rel="stylesheet" href="showdoctorleave.css">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<h3 style="text-align:center;font-size:30px;">Doctor Leave Details</h3>
<%

int id;
String Name,Contact,Email,Reason,From_Date,To_Date,Status;

Connection connection;
PreparedStatement statement;
ResultSet set;

try{
  Class.forName("com.mysql.cj.jdbc.Driver");
  connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
  statement=connection.prepareStatement("select * from doctorleave where status IS NULL");
  set=statement.executeQuery();
  %>
  
  <table style='margin:auto;height:20vh;width:180vh;text-align:center;font-family:sans-serif;border-color:#96D4D4;' border="2px solid black"><tr><th>Name</th><th>Contact</th><th>Email</th><th>Reason</th><th>From_Date</th><th>To_Date</th><th colspan="2">Status</th></tr>
  <%
  while(set.next()){
	  Name=set.getString(1);
	  Contact=set.getString(2);
	  Email=set.getString(3);
	  Reason=set.getString(4);
	  From_Date=set.getString(5);
	  To_Date=set.getString(6);
	  id=set.getInt(8);
  
	%>
	<tr>
		<td><%=Name%></td>
		<td><%=Contact%></td>
		<td><%=Email%></td>
		<td><%=Reason%></td>
		<td><%=From_Date%></td>
		<td><%=To_Date%></td>
		<td><button class="btn btn-primary btn-sm mb-2" data-toggle="modal" data-target="#accept_doctor_Modal" data-id="<%=id%>" id="accept_doctor_button">Accept</button></td>
		<td><button class="btn btn-primary btn-sm mb-2" data-toggle="modal" data-target="#reject_doctor_Modal" data-id="<%=id%>" id="reject_doctor_button">Reject</button></td>
		</tr>
		<%
	}

	%>
	 </table>
	
<%
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
<div  class="modal fade" id="accept_doctor_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog " role="document">
        <div class="modal-content">
		<form action="accept_doctorleave.jsp" method="post">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to Accept Request?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
		  
            <div class=" font-weight-bold text-primary text-uppercase mb-1">
                  <input type="hidden" name="id" class="form-control" id="id" required />
			</div>
		  
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
            <button style="width:20vh;" class="btn btn-primary" type="submit">Accept Request</button>
          </div>
		</form>
        </div>
      </div>
    </div>
    

<div  class="modal fade" id="reject_doctor_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog " role="document">
        <div class="modal-content">
		<form action="reject_doctoeleave.jsp" method="post">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to Reject Request?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
		  
            <div class=" font-weight-bold text-primary text-uppercase mb-1">
                  <input type="hidden" name="id" class="form-control" id="id" required />
			</div>
		  
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
            <button style="width:20vh;" class="btn btn-primary" type="submit">Reject Request</button>
          </div>
		</form>
        </div>
      </div>
    </div>
    
       <script type="text/javascript">
        $("#accept_doctor_button").click(function (e) {


			var sn = $('#accept_doctor_button').attr('data-id');	
	
			$("#id").val(sn);
        });
    </script>
    
    
    <script type="text/javascript">
        $("#reject_doctor_button").click(function (e) {

			var sn = $('#reject_doctor_button').attr('data-id');	

			$("#id").val(sn);
        });
    </script>

</body>
</html>