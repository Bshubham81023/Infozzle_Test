<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.ConnectionProvider" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Products</title>

<!-- Bootstrap CSS -->
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
    padding: 50px;
}

.sidebar h1 {
    font-size: 30px;
    margin-top: 60px;
    margin-bottom: 40px;
    font-weight: bold;
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

/* Centering the heading */
h2 {
    text-align: center;
    font-weight: bold;
    margin-bottom: 30px;
    padding: 20px;
}

/* Styling the product section */
.product-section {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px; /* Added space between product cards */
    background: #FFFFFF;
    padding: 20px;
}

/* Product card styling */
.product-card {
    width: 220px;
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 10px;
    text-align: center;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    background: #fff;
    margin-bottom: 20px; /* Added space between rows */
}

/* Image container */
.image-container {
    width: 100%;
    height: 150px;
    background-color: #f0f0f0;
    border-radius: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid #ccc;
}

.image-container img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 5px;
}

/* Separator */
.separator {
    width: 100%;
    height: 1px;
    background: #ddd;
    margin: 10px 0;
}

.product-card h5 {
    color: blue;
    margin-top: 10px;
    font-size: 16px;
}

.product-card p {
    color: black;
    font-size: 14px;
    font-weight: bold;
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
                <li><a href="all-products.jsp">All Products</a></li>
                <li><a href="logout">Sign Out</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 main-content">
            <h2>All Products</h2>

            <!-- Product Section -->
            <div class="product-section">
                <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    conn = ConnectionProvider.getCon();
                    stmt = conn.createStatement();
                    String sql = "SELECT id, sku, image, name, price FROM products";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String sku = rs.getString("sku");
                        String name = rs.getString("name");
                        String price = rs.getString("price");
                %>
                <div class="product-card">
                    <div class="image-container">
                        <img src="getImage?id=<%= id %>" alt="Product Image">
                    </div>
                    <div class="separator"></div>
                    <h5><%= name %></h5>
                    <p>Price: ₹<%= price %></p>
                </div>
                <%
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                %>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
