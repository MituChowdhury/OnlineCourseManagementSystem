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

        	/* If user tries to access a page without logging in */
        
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
                <li><a class="actv" href="AdminHome.jsp">Add Course</a></li>
                <li><a href="TeacherList.jsp">View Teachers</a></li>
                <li><a href="CourseList.jsp">View Courses</a></li>
                <li><button onclick="document.location='Login.jsp'" onclick=>Logout</button></li>
            </ul>
        </header>
        <div id="main">
            <form class="frm" action="add course" method="post">
                <h1 class="fh">Add Course</h1>
                <div class="formcontainer">
                    <hr>
                    <div class="container">
                        <label for="ctitle" class="bold">Course Title</label>
                        <input type="text" placeholder="Enter Course Title" name="ctitle" required>
                        <label for="ccode" class="bold">Course Code</label>
                        <input type="text" placeholder="Enter Course Code" name="ccode" required>
                        <label for="ccredit" class="bold">Course Credit</label>
                        <select name="ccredit" id="credit">
                            <option value=1>1</option>
                            <option value=1.5>1.5</option>
                            <option value=2>2</option>
                            <option value=3>3</option>
                            <option value=4>4</option>
                        </select>
                        <label for="ctname" class="bold">Teacher Name</label>
                        <input type="text" placeholder="Enter Teacher Name" name="ctname" required>
                        <label for="ctmail" class="bold">Teacher Email</label>
                        <input type="email" placeholder="Enter Teacher Email" name="ctmail" required>
                    </div>
                    <button class="btn" type="submit">Add</button>
                </div>
            </form>
        </div>
    </body>
</html>