<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

                  <!-- Group: First Name & Last Name -->
                  <div class="row">
                    <div class="col-md-6 mb-4">
                      <div class="form-floating mb-3">
                        <input type="text" id="fullName" class="form-control form-control-lg" placeholder="Full Name">
                        <label for="fullName">Full Name</label>
                      </div>
                    </div>
                    <div class="col-md-6 mb-4">
                      <div class="form-floating mb-3">
                        <input type="text" id="userName" class="form-control form-control-lg" placeholder="User Name">
                        <label for="userName">User Name</label>
                      </div>
                    </div>
                  </div>

                  <!-- Group: Password & Gender -->
                  <div class="row">
                    <div class="col-md-6 mb-4 d-flex align-items-center">
                      <div class="form-floating w-100 mb-3">
                        <input type="password" id="password" class="form-control form-control-lg" placeholder="Password">
                        <label for="password">Password</label>
                      </div>
                    </div>
                    <div class="col-md-6 mb-4">
                      <h6 class="mb-2 pb-1">Gender:</h6>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="femaleGender" value="female" checked>
                        <label class="form-check-label" for="femaleGender">Female</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="maleGender" value="male">
                        <label class="form-check-label" for="maleGender">Male</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="otherGender" value="other">
                        <label class="form-check-label" for="otherGender">Other</label>
                      </div>
                    </div>
                  </div>

                  <!-- Group: Email & Phone Number -->
                  <div class="row">
                    <div class="col-md-6 mb-4 pb-2">
                      <div class="form-floating mb-3">
                        <input type="email" id="email" class="form-control form-control-lg" placeholder="Email">
                        <label for="email">Email</label>
                      </div>
                    </div>
                    <div class="col-md-6 mb-4 pb-2">
                      <div class="form-floating mb-3">
                        <input type="tel" id="phoneNumber" class="form-control form-control-lg" placeholder="Phone Number">
                        <label for="phoneNumber">Phone Number</label>
                      </div>
                    </div>
                  </div>

                  <!-- Group: Select Option -->
                  <div class="row">
                    <div class="col-12 mb-4">
                      <div class="form-floating mb-3">
                        <div class="form-floating mb-3">
                          <input type="text" id="address" class="form-control form-control-lg" placeholder="Address">
                          <label for="address">Address</label>
                    </div>
                  </div>

                  <div class="form-check d-flex justify-content-center mb-4">
                    <input class="form-check-input me-2" type="checkbox" id="formCheck">
                    <label class="form-check-label" for="formCheck">
                      I agree to all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                    </label>
                  </div>
                  
                  <div class="d-flex justify-content-center">
                    <button type="button" class="btn btn-lg gradient-custom-4 text-body" style="background-color:palevioletred;">Register</button>
                  </div>
                  
                  <p class="text-center text-muted mt-5 mb-0">
                    Have already an account? <a href="#!" class="fw-bold text-body"><u>Login here</u></a>
                  </p>

                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
>>>>>>> f495d42 (Fix login bug and update folder structure)
</html>
