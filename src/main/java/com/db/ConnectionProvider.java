package com.db;

import java.sql.*;

public class ConnectionProvider {
	public static Connection getCon() {
		Connection con = null;

		String url = "jdbc:mysql://localhost:3306/infozzle";
        String username = "root";
        String dbPassword = "Java@pas1";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection(url, username, dbPassword);
			
			if (con != null) {
				System.out.println("Connection Done");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;

	}
}
