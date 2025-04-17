<%-- 
    Document   : Login
    Created on : Apr 16, 2025, 11:54:50 PM
    Author     : admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Lotus Team</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container-login {
            display: flex;
            height: 100vh;
        }

        .login-left {
            flex: 1;
            background-color: #fff;
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .login-left img {
            width: 140px;
            margin-bottom: 20px;
        }

        .login-left h4 {
            margin-bottom: 30px;
            font-weight: bold;
        }

        .form-control {
            border-radius: 10px;
            padding: 12px;
            font-size: 16px;
        }

        .btn-login {
            background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
            border: none;
            color: white;
            font-weight: bold;
            padding: 12px;
            border-radius: 10px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            transition: 0.3s;
        }

        .btn-login:hover {
            opacity: 0.9;
        }

        .login-right {
            flex: 1;
            background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 60px;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .login-right h4 {
            font-weight: bold;
            margin-bottom: 20px;
        }

        .login-right p {
            font-size: 14px;
        }

        .btn-outline-danger {
            border-radius: 8px;
            font-weight: bold;
            padding: 8px 16px;
            border-width: 2px;
        }
    </style>
</head>
<body>

<div class="container-login">
    <!-- Left: Form -->
    <div class="login-left">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp" alt="logo">
        <h4>We are The Lotus Team</h4>

        <form method="post" action="LoginServlet" style="width: 100%; max-width: 320px;">
            <div class="mb-3">
                <input type="text" name="username" class="form-control" placeholder="Username" required>
            </div>

            <div class="mb-3">
                <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>

            <div class="mb-3">
                <button type="submit" class="btn btn-login">LOG IN</button>
            </div>

            <div class="mb-3 text-center">
                <a href="#" class="text-muted" style="font-size: 14px;">Forgot password?</a>
            </div>

            <div class="d-flex justify-content-center align-items-center mt-3">
                <p class="mb-0 me-2">Don't have an account?</p>
                <a href="register.jsp" class="btn btn-outline-danger">CREATE NEW</a>
            </div>
        </form>
    </div>

    <!-- Right: Info -->
    <div class="login-right">
        <h4>We are more than just a company</h4>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
            incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
            exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        </p>
    </div>
</div>

</body>
</html>

