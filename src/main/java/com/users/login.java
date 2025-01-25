package com.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.ConnectionProvider;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
		String email = request.getParameter("lemail");
		out.println(email);
        String password = request.getParameter("lpass");
        out.println(password);
        Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
        try {
        	con = ConnectionProvider.getCon();
        	
        	if (con != null) {
        		
        		 String query = "SELECT * FROM users WHERE email = ? AND password = ?";
                 pst = con.prepareStatement(query);
                 pst.setString(1, email);
                 pst.setString(2, password);

                 rs = pst.executeQuery();
                 
                 if (rs.next()) {
                	    HttpSession session = request.getSession();
                	    session.setAttribute("user", rs.getString("first_name"));
                	    response.sendRedirect("dashboard.jsp");
                	} else {
                	    // Add a query parameter to indicate an error
                	    response.sendRedirect("login.jsp?error=invalid");
                	}


                 rs.close();
                 pst.close();
                 con.close();
                 
        	}else {
        		out.println("Check JDBC Connectivity");
        	}
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
