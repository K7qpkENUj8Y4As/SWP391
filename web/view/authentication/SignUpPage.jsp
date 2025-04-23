<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<<<<<< HEAD
<<<<<<< HEAD
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        html, body {
            height: 100%;
            margin: 0;
        }

        body {
            font-family: Arial, sans-serif;
        }

        .signup-btn {
            background-color: #d291bc;
            color: white;
            font-weight: bold;
        }

        .signup-btn:hover,
        .signup-btn:active {
            background-color: #ffeee8;
            color: #000;
        }

        .signin-box button {
            background-color: #fff;
            font-weight: bold;
        }

        .signin-box button:hover,
        .signin-box button:active {
            background-color: #ffeee8;
        }

        .right-panel {
            background-color: #d291bc;
        }

        .form-icon {
            width: 40px;
            text-align: center;
        }

        .form-control::placeholder {
            font-size: 0.95rem;
        }

        .home-link {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #d291bc;
            color: white;
            padding: 10px 20px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: bold;
        }

        .home-link:hover {
            background-color: #ffeee8;
            color: #000;
        }
    </style>
</head>

<body>
    <!-- Home button -->
    <a class="home-link" href="${pageContext.request.contextPath}/home">&larr; HOME</a>

    <div class="container-fluid h-100">
        <div class="row h-100">
            <!-- Sign Up Form -->
            <div class="col-md-6 d-flex flex-column justify-content-center align-items-center p-5">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp" alt="logo" style="max-width: 140px;">
                <h4 class="mb-4">Please join with us</h4>
                <form class="w-100" style="max-width: 400px;" action="register" method="post">
                    <div class="input-group mb-3">
                        <span class="input-group-text form-icon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" placeholder="Firstname" name="firstname" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text form-icon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" placeholder="Lastname" name="lastname" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text form-icon"><i class="fa fa-phone"></i></i></span>
                        <input type="email" class="form-control" placeholder="Phone" name="phone" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text form-icon"><i class="fa fa-envelope"></i></span>
                        <input type="email" class="form-control" placeholder="Email" name="email" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text form-icon"><i class="fa fa-lock"></i></span>
                        <input type="password" class="form-control" placeholder="Password" name="password" required>
                    </div>

                    <% String error = (String) request.getAttribute("error"); %>
                    <% if (error != null) { %>
                    <div class="alert alert-danger w-100 text-center" style="max-width: 300px;">
                        <%= error %>
                    </div>
                    <% } %>

                    <button type="submit" class="btn signup-btn w-100 mt-3">SIGN UP</button>
                </form>
            </div>

            <!-- Right Panel -->
            <div class="col-md-6 right-panel d-flex flex-column justify-content-center align-items-center text-center p-5">
                <div class="signin-box">
                    <h2 class="text-white mb-4">ONE OF US?</h2>
                    <a href="Login.jsp" class="btn btn-light fw-bold">SIGN IN</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

=======
<html>
  <head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
    <section class="vh-100 gradient-custom">
      <div class="container py-5 h-100">
        <div class="row justify-content-center align-items-center h-100">
          <div class="col-12 col-lg-9 col-xl-7">
            <div class="card shadow-2-strong" style="border-radius: 15px;">
              <div class="card-body p-4 p-md-5">
                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">New Account Register</h3>
                <form>
=======
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
      background-image: url('images/image002.jpg');
      background-size: cover;
      background-position: center;
      margin: 0;
    }
>>>>>>> ef74567 (update SignUpPage)

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
        <h2 class="mb-4">Sign Up</h2>
        <form class="w-100" style="max-width: 300px;">
          <div class="input-group mb-3">
            <span class="input-group-text form-icon"><i class="fa fa-user"></i></span>
            <input type="text" class="form-control" placeholder="Username">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text form-icon"><i class="fa fa-envelope"></i></span>
            <input type="email" class="form-control" placeholder="Email">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text form-icon"><i class="fa fa-location-dot"></i></span>
            <input type="text" class="form-control" placeholder="Address">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text form-icon"><i class="fa fa-lock"></i></span>
            <input type="password" class="form-control" placeholder="Password">
          </div>
          <button type="submit" class="btn signup-btn w-100 mt-3">SIGN UP</button>
        </form>
      </div>

      <!-- Right Panel -->
      <div class="col-md-6 right-panel text-center d-flex flex-column justify-content-center align-items-center p-5">
        <div class="signin-box">
          <h2 class="text-white mb-4">ONE OF US?</h2>
          <button class="btn">SIGN IN</button>
        </div>
      </div>
<<<<<<< HEAD
    </section>
  </body>
>>>>>>> f495d42 (Fix login bug and update folder structure)
</html>
=======
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
>>>>>>> ef74567 (update SignUpPage)
