<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <!DOCTYPE html>
    <html>
        <head>
            <title>ONLINE COURSE MANAGEMENT SYSTEM</title>
            <link rel="stylesheet" href="Style2.css">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
        </head>
        <body>
            <header id="head">
                <h1 class="wlc">Online Course Management System</h1>
                <ul id="nav">
                    <li class="type"><strong>Admin Section</strong></li>  
                    <li><a class = "actv" href="adminHome.jsp">Add Course</a></li>
                    <li><a href="addedCourses.jsp">Added Courses</a></li>
                    <li><a href="login.jsp">Logout</a></li>
                </ul>
            </header>
            <div id="main">
                <form action="add course" method="post">
                    <h1 class="fh">Add Course</h1>
                    <div class="formcontainer">
                        <hr/>
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
                        <button type="submit">Add</button>
                    </div>
                </form>
            </div>
        </body>
    </html>