<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%@ page import= "com.assignment.partC.User" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
<HTML>
		
       <HEAD>
       <TITLE>Select Data From a Database</TITLE>
       </HEAD>
       <BODY>
       		<div id="header">
       			<div class="centered">
            		<form action="SearchField" method="POST">
      					<input type="text" name="search">
      					<button type="submit"><i class="fas fa-search"></i></button>
    				</form>
    			</div>
    		</div>
    		   
			<table class="table">
         		<tr bgcolor="00FF7F">
          		<th><b>Firstname</b></th>
          		<th><b>Lastname</b></th>
          		<th><b>Address</b></th>
          		<th><b>City</b></th>
          		<th><b>Country</b></th>
          		<th><b>State</b></th>
          		<th><b>Pincode</b></th>
          		<th><b>Phone No.</b></th>
         		</tr> 
				<% 	ArrayList<User> list = (ArrayList<User>)request.getAttribute("data");
					if(list!=null)
					{
	        			for(User u:list){
        		%>  
        	 	<tr>
                <td><%=u.getFirstname()%></td>
                <td><%=u.getLastname()%></td>
                <td><%=u.getAddress()%></td>
                <td><%=u.getCity()%></td>
                <td><%=u.getCountry()%></td>
                <td><%=u.getState()%></td>
                <td><%=u.getZip()%></td>
                <td><%=u.getPhone()%></td>
                <td><a href="Update.jsp?id=<%=u.getPartyId() %>"><button type="submit" id="submitBtn" class="btn">Update</button></a></td>
                <td><a href="Delete.jsp?id=<%=u.getPartyId() %>"><button type="submit" id="submitBtn" class="btn">Delete</button></a></td>
            </tr>
            <%}
            	}%>
           </TABLE>
         </BODY>
</HTML>
