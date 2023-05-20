<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Course List</title>
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
  				<li class="type"><strong>Student Section</strong></li>
    			<li><a class="actv" href="EnrolledCourseList.jsp">My Courses</a></li>
    			<li><button onclick="document.location='Login.jsp'">Logout</button></li>
  			</ul>
		</header>
		<table id="courses">
			<tr>
				<th>Username</th>
			    <th>Registration No</th>
			    <th>Department</th>
			    <th>Session</th>
			    <th>Email</th>
		  	</tr>
	  		<%
	   			ResultSet rs = (ResultSet)request.getSession().getAttribute("Resultset");
	    		try {
	    			while(rs.next()) {
		    			String reg = rs.getString("regno");
			 			String dept = rs.getString("dept");
			 			String sessionyear = rs.getString("sessionyear");
			 			String name = rs.getString("username");
			 			String email = rs.getString("email");
			%>			
	   		<tr>
	    		<td><%=name%></td>
	    		<td><%=reg%></td>
	    		<td><%=dept%></td>
	   			<td><%=sessionyear%></td>
	   			<td><%=email%></td>
			</tr>
	   	 	<% 
	    			}
	   	 		}
	    		catch(Exception e2) {
	           	System.out.println(e2);
	       		}
	   		%>
		</table>
	</body>
</html>