<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Flower Shop Admin</title>
    <style>
        :root {
            --primary-color: #d6336c;
            --secondary-color: #f06595;
            --accent-color: #ffdeeb;
            --bg-color: #fff8f8;
            --text-color: #444;
            --light-text: #777;
            --dark-bg: #343a40;
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            line-height: 1.6;
            display: flex;
        }
        .sidebar {
            width: 250px;
            background-color: white;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
            height: 100vh;
            padding: 20px;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
        }
        .logo-text {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 30px;
        }
        .nav-links {
            list-style: none;
            padding: 0;
        }
        .nav-links li {
            margin-bottom: 20px;
        }
        .nav-links a {
            text-decoration: none;
            color: var(--text-color);
            font-weight: 500;
            transition: color 0.3s;
            cursor: pointer;
        }
        .nav-links a:hover {
            color: var(--primary-color);
        }
        .dashboard {
            margin-left: 250px;
            padding: 40px 20px;
            flex: 1;
        }
        .cards > div {
            display: none;
        }
        .cards > div.active {
            display: block;
        }
        .card {
            background-color: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease;
            text-align: center;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card h3 {
            margin-bottom: 10px;
            color: var(--primary-color);
        }
        .card p {
            color: var(--light-text);
            font-size: 0.95rem;
        }
    </style>
</head>
<body>
    <aside class="sidebar">
        <div class="logo-text">Flower Shop Admin</div>
        <ul class="nav-links">
            <li><a onclick="showSection('dashboard')">Dashboard</a></li>
            <li><a onclick="showSection('products')">Products</a></li>
            <li><a onclick="showSection('orders')">Orders</a></li>
            <li><a onclick="showSection('customers')">Customers</a></li>
            <li><a onclick="showSection('categories')">Categories</a></li>
        </ul>
    </aside>
    <main class="dashboard">
        <div class="cards">
            <div id="dashboard" class="card active">
                <h3>Welcome, Admin</h3>
                <p>This is your dashboard overview.</p>
            </div>
            <div id="products" class="card">
                <h3>Products</h3>
                <p>Manage your flower products.</p>
            </div>
            <div id="orders" class="card">
                <h3>Orders</h3>
                <p>Track and manage customer orders.</p>
            </div>
            <div id="customers" class="card">
                <h3>Customers</h3>
                <p>View and manage customer data.</p>
            </div>
            <div id="categories" class="card">
                <h3>Categories</h3>
                <p>Organize product categories.</p>
            </div>
        </div>
    </main>
    <script>
        function showSection(id) {
            document.querySelectorAll('.cards > div').forEach(div => {
                div.classList.remove('active');
            });
            document.getElementById(id).classList.add('active');
        }
    </script>
</body>
</html>