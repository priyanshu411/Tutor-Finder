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
        if (userType.equals("Student") != true)
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
        <title>Student</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/a8a31e2970.js" crossorigin="anonymous"></script>
    </head>
    <body class="for-body">
        <%@include file="navbar/student_navbar.jsp"%>

        <div class="container my-4">
            <form onsubmit="search_teacher()">
                <div class="row justify-content-center">
                    <div class="col-4 input-group mb-4 w-auto">
                        <label class="input-group-text" for="search"><i class="fas fa-search"></i></label>
                        <select class="form-select" onchange="placeholder(this.value)" id="search">
                            <option value="Pincode">Pincode</option>
                            <option value="City">City</option>
                            <option value="Landmark">Landmark</option>
                        </select>
                    </div>

                    <div class="col-md-3 mb-2">
                        <input type="text" class="form-control" id="se_data" placeholder="Enter..." required>
                    </div>
                    <div class=" col-md-2 text-md-start text-center">
                        <button type="submit" class="btn btn-outline-primary">Search</button>
                    </div>
                </div>
            </form>
        </div>


        <section> 
            <div class="container my-4">
                <div class="row justify-content-center" id="teacher">



                </div>
            </div>
        </section>
        <!--javaScript files-->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!--my js file-->
        <script src="js/search.js" type="text/javascript"></script>

    </body>
</html>