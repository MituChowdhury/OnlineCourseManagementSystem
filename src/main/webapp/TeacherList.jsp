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
  
  	 <li><a class = "homeblack" href="AdminHome.jsp">Add Courses</a> </li>
  	 <li><a class = "homered" href="TeacherList.jsp">View Teachers</a> </li>
     <li><a class = "homeblack" href="CourseList.jsp">View Courses</a> </li>
     <li><a class = "homeblack" href="Login.jsp">Logout</a> </li>
    
  </ul>

</nav>

</header>
</section>
<% 

try {
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
    
    String query = "SELECT * FROM teachers";

    PreparedStatement ps = con.prepareStatement(query);
   
    ResultSet rs = ps.executeQuery();
    
   %>
   <table id="courses" align="center" style="width: 80%;line-height: 40px; margin-left: 100px;  margin-bottom: 50px;margin-top: 50px;" >
	
	<tr>
    <th>Teacher Name</th>
    <th>Teacher Email</th>
    <th>Department</th>
  </tr>
   <%
    
    while(rs.next()){
    	
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
    
                
} catch (Exception e2) {
    System.out.println(e2);
}


%>
</body>
</html>