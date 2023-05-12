<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course List</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
#courses {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#courses td, #courses th {
  border: 1px solid #ddd;
  padding: 8px;
}

#courses tr:nth-child(even){background-color: #f2f2f2;}

#courses tr:hover {background-color: #ddd;}

#courses th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #8ebf42;
  color: white;
}
</style>
</head>
<body>

	<!-- ei scriplet ta body er starting e thakte hobe -->
    	<%
    		response.setHeader("cache-control", "no-cache no-store must-revalidate" );
    	
    		if(session.getAttribute("Email") == null){
				response.sendRedirect("Login.jsp");
			}
    	%>

<header>
<nav>
<h1>OnlineCourseManagement</h1>
<section>
  <ul id = "nav">
    <ul id = "nav">
    <li><a class = "homered" href="AssignedCourseList.jsp">My Courses</a> </li>
    <li><a class = "homeblack" href="Login.jsp">Logout</a> </li>
  </ul>
    
    
  </ul>

</nav>

</header>
</section>

   <table id="courses" align="center" style="width: 80%;line-height: 40px; margin-left: 100px;  margin-bottom: 50px;margin-top: 50px;" >
	
	<tr>
    <th>Username</th>
    <th>Registration No</th>
    <th>Department</th>
    <th>Session</th>
    <th>Email</th>
  	</tr>
  
   <%
   		ResultSet rs = (ResultSet)request.getSession().getAttribute("Resultset");
    	try{
    		while(rs.next()){
    			
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
   	 	} catch (Exception e2) {
           	System.out.println(e2);
       	}
   %>
   </table>
</body>
</html>