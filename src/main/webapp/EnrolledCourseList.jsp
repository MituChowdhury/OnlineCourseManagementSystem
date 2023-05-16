<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>My Courses</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="BaseStyle.css">
		<link rel="icon" type="image/png" href="favicon-dark.png" media="(prefers-color-scheme: dark)">    
		<link rel="icon" type="image/png" href="favicon-light.png" media="(prefers-color-scheme: light)">
		<link rel="stylesheet"href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
	</head>
	<body>
		<%
    		response.setHeader("cache-control", "no-cache no-store must-revalidate");
			/// if user tries to access a page which is not allowed
    		if(session.getAttribute("Email") == null) {
				response.sendRedirect("Login.jsp");
			}	
    	%>
		<header id="head">
			<div id="name">
                <img src="logo.png" alt="OCMS logo" height="40px">
                <h1 class="wlc owlc">Online Course Management System</h1>
            </div>
			<ul id="nav">
				<li class="type"><strong>Student Section</strong></li>
				<li><a href="StudentHome.jsp">Enroll</a></li>
				<li><a class="actv" href="EnrolledCourseList.jsp">My Courses</a></li>
				<li><a href="CourseList.jsp">View Courses</a></li>
				<li><a href="Login.jsp">Logout</a></li>
			</ul>
		</header>
		<%
			String email = (String) request.getSession(false).getAttribute("Email");
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms", "root", "Triple$:)");
				String query = ("SELECT DISTINCT * FROM takes WHERE email = ?");
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, email);
				ResultSet rs = ps.executeQuery();
		%>
		<table id="courses">
			<tr>
				<th>Title</th>
				<th>Code</th>
				<th>Credit</th>
				<th>Teacher Name</th>
				<th>Teacher Email</th>
			</tr>
			<%
				while(rs.next()) {
					String title = rs.getString("coursename");
					try {
						String query1 = ("SELECT * FROM courses WHERE coursename = ?");
						PreparedStatement ps1 = con.prepareStatement(query1);
						ps1.setString(1, title);
						ResultSet rs1 = ps1.executeQuery();
						while(rs1.next()) {
							String code = rs1.getString("coursecode");
							String credit = rs1.getString("credit");
							String ctname = rs1.getString("courseteachername");
							String ctemail = rs1.getString("courseteacheremail");
			%>
			<tr>
				<td><%=title%></td>
				<td><%=code%></td>
				<td><%=credit%></td>
				<td><%=ctname%></td>
				<td><%=ctemail%></td>
			</tr>
			<% 
						}
					}
					catch(Exception e2) {
						System.out.println(e2);
					}
				}
			%>
		</table>
		<%
			}
			catch(Exception e1) {
				System.out.println(e1);
			}
		%>
	</body>
</html>