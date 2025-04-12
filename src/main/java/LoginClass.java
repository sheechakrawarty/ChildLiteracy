import javax.servlet.http.*;

public class LoginClass extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) {
		HttpSession httpSession = req.getSession();
		String name = req.getParameter("name");
		httpSession.setAttribute("userName",name);
		String email = req.getParameter("email");
		httpSession.setAttribute("email", email);
		
		String password = req.getParameter("password");
		httpSession.setAttribute("password", password);
		
		System.out.println(name + " "+ email + " "+ password);
	}
	
}
