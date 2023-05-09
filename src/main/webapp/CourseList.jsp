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
  	<%
  		Class.forName("com.mysql.jdbc.Driver");
    	java.sql.Connection con = DriverManager.getConnection(
        	    "jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
    
    	String uemail = (String)request.getSession(false).getAttribute("Email");
    	
    	PreparedStatement ps0 = con.prepareStatement("SELECT usertype FROM users WHERE email = ?");

    	ps0.setString(1, uemail);	
   
    	ResultSet rs0 = ps0.executeQuery();
    
    	String t = "";
    	
    	if(rs0.next()) {
    		t = rs0.getString("usertype");
    	}
    	if(t.equals("student")){
    	%>
    	<li><a class = "homeblack" href="StudentHome.jsp">Enroll</a> </li>
    	<li><a class = "homeblack" href="EnrolledCourseList.jsp">My Courses</a> </li>
    	<%
    	}
    	else if(t.equals("admin")){
    	%>
    	<li><a class = "homeblack" href="AdminHome.jsp">Add Courses</a> </li>
    	<%
    	}
  	%>
     <li><a class = "homered" href="CourseList.jsp">View Courses</a> </li>
     <li><a class = "homeblack" href="Login.jsp">Logout</a> </li>
    
    
  </ul>

</nav>

</header>
</section>
<% 

try {
    
    String query = "SELECT * FROM courses";

    PreparedStatement ps = con.prepareStatement(query);
   
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
    
                
} catch (Exception e2) {
    System.out.println(e2);
}


%>
</body>
</html>