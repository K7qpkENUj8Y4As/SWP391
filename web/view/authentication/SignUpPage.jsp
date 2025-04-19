<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Sign Up</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <style>
    body {
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: Arial, sans-serif;
      background-image: url('images/backgroundFlowerShop.jsp');
      background-size: cover;
      background-position: center;
      margin: 0;
    }

    .container-custom {
      background-color: white;
      border-radius: 30px;
      padding: 0;
      max-width: 1000px;
      min-height: 80vh;
      width: 80%;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
      overflow: hidden;
    }

    .right-panel {
      background-color: #d291bc;
      border-bottom-left-radius: 100% 100%;
      min-height: 80vh;
    }

    .signup-form h2,
    .signin-box h2 {
      font-weight: bold;
    }

    .form-icon {
      width: 40px;
      text-align: center;
    }

    .form-control::placeholder {
      font-size: 0.95rem;
    }

    .signup-btn {
      background-color: #d291bc;
      color: white;
      font-weight: bold;
    }

    .signup-btn:active {
      background-color: #ffeee8;
      color: #000;
      /* Tuỳ chọn: đổi chữ cho dễ nhìn */
    }

    .signup-btn:hover {
      background-color: #ffeee8;
      color: #000;
      /* Tuỳ chọn: đổi chữ cho dễ nhìn */
    }

    .signin-box button:active {
      background-color: #ffeee8;
    }

    .signin-box button:hover {
      background-color: #ffeee8;
    }

    .signin-box button {
      background-color: #fff;
      font-weight: bold;
    }

    @media (max-width: 768px) {
      .right-panel {
        border-radius: 0;
        min-height: 10vh;
      }
    }
  </style>
</head>

<body>
  <div class="container container-custom shadow">
    <div class="row">
      <!-- Sign Up Form -->
      <div class="col-md-6 p-5 d-flex flex-column justify-content-center align-items-center">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp" alt="logo" style="max-width: 140px;">         
        <h4 class="mb-4">Please join with us</h4>
        <form class="w-100" style="max-width: 300px;" action="register" method="post">
            <div class="input-group mb-3">
                <span class="input-group-text form-icon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" placeholder="Username" name="username" required>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text form-icon"><i class="fa fa-envelope"></i></span>
                <input type="email" class="form-control" placeholder="Email" name="email" required>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text form-icon"><i class="fa fa-location-dot"></i></span>
                <input type="text" class="form-control" placeholder="Address" name="address">
            </div>                            
            <div class="input-group mb-3">
                <span class="input-group-text form-icon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" placeholder="Password" name="password" required>
            </div>
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) {%>
            <div class="alert alert-danger w-100 text-center" style="max-width: 300px;">
                <%= error%>
            </div>
            <% }%>

            <button type="submit" class="btn signup-btn w-100 mt-3">SIGN UP</button>
        </form>
      </div>

      <!-- Right Panel -->
      <div class="col-md-6 right-panel text-center d-flex flex-column justify-content-center align-items-center p-5">
        <div class="signin-box">
          <h2 class="text-white mb-4">ONE OF US?</h2>
          <button class="btn"><a href="Login.jsp" style="text-decoration: none;color: black">SIGN IN</a></button>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>