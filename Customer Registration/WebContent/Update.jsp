<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
<%
	String id = request.getParameter("id");
	System.out.println(id);
	String driver = "org.postgresql.Driver";
	String connectionUrl = "jdbc:postgresql://localhost:5432/";
	String database = "postgres";
	String userid = "postgres";
	String password = "Ishita@99";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;	
	ResultSet resultSet = null;
%>
<%
	try{
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
		statement=connection.createStatement();
		String sql ="select * from party where partyid="+id;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
	
	<form class="signup-form" method="post" action="UpdateProcess.jsp">
	<div class="form-header">
		<h1>Update data</h1>
	</div>
	<div class="form-body">
		<input type="hidden" name="id" value="<%=resultSet.getString("partyid") %>">
		<br>
		<div class="form-group">
			First name:<br>
			<input type="text" class="form-input" name="firstname" value="<%=resultSet.getString("firstname") %>">
		</div>
		<div class="form-group">
			Last name:<br>
			<input type="text" class="form-input" name="lastname" value="<%=resultSet.getString("lastname") %>">
		</div>
		<div class="form-group">
			Address:<br>
			<input type="text" class="form-input" name="address" value="<%=resultSet.getString("address") %>">
		</div>
		<div class="form-group">
			City:<br>
			<input type="text" class="form-input" name="city" value="<%=resultSet.getString("city") %>">
		</div>
		<div class="form-group">
			PinCode:<br>
		<input type="text" class="form-input" name="zip" value="<%=resultSet.getString("zip") %>">
		</div>
		<div class="form-group">
			Country:<br>
			<input type="text" class="form-input" name="country" value="<%=resultSet.getString("country") %>">
		</div>
		<div class="form-group">
			State:<br>
			<input type="text" class="form-input" name="state" value="<%=resultSet.getString("state") %>">
		</div>
		<div class="form-group">
			Phone no.:<br>
			<input type="text" class="form-input" name="phone" value="<%=resultSet.getString("phone") %>">
		</div>
	</div>
	<div class="form-footer">
  		<button type="submit" id="submitBtn" class="btn">Submit</button>
	</div>
	
	
	</form>
	<%
	}
	connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>
