<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Profile Page</title>
	<link rel="stylesheet" href="styles.css">
</head>
<body>
	<div class="form-header">
		<% String username = request.getParameter("username"); %>
		<h1>Welcome   <% out.println(username); %> User! You have logged in.</h1>	
	</div>
	<div class="form-footer">
			<span>Forgot your password ?</span>
  			<a href="Login.html"><button type="submit" id="submitBtn" class="btn">Logout</button></a>
	</div>
</body>
</html>