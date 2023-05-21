<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Online Course Management System</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="BaseStyle.css">
        <link rel="icon" type="image/png" href="favicon-dark.png" media="(prefers-color-scheme: dark)">    
	    <link rel="icon" type="image/png" href="favicon-light.png" media="(prefers-color-scheme: light)">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    </head>
    <body>
    
        <%
        
        	/* clears the cache */
        
    		response.setHeader("cache-control", "no-cache no-store must-revalidate");

        	/* If user tries to access a page without logging in 
        	   then they will be redirected to the login page */
        
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
				<li><a class="actv" href="StudentHome.jsp">Enroll</a></li>
			    <li><a href="EnrolledCourseList.jsp">My Courses</a></li>
				<li><a href="CourseList.jsp">View Courses</a></li>
				<li><button onclick="document.location='Login.jsp'">Logout</button></li>
			</ul>
	    </header>
	    
        <div id="main">
            <form class="frm" action="enroll" method="post">
                <h1 class="fh">Enroll into Course</h1>
                <div class="formcontainer">
                    <hr>
                    <div class="container">
                        <label for="ctitle" class="bold">Course Title</label>
                        <input type="text" placeholder="Enter Course Title" name="ctitle" required>
                        <label for="ccode" class="bold">Course Code</label>
                        <input type="text" placeholder="Enter Course Code" name="ccode" required>
                    </div>
                    <button class="btn" type="submit">Enroll</button>
                </div>
            </form>
        </div>
    </body>
</html>