<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to OCMS</title>
        <link rel="stylesheet" href="BaseStyle.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    </head>
    <body>
        <header id="welcome">
            <h1 class="wlc logwlc">Welcome to Online Course Management System</h1>
        </header>
        <div id="main">
            <form action="login" method="post">
                <h1 class="fh">User Login</h1>
                <div class="formcontainer">
                    <hr/>
                    <div class="container">
                        <label for="uname" class="bold">Username</label>
                        <input type="text" placeholder="Enter Username" name="uname" required>
                        <label for="mail" class="bold">E-mail</label>
                        <input type="email" placeholder="Enter E-mail" name="mail" required>
                        <label for="psw" class="bold">Password</label>
                        <input type="password" placeholder="Enter Password" name="psw" required>
                    </div>
                    <button type="submit">Login</button>
                </div>
            </form>
        </div>
        <footer id="foot">
            <p>Made by <span class="bold">Mitu Chowdhury</span> and <span class="bold">Muhammad Saifullah</span></p>
        </footer>
    </body>
</html>