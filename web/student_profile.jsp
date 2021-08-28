<%@page import="java.sql.*"%>
<%@page import="database.DbConnect"%>
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
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Profile</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/a8a31e2970.js" crossorigin="anonymous"></script>
    </head>
    <body class="for-body">

        <!--home navbar start-->
        <%@include file="navbar/student_navbar.jsp"%>
        <!--home navbar end-->

        <!--edit profile start-->
        <div class="container my-3">
            <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#editProfile"><span><i class="fas fa-edit me-2"></i></span>Edit Profile</button>    
        </div>

        <div class="modal fade" id="editProfile" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Edit Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form onsubmit="validate()">
                        <div class="modal-body">

                            <!--alert show only for validation-->
                            <div class="alert alert-info d-none" id="msg-box">
                                <span><i class="far fa-bell"></i></span><span id="msg"></span>
                            </div>
                            <!--alert end-->

                            <%
                                DbConnect db = new DbConnect();
                                Connection con = db.openConnection();
                                String query1 = "select u.name,u.address,u.city,u.landmark,u.pincode,s.pmobile from student s "
                                        + "inner join users u on s.Semail= u.email "
                                        + "where u.email='" + email + "' and u.userType='student'";
                                ResultSet rs = db.getData(con, query1);
                                if (rs.next())
                                {
                            %>

                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <input type="text" class="form-control" id="name" placeholder="Student Name" value="<%= rs.getString("name")%>" required>
                            </div>

                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                <input type="tel" class="form-control" id="paMob-no" placeholder="Parents Mobile NO" value="<%= rs.getString("pmobile")%>" required >
                            </div>

                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-address-book"></i></span>
                                <input type="text" class="form-control" id="address" placeholder="Address" value="<%= rs.getString("address")%>" required>
                            </div>
                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-city"></i></span>
                                <input type="text" class="form-control" id="city" placeholder="City" value="<%= rs.getString("city")%>" required>
                            </div>
                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-landmark"></i></span>
                                <input type="text" class="form-control" id="landmark" placeholder="Landmark" value="<%= rs.getString("landmark")%>" required>
                            </div>
                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-address-card"></i></span>
                                <input type="number" class="form-control" id="pincode" placeholder="Pincode" value="<%= rs.getString("pincode")%>" required>
                            </div>
                            <%
                                }
                            %>
                            <div class="mb-3">
                                <div class="form-check form-check-inline ps-0">
                                    <label class="form-check-label">Gender :</label>
                                </div>
                                <div class=" form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" value="Male" id="m" required>
                                    Male
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" value="Female" id="f" required>
                                    Female
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>



        <!--edit profile end-->

        <!--profile section start-->
        <section> 
            <div class="container my-4">
                <div class="row mx-2 d-flex justify-content-center">
                    <div class="col-md-6 b-radius shadow for-bg table-responsive" id="stu-data">

                    </div>
                </div>
            </div>
        </section>

        <!--your request section-->
        <section> 
            <div class="container my-4">
                <div class="row mx-2 justify-content-center">

                    <%
                        String query2 = "select * from contact where Semail='" + email + "'";
                        int status = 0;
                        rs = null;
                        rs = db.getData(con, query2);
                        while (rs.next())
                        {
                            status = rs.getInt("Status");
                    %>

                    <div class="col-md-5 mb-3">
                        <div class="card shadow b-radius">
                            <div class="card-header h5 text-white text-center bg-info b-t-radius">
                                <span class="fa fa-user m-2"></span><div><%=rs.getString("Temail")%></div>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless fs-5">
                                    <tbody>
                                        <tr>
                                            <th scope="col">Contact date</th>
                                            <td class="text-info"><%=rs.getString("contact_date")%></td>
                                        </tr>
                                        <tr>
                                            <th scope="col">Contact Info</th>
                                            <td class="text-info"><%=rs.getString("contact_info")%></td>
                                        </tr>
                                        <tr>
                                            <th scope="col">Status</th>
                                                <%
                                                    if (status == 0)
                                                    {
                                                %>
                                            <td class="text-warning">Not Accepted</td>
                                            <%
                                            }
                                            else if (status == 1)
                                            {
                                            %>
                                            <td class="text-success">Accepted</td>
                                            <%
                                                }
                                            %>
                                        </tr>      
                                    <tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <%  }

                    %>

                </div>
            </div>
        </section>
        <%            con.close();
        %>
        <!--profile section end-->


        <!--javaScript files-->
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <!--my js file-->
        <script src="js/student_profile.js" type="text/javascript"></script>
    </body>
</html>