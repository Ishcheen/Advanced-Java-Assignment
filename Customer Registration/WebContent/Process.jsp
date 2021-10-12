<%@ page import = "java.io.*,java.util.*" %>
<%@ page import= "com.assignment.partC.Insert_values" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
		<%
			String firstname=request.getParameter("fname");
			String lastname=request.getParameter("lastname");
			String address=request.getParameter("address");
			String city=request.getParameter("city");
			String country=request.getParameter("country");
			String state=request.getParameter("state");
			int zip=Integer.parseInt(request.getParameter("zip"));
			String phone=request.getParameter("phone");
			
			
			Insert_values.insert(firstname,lastname,address,city,zip,country,state,phone);
		%>
</body>
</html>
