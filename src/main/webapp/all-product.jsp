<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<!-- Bootstrap CSS -->
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
	text-align: center; 
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
				<div
					style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
					<h2 class="text-left" style="font-weight: bold;">All Products</h2>
					<a class="btn btn-primary" href="add-product.jsp" role="button">Create
						Product</a>
				</div>

				<table class="table">
					<thead class="thead-light">
						<tr>
							<th>SKU</th>
							<th scope="col">Image</th>
							<th scope="col">Name</th>
							<th scope="col">Price</th>
							<th scope="col">Inventory</th>
							<th scope="col">Date</th>
						</tr>
					</thead>
					<tbody>
						<%
						Connection conn = null;
						Statement stmt = null;
						ResultSet rs = null;

						try {

							conn = com.db.ConnectionProvider.getCon();
							stmt = conn.createStatement();
							String sql = "SELECT id,sku, image, name, price, inventory, date FROM products";
							rs = stmt.executeQuery(sql);

							while (rs.next()) {
								int id = rs.getInt("id");
								String sku = rs.getString("sku");
								String imageUrl = rs.getString("image");
								String name = rs.getString("name");
								String price = rs.getString("price");
								String inventory = rs.getString("inventory");
								String date = rs.getString("date");

								System.out.println(id);
						%>
						<tr>
							<td><%=sku%></td>
							<td><img src="getImage?id=<%=rs.getInt("id")%>"
								alt="Product Image" style="width: 50px; height: 50px;"></td>



							<td><%=name%></td>
							<td><%=price%></td>
							<td><%=inventory%></td>
							<td><%=date%></td>
						</tr>
						<%
						}
						} catch (Exception e) {
						out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
						} finally {
						try {
						if (rs != null)
							rs.close();
						if (stmt != null)
							stmt.close();
						if (conn != null)
							conn.close();
						} catch (SQLException ex) {
						ex.printStackTrace();
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


