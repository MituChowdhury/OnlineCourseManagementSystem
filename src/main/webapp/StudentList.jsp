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
<% 

String cname = (String)request.getSession(false).getAttribute("coursename");

try {
	
    Class.forName("com.mysql.cj.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
    
    String query = ("SELECT DISTINCT email FROM takes WHERE coursename = ?");

    PreparedStatement ps = con.prepareStatement(query);
    
    ps.setString(1, cname);

    ResultSet rs = ps.executeQuery();
    
%>
   <table id="courses" align="center" style="width: 80%;line-height: 40px; margin-left: 100px;  margin-bottom: 50px;margin-top: 50px;" >
	
	<tr>
    <th>Username</th>
    <th>Registration No</th>
    <th>Department</th>
    <th>Session</th>
    <th>Email</th>
  	</tr>
  
   <%
    	
    	while(rs.next()){
   	
   	 		String email = rs.getString("email");
   	 	
   	 		try{
   	 	
   	 			String query1 = ("SELECT * FROM students WHERE email = ?");

     			PreparedStatement ps1 = con.prepareStatement(query1);
     	
     			ps1.setString(1, email);
    
     			ResultSet rs1 = ps1.executeQuery();
     	
     			while(rs1.next()){
     	   	
       	 			String reg = rs1.getString("regno");
       	 			String dept = rs1.getString("dept");
       	 			String sessionyear = rs1.getString("sessionyear");
       	 			String name = rs1.getString("username");
   	 
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