package com.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public signup() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);

		res.setContentType("text/html");
		PrintWriter p = res.getWriter();

		// Get form parameters
		String firstName = req.getParameter("fname");
		String lastName = req.getParameter("lname");
		String email = req.getParameter("semail");
		String password = req.getParameter("spass");

		// Validate data (You can enhance this validation as per your requirements)
		if (firstName == null || lastName == null || email == null || password == null || firstName.isEmpty()
				|| lastName.isEmpty() || email.isEmpty() || password.isEmpty()) {
			res.getWriter().write("All fields are required.");
			return;
		}
		
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = com.db.ConnectionProvider.getCon();

			String query = "INSERT INTO users (first_name, last_name, email, password) VALUES (?, ?, ?, ?)";
			pst = con.prepareStatement(query);
			pst.setString(1, firstName);
			pst.setString(2, lastName);
			pst.setString(3, email);
			pst.setString(4, password);

			int rowCount = pst.executeUpdate();

		
			 if (rowCount > 0) {
	                res.sendRedirect("login.jsp");
	            } else {
	            	res.sendRedirect("signin.jsp");
	                
	            }

			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
