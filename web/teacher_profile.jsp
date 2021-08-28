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
        <title>Teacher Profile</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/a8a31e2970.js" crossorigin="anonymous"></script>
    </head>
    <body class="for-body">
        <!--nvbar start-->

        <%@include file="navbar/teacher_navbar.jsp"%>

        <!--navbar end-->


        <!--all menu about edit start-->
        <div class="container my-3">
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
                    <span><i class="fas fa-edit me-2"></i></span>Edit Profile
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#updateProfile">Edit Profile</button></li>
                    <li><button class="dropdown-item" type="button"  data-bs-toggle="modal" data-bs-target="#add-class">Add/Delete Class</button></li>
                    <li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#add-subject">Add/Delete Subjects</button></li>
                </ul>
            </div>
        </div>

        <!--all menu about edit end-->

        <!--profile section start-->
        <section> 
            <div class="container my-4">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-6 shadow for-bg b-radius table-responsive-md mx-2" id="tea-data">

                    </div>
                </div>
            </div>
        </section>

        <!--profile section end-->

        <!--add class start-->

        <div class="modal fade" id="add-class" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Class</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="class_data">

                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="saveClass()" class="btn btn-primary">Save</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--add class end-->

        <!--add subject start-->


        <div class="modal fade" id="add-subject" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Add Subjects</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="subject_data">

                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="saveSubject()" class="btn btn-primary">Save</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--add subject end-->

        <!--update profile modal-->

        <div class="modal fade" id="updateProfile" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Edit Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form onsubmit="validate()">
                        <div class="modal-body">
                            <!--alert show only for validation-->
                            <div class="alert alert-danger d-none" id="msg-box">
                                <span><i class="far fa-bell"></i></span><span id="msg"></span>
                            </div>
                            <!--alert end-->
                            <%
                                DbConnect db = new DbConnect();
                                Connection conn = db.openConnection();
                                String query = "select u.name,u.address,u.city,u.landmark,u.pincode,t.coaching,t.degree from teacher t "
                                        + "inner join users u on t.Temail= u.email "
                                        + "where u.email='" + email + "' and u.userType='teacher'";
                                ResultSet rs = db.getData(conn, query);
                                if (rs.next())
                                {

                            %>
                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <input type="text" class="form-control" id="name" placeholder="Teacher Name" value="<%= rs.getString("name")%>" required>
                            </div>
                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-address-book"></i></span>
                                <input type="text" class="form-control" id="address" placeholder="Address" value="<%= rs.getString("address")%>" required>
                            </div>
                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-city"></i></span>
                                <input type="text" class="form-control" id="city" placeholder="City"  value="<%= rs.getString("city")%>" required>
                            </div>
                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-landmark"></i></span>
                                <input type="text" class="form-control" id="landmark" placeholder="Landmark"  value="<%= rs.getString("landmark")%>" required>
                            </div>
                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-address-card"></i></span>
                                <input type="text" class="form-control" id="pincode" placeholder="Pincode"  value="<%= rs.getString("pincode")%>" required>
                            </div>
                            <div class="mb-2">
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

                            <div class="input-group mb-3">
                                <label class="input-group-text" for="board"><i class="fas fa-school"></i></label>
                                <select class="form-select" id="quali">
                                    <option value="0">Select Qualification</option>
                                    <option value="Undergraduate">Undergraduate</option>
                                    <option value="Postgraduate">Postgraduate</option>
                                    <option value="Other">Other</option>
                                </select>
                                <input type="text" class="form-control" id="degree" placeholder="Qualification"  value="<%= rs.getString("degree")%>" required>
                            </div>
                            <div class=" input-group mb-3">
                                <span class="input-group-text"><i class="fas fa-landmark"></i></span>
                                <input type="text" class="form-control" id="coa_name"  placeholder="Coaching name"  value="<%= rs.getString("coaching")%>">
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--update profile end-->
        <!--javaScript files-->
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <!--<script src="js/bootstrap.min.js" type="text/javascript"></script>-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!--my js file-->
        <script src="js/teacher_profile.js" type="text/javascript"></script>
    </body>

</html>
