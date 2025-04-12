import java.sql.Connection;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
public class JDBC extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession httpSession = req.getSession();
		String email =(String) httpSession.getAttribute("email");
		String name = (String) httpSession.getAttribute("name");
		String password = (String) httpSession.getAttribute("password");
		
		System.out.println(email+" "+ name + " "+ password);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?user=root&password=Database");
			String query = "insert into usernames(email_id,name,password)values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,email);
			ps.setString(2,name);
			ps.setString(3, password);
			ps.executeUpdate();
			System.out.println(con);
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);             
			con.close();
			
		}catch(Exception e) {
			System.out.println("JDBC");
			e.printStackTrace();
		}
		
	}
	
}
