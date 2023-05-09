<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <title>ONLINE COURSE MANAGEMENT</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet"> 
    <!-- style.css apply korle duita stylesheet overlap hoye jacche -->
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
      input[type=text], input[type=email] {
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
    <form action="add course" method="post">
      <h1>Add Course</h1>
      <div class="formcontainer">
      <hr/>
      <div class="container">
      	<label for="ctitle"><strong>Course Title</strong></label>
        <input type="text" placeholder="Enter Course Title" name="ctitle" required>
        <label for="ccode"><strong>Course Code</strong></label>
        <input type="text" placeholder="Enter Course Code" name="ccode" required>
        <label for="ccredit"><strong>Course Code</strong></label><br>
        <br>
		<select name="ccredit" id="credit">
  			<option value=1>1</option>
  			<option value=1.5>1.5</option>
  			<option value=2>2</option>
  			<option value=3>3</option>
  			<option value=4>4</option>
		</select><br>
		<br>
      	<label for="ctname"><strong>Teacher Name</strong></label>
        <input type="text" placeholder="Enter Teacher Name" name="ctname" required>
        <label for="ctmail"><strong>Teacher Email</strong></label>
        <input type="email" placeholder="Enter Teacher Email" name="ctmail" required>
      </div>
      <button type="submit">Add</button>
    </form>
  </body>
</html>