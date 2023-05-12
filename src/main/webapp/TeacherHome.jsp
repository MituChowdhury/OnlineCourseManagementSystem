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
    <li><a class = "homered" href="AssignedCourseList.jsp">My Courses</a> </li>
    <li><a class = "homeblack" href="Login.jsp">Logout</a> </li>
  </ul>

</nav>

</header>
</section>
<% 

String email = (String)request.getSession(false).getAttribute("Email");

try {
	
    Class.forName("com.mysql.cj.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
    
    String query = ("SELECT * FROM courses WHERE courseteacheremail = ?");

    PreparedStatement ps = con.prepareStatement(query);
    
    ps.setString(1, email);
   
    ResultSet rs = ps.executeQuery();
    
%>
   <table id="courses" align="center" style="width: 80%;line-height: 40px; margin-left: 100px;  margin-bottom: 50px;margin-top: 50px;" >
	
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
  			<td><form action="show student" method = "post">
     			<input type = "hidden" name = "cname" value = "<%=title%>" id = "<%=title%>">
     			<input style="-webkit-border-radius: 50px;-moz-border-radius: 50px;border-radius: 50px;color:white;background:#A9A9A9;height:50px;" type = "submit" name ="see" value ="Show Students" id = "<%=title%>">
     			</form>
     		<td>
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