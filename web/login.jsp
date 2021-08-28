<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/a8a31e2970.js" crossorigin="anonymous"></script>
    </head>
    <body class="for-body">

        <!--form-->

        <div class="container mt-5">
            <div class="row  justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="card shadow">
                        <div class="card-header text-center bg-info text-white">
                            <i class="fas fa-user"></i> Login Here
                        </div>
                        <div class="card-body">
                            <!--alert show only for validation-->
                            <%
                                String msg = (String) session.getAttribute("message");
                                if (msg != null)
                                {
                            %>
                            <div class="alert alert-danger" id="msg-box">
                                <span><i class="far fa-bell"></i></span><%=msg%><span id="msg"></span>
                            </div>
                            <%
                                session.removeAttribute("message");
                            }
                            else
                            {
                            %>
                            <div class="alert alert-danger d-none" id="msg-box">
                                <span><i class="far fa-bell"></i></span><span id="msg"></span>
                            </div>
                            <%}
                            %>
                            <!--alert end-->
                            <form class="register_form" action="user/login_back.jsp" method="post" onsubmit="return validate()">
                                <div class=" input-group mb-3">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" name="email" placeholder="Email address" class="form-control" id="email" required>
                                </div>

                                <div class=" input-group mb-3">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
                                    <input type="password" name="pass" placeholder="Password" class="form-control" id="password" required>
                                </div>

                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="inputGroupSelect01"><i class="fas fa-users"></i></label>
                                    <select class="form-select" name="userType" id="user">
                                        <option selected>Select User</option>
                                        <option value="Student">Student</option>
                                        <option value="Teacher">Teacher</option>
                                    </select>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                            </form>
                            <a href="home.jsp">Create account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--javascript files-->

        <script src="js/login.js" type="text/javascript"></script>

    </body>
</html>
