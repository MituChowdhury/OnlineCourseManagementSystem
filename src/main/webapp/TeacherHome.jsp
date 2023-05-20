<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Teacher Home</title>
		<link rel="stylesheet" href="BaseStyle.css">
        <link rel="icon" type="image/png" href="favicon-dark.png" media="(prefers-color-scheme: dark)">
        <link rel="icon" type="image/png" href="favicon-light.png" media="(prefers-color-scheme: light)">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
	</head>
	<body>
		<header id="head">
			<div id="name">
                <img src="logo.png" alt="OCMS logo" height="40px">
                <h1 class="wlc owlc">Online Course Management System</h1>
            </div>
  			<ul id="nav">
  				<li class="type"><strong>Teacher Section</strong></li>
    			<li><a class="actv" href="EnrolledCourseList.jsp">My Courses</a></li>
    			<li><button onclick="document.location='Login.jsp'">Logout</button></li>
  			</ul>
  		</header>
		<% 
			String email = (String)request.getSession(false).getAttribute("Email");	
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
			    String query = ("SELECT * FROM courses WHERE courseteacheremail = ?");
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
			    <th>Students</th>
		  	</tr>
		  	<%
				while(rs.next()){
					String title = rs.getString("coursename");
		   	 		String code = rs.getString("coursecode");
					String credit = rs.getString("credit");
					String name = rs.getString("courseteachername");
					String ctemail = rs.getString("courseteacheremail");
					session.setAttribute("coursename",title);
			%>
	   		<tr>
	    		<td><%=title%></td>
				<td><%=code%></td>
	   			<td><%=credit%></td>
	 			<td><%=name%></td>
	  			<td><%=ctemail%></td>
	  			<td>
	  				<form action="show student" method = "post">
	     				<input type = "hidden" name = "cname" value = "<%=title%>" id = "<%=title%>">
	     				<input style="-webkit-border-radius: 50px;-moz-border-radius: 50px;border-radius: 50px;color:white;background:#A9A9A9;height:50px;" type = "submit" name ="see" value ="Show Students" id = "<%=title%>">
	     			</form>
	     		<td>
			</tr>	
	   	 	<% 
				}
		  	%>
		</table>
		<%
	   	 	}
			catch (Exception e2) {
	           	System.out.println(e2);
	       	}
		%>
	</body>
</html>