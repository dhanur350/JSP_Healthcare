<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctors</title>
  <link rel="stylesheet" href="showdoctor.css">	
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script></head>
<body style="background-color:#f1f2f6;">

<div class="d">
<h1>Doctor-Details</h1>
</div>
<%
Connection connection;
PreparedStatement statement;

try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
	
	statement=connection.prepareStatement("select * from alldoctor");
	ResultSet rs=statement.executeQuery();
	
	int S_N,Age;
	String Name,Contact,Department,Email,Address,password;
	String image;
	Blob blob;
	
	%>
	
	<table class="table" style='margin:auto;width:180vh;text-align:center;font-family:sans-serif;border-color:#96D4D4;' border="2px solid"><tr><th>S_N</th><th>Image</th><th>Name</th><th>Contact</th><th>Age</th><th>Department</th><th>Email</th><th>Password</th><th>Address</th><th>Edit/save</th><th>Delete/row</th></tr>
	
	<%
	
	while(rs.next()) {
		S_N=rs.getInt(1);
		blob=rs.getBlob(2);
		Name=rs.getString(3);
		Contact=rs.getString(4);
		Age=rs.getInt(5);
		Department=rs.getString(6);
		Email=rs.getString(7);
		password=rs.getString(8);
		Address=rs.getString(9);

		InputStream inputStream = blob.getBinaryStream();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		byte buffer[]=new byte[4096];
		
		int bytesread = -1;
		
		while((bytesread=inputStream.read(buffer))!=-1)
		{
			outputStream.write(buffer, 0, bytesread);
			
			byte imagesBytes[] = outputStream.toByteArray();
			
			String base64Image = Base64.getEncoder().encodeToString(imagesBytes);
			
			inputStream.close();
			outputStream.close();
			
			pageContext.setAttribute("image", base64Image);
			
		}
		
		%>
	<tr><td><%=S_N%></td>
		<td><img src="data:image/jpg;base64,${image}" alt="no image" height="100" width="150"></td>
		<td><%=Name%></td>
		<td><%=Contact%></td>
		<td><%= Age%></td>
		<td><%=Department%></td>
		<td><%=Email%></td>
		<td><%=password%></td>
		<td><%=Address%></td>
		<td><button class="btn" onclick="location.href='edit doctor data.jsp?id=<%=S_N%>'">Edit</button></td>
		<td><button class="btn btn-primary btn-sm mb-2" data-toggle="modal" data-target="#delete_doctor_Modal" data-id="<%=S_N%>" id="delete_doctor_button">Delete</button></td></tr>
		
	
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



<div  class="modal fade" id="delete_doctor_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog " role="document">
        <div class="modal-content">
		<form action="delete doctor.jsp" method="post">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to delete doctor record?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
		  
            <div class=" font-weight-bold text-primary text-uppercase mb-1">
                  <input type="hidden" name="sno" class="form-control" id="sno" required />
			</div>
		  
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
            <button style="width:15vh;" class="btn btn-primary" type="submit">Delete Doctor</button>
          </div>
		</form>
        </div>
      </div>
    </div>
    
    
    <script type="text/javascript">
        $("#delete_doctor_button").click(function (e) {

				
//            var text = $("#textarea").val();
  
//			var order_number = $(e.relatedTarget).data('book-id');

			var sn = $('#delete_doctor_button').attr('data-id');	
	
			$("#sno").val(sn);
        });
    </script>
    
</body>
</html>