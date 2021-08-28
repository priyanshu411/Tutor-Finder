<%
    String name = (String) session.getAttribute("name");
    String userType = (String) session.getAttribute("userType");
    String email = (String) session.getAttribute("email");
    if (name == null || userType == null || email == null)
    {
        response.sendRedirect("login.jsp");
    }
    else if (userType != null)
    {
        if (userType.equals("Teacher") != true)
        {
            response.sendRedirect("login.jsp");
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change password</title>
        <script src="https://kit.fontawesome.com/a8a31e2970.js" crossorigin="anonymous"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="for-body">

        <%@include file="navbar/teacher_navbar.jsp"%>

        <!--change password start-->
        <section>
            <div class="container">
                <div class="row justify-content-center align-items-center" style="height:75vh">
                    <div class="col-lg-5">
                        <div class="card shadow rounded-3">
                            <div class="card-header text-center">
                                Change Password
                            </div>
                            <div class="card-body">

                                <!--alert show only for validation-->
                                <div class="alert alert-info d-none" id="msg-box">
                                    <span><i class="far fa-bell"></i></span><span id="msg"></span>
                                </div>
                                <!--alert end-->
                                <form onsubmit="valid()" id="form">
                                    <div class=" input-group my-3">
                                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                        <input type="password" class="form-control" id="currentPassword" placeholder="Current Password" required>
                                    </div>

                                    <div class=" input-group mb-3">
                                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                        <input type="password" class="form-control" id="newPassword"
                                               placeholder="New Password" required>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--javaScript files-->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>

        <!--my js file-->
        <script src="js/tea_changePass.js" type="text/javascript"></script>


    </body>
</html>
