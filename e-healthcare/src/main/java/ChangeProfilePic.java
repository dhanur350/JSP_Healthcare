

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ChangeProfilePic
 */
@WebServlet("/ChangeProfilePic")
@MultipartConfig
public class ChangeProfilePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeProfilePic() {
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
	
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		
		
		int sno=Integer.parseInt(String.valueOf(session.getAttribute("sno")));
	
		Connection connection;
		PreparedStatement str;

		InputStream inputStream = null;
		Part filePart = request.getPart("file");
		
		if(filePart!=null)
		{
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			inputStream=filePart.getInputStream();
		}
	
		try{

			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","SaHiL@123");
			
			str=connection.prepareStatement("Update alldoctor set image=? where sno=?");
			str.setBlob(1, inputStream);
			str.setInt(2, sno);
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

	}

}
