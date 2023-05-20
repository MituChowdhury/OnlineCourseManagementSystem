<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Teacher List</title>
		<link rel="stylesheet" href="BaseStyle.css">
        <link rel="icon" type="image/png" href="favicon-dark.png" media="(prefers-color-scheme: dark)">
        <link rel="icon" type="image/png" href="favicon-light.png" media="(prefers-color-scheme: light)">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
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
            	<li class="type"><strong>Admin Section</strong></li>
				<li><a href="AdminHome.jsp">Add Courses</a></li>
		  	 	<li><a class="actv" href="TeacherList.jsp">View Teachers</a></li>
		     	<li><a href="CourseList.jsp">View Courses</a></li>
		     	<li><button onclick="document.location='Login.jsp'">Logout</button></li>
			</ul>
		</header>
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
			    String query = "SELECT * FROM teachers";
			    PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
		%>
		<table id="courses">
			<tr>
    			<th>Teacher Name</th>
    			<th>Teacher Email</th>
    			<th>Department</th>
  			</tr>
   			<%
				while(rs.next()) {
					String dept = rs.getString("dept");
					String name = rs.getString("username");
				   	String email = rs.getString("email");
			%>
			<tr>
    			<td><%=name%></td>
    			<td><%=email%></td>
    			<td><%=dept%></td>
  			</tr>
			<%
				}
			%>
		</table>
		<%
			}
			catch(Exception e2) {
				System.out.println(e2);
			}
		%>
	</body>
</html>