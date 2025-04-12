<%@ page import=" java.util.*,java.sql.*,javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user</title>
<style>
	*{
	text-align : center;
	font-size : 20px;
	margin : 10px;
	padding:10px;
	}
	#pno, th, td{
	border-collapse:collapse;
	background-color: #E17564;
	border : 2px solid white;
	}
</style>
</head>
<body>
	
	<%
		HttpSession httpSession = request.getSession();
		String email =(String) httpSession.getAttribute("email");
		String name = (String) httpSession.getAttribute("name");
		String password = (String) httpSession.getAttribute("password");
		ResultSet rs = null;
		Connection con = null;
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?user=root&password=Database");
			String query = "select * from usernames";
			PreparedStatement ps = con.prepareStatement(query);
			
			rs = ps.executeQuery();
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		int run=1;
	%>
	
	<table id= pno>
		<tr>
		<th>Num.</th>
		<th>Name</th>
		<th>Email</th>
		<th>Password</th>
		</tr>
	
	<% 
	
		while(rs.next()){
			
			%><tr>
				<td><%= run++ %></td>
			  <td> <%= rs.getString("name") %></td>
			  <td>	<%= rs.getString("email_id")%> </td>
			  <td>	<%= rs.getString("password")%> </td>
			  
			  </tr>
			<%
			
		}
	rs.close();
	con.close();
	%>
	</table>

</body>
</html>