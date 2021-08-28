<%@page import="java.sql.*"%>
<%@page import="database.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Sign Up</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <script src="https://kit.fontawesome.com/a8a31e2970.js" crossorigin="anonymous"></script>
    </head>

    <body class="for-body">
        <!--form-->

        <div class="container my-5">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-5">
                    <div class="card shadow">
                        <div class="card-header text-center">
                            <div><i class="fas fa-chalkboard-teacher fa-2x"></i></div>
                            <h5>Teacher</h5>
                        </div>
                        <div class="card-body m-3">
                            <!--alert show only for validation-->
                            <div class="alert alert-danger d-none" id="msg-box">
                                <span><i class="far fa-bell"></i></span><span id="msg"></span>
                            </div>
                            <!--alert end-->
                            <form onsubmit="validate()" id="form">
                                <div class=" input-group mb-3">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input type="text" class="form-control" id="name" placeholder="Teacher Name" required>
                                </div>

                                <div class=" input-group mb-3">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" class="form-control" id="email" placeholder="email address" required>
                                </div>

                                <div class=" input-group mb-3">
                                    <span class="input-group-text"><i class="fas fa-address-book"></i></span>
                                    <input type="text" class="form-control" id="address" placeholder="Address" required>
                                </div>
                                <div class=" input-group mb-3">
                                    <span class="input-group-text"><i class="fas fa-city"></i></span>
                                    <input type="text" class="form-control" id="city" placeholder="City" required>
                                </div>
                                <div class=" input-group mb-3">
                                    <span class="input-group-text"><i class="fas fa-landmark"></i></span>
                                    <input type="text" class="form-control" id="landmark" placeholder="Landmark" required>
                                </div>
                                <div class=" input-group mb-3">
                                    <span class="input-group-text"><i class="fas fa-address-card"></i></span>
                                    <input type="number" class="form-control" id="pincode" placeholder="Pincode" required>
                                </div>
                                <div class=" input-group mb-3">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <input type="password" class="form-control" id="password" placeholder="Password" required>
                                </div>

                                <div class=" input-group mb-3">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <input type="password" class="form-control" id="conPassword"
                                           placeholder="Confirm Password" required>
                                </div>

                                <div class="mb-2">
                                    <div class="form-check form-check-inline ps-0">
                                        <label class="form-check-label">Gender :</label>
                                    </div>
                                    <div class=" form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="Male" id="m"required>
                                        Male
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="Female" id="f" required>
                                        Female
                                    </div>
                                </div>

                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="board"><i class="fas fa-school"></i></label>
                                    <select class="form-select" id="quali">
                                        <option value="0">Select Qualification</option>
                                        <option value="Undergraduate">Undergraduate</option>
                                        <option value="Postgraduate">Postgraduate</option>
                                        <option value="Other">Other</option>
                                    </select>
                                    <input type="text" class="form-control" id="degree" placeholder="Qualification">
                                </div>
                                <div class=" input-group mb-3">
                                    <span class="input-group-text"><i class="fas fa-landmark"></i></span>
                                    <input type="text" class="form-control" id="coa_name"  placeholder="Coaching name">
                                </div>
                                <div class="text-center mb-2">
                                    <button type="submit" class="btn btn-primary">Sign in</button>
                                </div>
                            </form>
                            <a href="login.jsp">login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--javascript files-->

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script src="js/signup_te.js" type="text/javascript"></script>
    </body>

</html>