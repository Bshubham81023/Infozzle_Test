<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	margin: 0;
	font-family: 'Inter', sans-serif;
	height: 100vh;
	width: 100vw;
}

.sidebar {
	background-color: #1E90FF;
	color: white;
	height: 100vh;
	padding: 50px;
}

.sidebar h1 {
	font-size: 30px;
	margin-top: 60px;
	margin-bottom: 40px;
	font-family: bold;
}

.sidebar ul {
	list-style: none;
	padding: 0;
	font-family: bold;
}

.sidebar ul li {
	margin: 15px 0;
}

.sidebar ul li a {
	color: white;
	text-decoration: none;
	font-size: 20px;
}

.sidebar ul li a:hover {
	text-decoration: underline;
}

.main-content {
	padding: 30px;
	padding-right: 50px;
	margin-top: 60px;
}

table {
	border-collapse: collapse;
	border: none;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1), 0px 4px 6px
		rgba(0, 0, 0, 0.1), 4px 0px 6px rgba(0, 0, 0, 0.1), -4px 0px 6px
		rgba(0, 0, 0, 0.1);
	text-align: center; /* Centers the content inside the table cells */
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<div class="col-md-3 sidebar">
				<h1>Dashboard</h1>
				<ul>
					<li><a href="all-users.jsp">All Users</a></li>
					<li><a href="all-product.jsp">All Products</a></li>
					<li><a href="logout">Sign Out</a></li>
				</ul>
			</div>

			<!-- Main Content -->
			<div class="col-md-9 main-content">
				<h2 class="text-left"
					style="font-weight: bold; margin-bottom: 30px;">All Users</h2>

				<table class="table">
					<thead class="thead-light">
						<tr>
							<th>ID</th>
							<th>First</th>
							<th>Last</th>
							<th>Email</th>
						</tr>
					</thead>
					<tbody>
						<%
						Connection con = null;
						PreparedStatement pst = null;
						ResultSet rs = null;

						int pageNumber = 1; // Variable for the current page
						int recordsPerPage = 10; // Number of records per page

						if (request.getParameter("page") != null) {
							pageNumber = Integer.parseInt(request.getParameter("page"));
						}

						int start = (pageNumber - 1) * recordsPerPage;

						try {

							con = com.db.ConnectionProvider.getCon();

							// Fetch paginated records
							String query = "SELECT id, first_name, last_name, email FROM users LIMIT ?, ?";
							pst = con.prepareStatement(query);
							pst.setInt(1, start);
							pst.setInt(2, recordsPerPage);
							rs = pst.executeQuery();

							while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getInt("id")%></td>
							<td><%=rs.getString("first_name")%></td>
							<td><%=rs.getString("last_name")%></td>
							<td><%=rs.getString("email")%></td>
						</tr>
						<%
						}

						// Calculate total pages
						String countQuery = "SELECT COUNT(*) AS total FROM users";
						pst = con.prepareStatement(countQuery);
						rs = pst.executeQuery();

						int totalRecords = 0;
						if (rs.next()) {
						totalRecords = rs.getInt("total");
						}

						int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
						%>
					</tbody>
				</table>

				<!-- Pagination -->
				<nav>
					<ul class="pagination">
						<%
						for (int i = 1; i <= totalPages; i++) {
						%>
						<li class="page-item <%=(i == pageNumber) ? "active" : ""%>">
							<a class="page-link" href="dashboard.jsp?page=<%=i%>"><%=i%></a>
						</li>
						<%
						}
						%>
					</ul>
				</nav>
				<%
				} catch (Exception e) {
				e.printStackTrace();
				%>
				<tr>
					<td colspan="4" class="text-danger">Error fetching data from
						the database.</td>
				</tr>
				<%
				} finally {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
				if (con != null)
					con.close();
				}
				%>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>






<%--  


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO users (first_name, last_name, email) VALUES
('Mark', 'Otto', '@mdo'),
('Jacob', 'Thornton', '@fat'),
('Larry', 'The Bird', '@twitter');



<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            height: 100vh;
            width: 100vw;
        }

        .sidebar {
            background-color: #1E90FF;
            color: white;
            height: 100vh;
            padding: 35px;
        }

        .sidebar h1 {
            font-size: 30px;
            margin-top: 60px;
            margin-bottom: 40px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 15px 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 20px;
        }

        .sidebar ul li a:hover {
            text-decoration: underline;
        }

        .main-content {
            padding: 20px;
            margin-top: 60px;
        }

        table {
            border-collapse: collapse;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 sidebar">
                <h1>Dashboard</h1>
                <ul>
                    <li><a href="#">All Users</a></li>
                    <li><a href="#">All Products</a></li>
                    <li><a href="#">Sign Out</a></li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 main-content">
                <h2 class="text-left" style="font-weight: bold; margin-bottom: 30px;">All Users</h2>

                <table class="table">
                    <thead class="thead-light">
                        <tr>
                            <th>ID</th>
                            <th>First</th>
                            <th>Last</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection conn = null;
                            Statement stmt = null;
                            ResultSet rs = null;

                            try {
                                // Database connection
                                String dbURL = "jdbc:mysql://localhost:3306/your_database_name";
                                String username = "root";
                                String password = "your_password";

                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conn = DriverManager.getConnection(dbURL, username, password);
                                stmt = conn.createStatement();

                                String query = "SELECT id, first_name, last_name, email FROM users";
                                rs = stmt.executeQuery(query);

                                while (rs.next()) {
                                    int id = rs.getInt("id");
                                    String firstName = rs.getString("first_name");
                                    String lastName = rs.getString("last_name");
                                    String email = rs.getString("email");
                        %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= firstName %></td>
                            <td><%= lastName %></td>
                            <td><%= email %></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                        %>
                        <tr>
                            <td colspan="4" class="text-danger">Error fetching data from the database.</td>
                        </tr>
                        <%
                            } finally {
                                try {
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


--%>
