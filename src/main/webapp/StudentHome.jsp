<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <title>ONLINE COURSE MANAGEMENT</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      html, body {
      display: flex;
      justify-content: center;
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      }
      form {
      border: 5px solid #f1f1f1;
      }
      input[type=text]{
      width: 100%;
      padding: 16px 8px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
      } 
      button {
      background-color: #8ebf42;
      color: white;
      padding: 14px 0;
      margin: 10px 0;
      border: none;
      cursor: grabbing;
      width: 100%;
      }
      h1 {
      text-align:center;
      font-size:18;
      }
      button:hover {
      opacity: 0.8;
      }
      .formcontainer {
      text-align: left;
      margin: 24px 50px 12px;
      }
      .container {
      padding: 16px 0;
      text-align:left;
      }
      span.psw {
      float: right;
      padding-top: 0;
      padding-right: 15px;
      }
      /* Change styles for span on extra small screens */
      @media screen and (max-width: 300px) {
      span.psw {
      display: block;
      float: none;
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
  
    <form action="enroll" method="post">
      <h1>Enroll Into Course</h1>
      <div class="formcontainer">
      <hr/>
      <div class="container">
      	<!-- <!-- <label for="uname"><strong>Username</strong></label>
        <input type="text" placeholder="Enter Username" name="uname" required>
        <label for="mail"><strong>Email</strong></label>
        <input type="email" placeholder="Enter Teacher Email" name="ctmail" required> --> 
      	<label for="ctitle"><strong>Course Title</strong></label>
        <input type="text" placeholder="Enter Course Title" name="ctitle" required>
        <label for="ccode"><strong>Course Code</strong></label>
        <input type="text" placeholder="Enter Course Code" name="ccode" required>
      </div>
      <button type="submit">Enroll</button>
    </form>
  </body>
</html>