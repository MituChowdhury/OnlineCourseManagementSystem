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
    <li><a class = "homeblack" href="StudentHome.jsp">Enroll</a> </li>
    <li><a class = "homered" href="EnrolledCourseList.jsp">My Courses</a> </li>
    <li><a class = "homeblack" href="CourseList.jsp">View Courses</a> </li>
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
    
    String query = ("SELECT DISTINCT * FROM takes WHERE email = ?");

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
  	</tr>
  
   <%
    	
    	while(rs.next()){
   	
   	 		String title = rs.getString("coursename");
   	 	
   	 		try{
   	 	
   	 			String query1 = ("SELECT * FROM courses WHERE coursename = ?");

     			PreparedStatement ps1 = con.prepareStatement(query1);
     	
     			ps1.setString(1, title);
    
     			ResultSet rs1 = ps1.executeQuery();System.out.println("thik e toh ache");
     	
     			while(rs1.next()){
     	   	
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
   	 		} catch (Exception e2) {
            	System.out.println(e2);
        	}
   		}
   %>
   </table>
   <% 
    
	} catch (Exception e2) {
    	System.out.println(e2);
	}

	%>
</body>
</html>