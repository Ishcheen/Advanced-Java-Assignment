package com.assignment.partC;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PreparedStatement p= null;
		ResultSet rs=null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out=response.getWriter();  
		if(username.isEmpty() || password.isEmpty() ){
			RequestDispatcher req = request.getRequestDispatcher("Login.html");
			req.include(request, response);
		}
		else
		{
			try {
				Class.forName("org.postgresql.Driver");
				Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "Ishita@99");
				String sql="select * from party as p join userlogin as u on p.partyid=u.partyid where u.userloginid='"+username+"' and u.password='"+password+"'";
				
				p=conn.prepareStatement(sql);
				rs=p.executeQuery();
				
				
				
				if(rs.next() && username.equals(rs.getString("userloginid")) && password.equals(rs.getString("password"))) {
					RequestDispatcher req = request.getRequestDispatcher("Profile.jsp");
					req.forward(request, response);
				}
				else{
					out.println("UserId or password didn't match.");
					RequestDispatcher req = request.getRequestDispatcher("/Login.html");
					req.forward(request, response);
				}
			} catch (SQLException | ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
