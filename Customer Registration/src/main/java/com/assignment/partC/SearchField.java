package com.assignment.partC;

import com.assignment.partC.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchField2
 */
@WebServlet("/SearchField")
public class SearchField extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchField() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String value=null;
		if(session.getAttribute("search")==null) {
		  value=request.getParameter("search"); 
		} else {
		  value=session.getAttribute("search").toString(); 
		 }
		 		
		if(value==null || value==""){
			RequestDispatcher req = request.getRequestDispatcher("SearchPage.jsp");
			req.include(request, response);
		}
		else{
			ArrayList<User> output=search(value);
			session.setAttribute("search", value);
			request.setAttribute("data", output);
			RequestDispatcher req = request.getRequestDispatcher("SearchPage.jsp");
             req.forward(request, response);
		}
	}
	public static ArrayList<User> search(String value) {
		PostgreSqlJDBC obj_connection=new PostgreSqlJDBC();
		Connection connection=obj_connection.connect();
		PreparedStatement p= null;
		ResultSet rs=null;
		ArrayList<User> list = new ArrayList<User>();
		try {
			
			String sql="select * from party where LOWER(firstname)= LOWER('"+value+"')"+"or LOWER(lastname)= LOWER('"+value+"')";
			p=connection.prepareStatement(sql);
			rs=p.executeQuery();
			while(rs.next()) {
                
				User temp=new User();
                temp.setPartyId(rs.getInt("partyid"));
                temp.setFirstname(rs.getString("firstname"));
                temp.setLastname(rs.getString("lastname"));
                temp.setAddress(rs.getString("address"));
                temp.setCity(rs.getString("city"));
                temp.setCountry(rs.getString("country"));
                temp.setState(rs.getString("state"));
                temp.setPhone(rs.getString("phone"));
                temp.setZip(rs.getInt("zip"));
                list.add(temp);
               
            }
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}

}
