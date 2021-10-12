package com.assignment.partC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class Insert_values {
//	public static void main(String[] args) {
//		Insert_values.insert("","","","",90,"","","");
//	}
	public static void insert(String firstname, String lastname, String address, String city,int zip, String country, String state, String phone) {
		PostgreSqlJDBC obj_connection=new PostgreSqlJDBC();
		Connection connection=obj_connection.connect();
		PreparedStatement statement= null;
		try {
			
			String query="insert into party(firstname,lastname,address,city,zip, country, state, phone) values(?,?,?,?,?,?,?,?)";
			statement=connection.prepareStatement(query);
			statement.setString(1, firstname);
			statement.setString(2, lastname);
			statement.setString(3, address);
			statement.setString(4, city);
			statement.setInt(5, zip);
			statement.setString(6, country);
			statement.setString(7, state);
			statement.setString(8, phone);
	
			int j= statement.executeUpdate();
			System.out.println(j);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
