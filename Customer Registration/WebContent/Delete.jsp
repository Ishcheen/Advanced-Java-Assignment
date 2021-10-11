<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import= "com.assignment.partC.SearchField" %>
<%@page import="javax.servlet.ServletContext"%>
<%
	String id=request.getParameter("id");
	int no=Integer.parseInt(id);
	String value=null;
	try{
		Class.forName("org.postgresql.Driver");
		Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "Ishita@99");
		Statement st=conn.createStatement();
		int i=st.executeUpdate("DELETE FROM party WHERE partyid="+no);
		value=session.getAttribute("search").toString(); %>
		<jsp:forward page="SearchField">
	    	<jsp:param name="search" value="${value}"/>
		</jsp:forward>
	<%}
	catch(Exception e){
		System.out.print(e);
		e.printStackTrace();
	}
%>
