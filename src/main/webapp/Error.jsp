<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error!</title>
<link rel="stylesheet" href="BaseStyle.css">
<link rel="icon" type="image/png" href="favicon-dark.png" media="(prefers-color-scheme: dark)">
<link rel="icon" type="image/png" href="favicon-light.png" media="(prefers-color-scheme: light)">
</head>
<style>
	body {
  		display: flex;
  		align-items: center;
  		justify-content: center;
  		flex-direction: column;
  		background: rgba(112, 234, 239, 0.13); 
  		color: rgba(54, 120, 121, .67); 
	}
</style>
<body>
	<h2>${ErrorString}</h2>
</body>
</html>