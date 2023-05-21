<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Course List</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="BaseStyle.css">
        <link rel="icon" type="image/png" href="favicon-dark.png" media="(prefers-color-scheme: dark)">    
        <link rel="icon" type="image/png" href="favicon-light.png" media="(prefers-color-scheme: light)">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
	</head>
	<body>
		<%
		
        	/* Clears the cache */
        	
    		response.setHeader("cache-control", "no-cache no-store must-revalidate");

			/* If user tries to access a page without logging in then they will be redirected to the login page */
        	
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
				<%
				
					/* Sets database connection */
				
					Class.forName("com.mysql.cj.jdbc.Driver");
					java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
					
					/* Retrieves the usertype by executing a query in 'users' table */
					
					String uemail = (String)request.getSession(false).getAttribute("Email");
					
					PreparedStatement ps0 = con.prepareStatement("SELECT usertype FROM users WHERE email = ?");
					
					ps0.setString(1, uemail);
					
					ResultSet rs0 = ps0.executeQuery();
					
					String t = "";
					
					if (rs0.next()) {
						t = rs0.getString("usertype");
					}
					
					/* If user is a student then available options for student section will be shown on the navigation bar */
					
					if (t.equals("student")) {
				%>
				
				<li class="type"><strong>Student Section</strong></li>
				<li><a href="StudentHome.jsp">Enroll</a></li>
				<li><a href="EnrolledCourseList.jsp">My Courses</a></li>
				
				<%
					}
					
					/* If user is an admin then available options for admin section will be shown on the navigation bar */
					
					else if (t.equals("admin")) {
				%>
				
				<li class="type"><strong>Admin Section</strong></li>
				<li><a href="AdminHome.jsp">Add Course</a></li>
				<li><a href="TeacherList.jsp">View Teachers</a></li>
				
				<%
					}
				%>
				
				<li><a class="actv" href="CourseList.jsp">View Courses</a></li>
				<li><button onclick="document.location='Login.jsp'">Logout</button></li>
			</ul>
		</header>
		<%
			try {
				
				/* Prepares and executes a query
					produces course list from the 'course' table in database */
				
				String query = "SELECT * FROM courses";
				PreparedStatement ps = con.prepareStatement(query);
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
				while (rs.next()) {
					
					/* Retrieves and displays the course information from the Resultset */
					
					String title = rs.getString("coursename");
					String code = rs.getString("coursecode");
					String credit = rs.getString("credit");
					String name = rs.getString("courseteachername");
					String email = rs.getString("courseteacheremail");
			%>
			
			<tr>
				<td><%=title%></td>
				<td><%=code%></td>
				<td><%=credit%></td>
				<td><%=name%></td>
				<td><%=email%></td>
			</tr>
			
			<%
				}
			%>
		</table>
		<%
			}
		
			/* If any error occurs */
		
			catch(Exception e1) {
				request.getSession().setAttribute("ErrorString", "There's an error. That's all we know :(");
				request.getRequestDispatcher("Error.jsp").forward(request,response);
				System.out.println(e1);
			}
		%>
	</body>
</html>