<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "org.postgresql.Driver";%>
<%!String url = "jdbc:postgresql://localhost:5432/postgres";%>
<%!String user = "postgres";%>
<%!String psw = "Ishita@99";%>
<%
	String id = request.getParameter("id");
	System.out.println(id);
	String firstname=request.getParameter("firstname");
	String lastname=request.getParameter("lastname");
	String address=request.getParameter("address");
	String city=request.getParameter("city");
	int zip=Integer.valueOf(request.getParameter("zip"));
	String country=request.getParameter("country");
	String state=request.getParameter("state");
	String phone=request.getParameter("phone");
	if(id != null)
	{
		Connection con = null;
		PreparedStatement ps = null;
		int partyId = Integer.parseInt(id);
		System.out.println(partyId);
		try{
			Class.forName(driverName);
			con = DriverManager.getConnection(url,user,psw);
			String sql="Update party set partyid=?,firstname=?,lastname=?,address=?,city=?,zip=?,country=?,state=?,phone=? where partyid="+partyId;
			ps = con.prepareStatement(sql);
			ps.setInt(1,partyId);
			ps.setString(2, firstname);
			ps.setString(3, lastname);
			ps.setString(4, address);
			ps.setString(5, city);
			ps.setInt(6, zip);
			ps.setString(7, country);
			ps.setString(8, state);
			ps.setString(9, phone);
			int i = ps.executeUpdate();
			if(i > 0)
			{
				out.print("Record Updated Successfully");
			}
			else
			{
				out.print("There is a problem in updating Record.");
			}
		}
		catch(SQLException sql){
			request.setAttribute("error", sql);
			out.println(sql);
		}
}%>
