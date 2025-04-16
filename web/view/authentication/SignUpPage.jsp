<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
</html>
