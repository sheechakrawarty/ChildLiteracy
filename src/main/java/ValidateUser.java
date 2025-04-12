import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import org.apache.jasper.tagplugins.jstl.core.Out;

public class ValidateUser extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) {
		String email = req.getParameter("email");
		//System.out.println(email);
		try {
			//System.out.println("checking");
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?user=root&password=Database");
			String query = "select email_id from usernames";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				if(email.equals(rs.getString("email_id"))) {
					//System.out.println("checking");
					
					res.sendRedirect("index.jsp");
				
					           
				}
			}
			//System.out.println("validated");
			HttpSession httpSession = req.getSession();
			httpSession.setAttribute("email",email);
			httpSession.setAttribute("name",req.getParameter("name"));
			httpSession.setAttribute("password",req.getParameter("password"));
			
			RequestDispatcher rd = req.getRequestDispatcher("/addUser");
			rd.forward(req, res);
			
		}
		catch(Exception e){
			System.out.println("Validate");
			//e.printStackTrace();
		}
	}
	
}
