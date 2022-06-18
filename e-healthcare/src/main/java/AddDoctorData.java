
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AddDoctorData
 */
@WebServlet("/AddDoctorData")
@MultipartConfig
public class AddDoctorData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctorData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
	
		String Name=request.getParameter("name");
		String Contact=request.getParameter("contact");
		int Age=Integer.parseInt(request.getParameter("age"));
		String Department=request.getParameter("department");
		String Email=request.getParameter("email");
		String Address=request.getParameter("address");
		String image=request.getParameter("image");
		String password=request.getParameter("password");


		Connection connection;
		PreparedStatement statement;


		InputStream inputStream = null;
		Part filePart = request.getPart("image");
		
		if(filePart!=null)
		{
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			inputStream=filePart.getInputStream();
		}
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");

			statement=connection.prepareStatement("insert into alldoctor(image,name,contact,age,department,email,password,address) values(?,?,?,?,?,?,?,?)");
			statement.setBlob(1, inputStream);
			statement.setString(2, Name);
			statement.setString(3, Contact);
			statement.setInt(4, Age);
			statement.setString(5, Department);
			statement.setString(6, Email);
			statement.setString(7, password);
			statement.setString(8, Address);
			int i=statement.executeUpdate();
			
			if(i>0)
			{
				out.print("Doctor Addedd Successfully");
			}
			else
			{
				out.print("Doctor Not Added");
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

	}

}
