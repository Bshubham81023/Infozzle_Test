<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	padding: 20px;
	 padding-right: 50px;
	margin-top: 60px;
}





/* Right add-product Section */
        .add-product-section {
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: #FFFFFF;
        }

        .add-product-form {
            width: 70%;
            max-width: 500px;
        }


        .input-group {
            margin-bottom: 20px;
        }

        .input-group input {
            width: 100%;
            height: 40px;
            padding: 10px;
            font-size: 16px;
            color: #818181;
            border: 1px solid #D1D1D1;
            border-radius: 10px;
            box-sizing: border-box;
}

        .add-product-button {
            width: 100%;
            height: 50px;
            background: #7754F6;
            border: none;
            color: #FFFFFF;
            font-size: 16px;
            font-weight: 700;
            border-radius: 10px;
            box-shadow: 0px 15px 30px -10px rgba(119, 84, 246, 0.27);
            cursor: pointer;
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
					style="font-weight: bold; margin-bottom: 30px; padding: 20px;">Insert Product</h2>
					

<!-- Add-Product Section -->
<div class="add-product-section">
    <form class="add-product-form" action="insertProduct" method="post" enctype="multipart/form-data">
        <div class="input-group">
            <input type="text" placeholder="SKU" name="sku" required>
        </div>
        
        <div class="input-group">
            <input type="text" placeholder="Name" name="name" required>
        </div>
        
        <div class="input-group">
            <input type="number" placeholder="Price" name="price" required>
        </div>
        
        <div class="input-group">
            <input type="number" placeholder="Inventory" name="inventory" required>
        </div>
        
        <div class="input-group">
            <input type="file" name="image" accept="image/*" required>
        </div>
        <button type="submit" class="add-product-button">Create Product</button>
    </form>
</div>			

		
		
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